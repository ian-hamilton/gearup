using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Threading;
using log4net;
using Ctc.CtcPdfProcess.Service;

namespace Ctc.CtcPdfProcess.WindowsService
{
    public partial class Service : ServiceBase
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(Service));

        private readonly ManualResetEvent _stop = new ManualResetEvent(false);
        private readonly ManualResetEvent _stopped = new ManualResetEvent(false);

        private ServiceStatus _serviceStatus;
        private bool _stopInProgress;


        public Service()
        {
            log4net.Config.XmlConfigurator.Configure();

            _log.Info("Service creating...");

            InitializeComponent();
        }


        [DllImport("ADVAPI32.DLL", EntryPoint = "SetServiceStatus")]
        public static extern bool
            SetServiceStatus(IntPtr hServiceStatus, ref ServiceStatus lpServiceStatus);

        protected override void OnStart(string[] args)
        {
            SetServiceStatus(State.SERVICE_START_PENDING);
            _log.Info("Service start pending...");

            // set path to executing assembly  
            Directory.SetCurrentDirectory(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));

            var thread = new Thread(Run);
            thread.Start();

            SetServiceStatus(State.SERVICE_RUNNING);
            _log.Info("Service running...");
        }

        private void Run()
        {
            try
            {
                var bootstrapper = new Bootstrapper();

                bootstrapper.WireUp();

                // block thread
                _stop.WaitOne();

                _log.Info("Service Teardown...");
                bootstrapper.TearDown();

                // signify to stop thread to move on
                _stopped.Set();
            }
            catch (Exception e)
            {
                _log.WarnFormat("Service had an exception - {0} ", e.Message);

                _stopped.Set();

                if (!_stopInProgress)
                {
                    Stop();
                }

            }
        }

        protected void Stop()
        {
            SetServiceStatus(State.SERVICE_STOP_PENDING);
            _log.Debug("Service stopping...");

            // signify to run thread to stop
            _stop.Set();

            // block until service is stopped
            while (!_stopped.WaitOne(5000))
            {
                _log.Debug("Requesting an extra five seconds to shutdown...");
                RequestAdditionalTime(5000);
            }

            SetServiceStatus(State.SERVICE_STOPPED);
            _log.Debug("Service stopped.");

            // Indicate a successful exit.
            ExitCode = 0;
        }

        private void SetServiceStatus(State status)
        {
            _serviceStatus.CurrentState = Convert.ToInt32(status);
            SetServiceStatus(ServiceHandle, ref _serviceStatus);
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct ServiceStatus
        {
            public int ServiceType;
            public int CurrentState;
            public int ControlsAccepted;
            public int Win32ExitCode;
            public int ServiceSpecificExitCode;
            public int CheckPoint;
            public int WaitHint;
        }


        public enum State
        {
            SERVICE_STOPPED = 0x00000001,
            SERVICE_START_PENDING = 0x00000002,
            SERVICE_STOP_PENDING = 0x00000003,
            SERVICE_RUNNING = 0x00000004,
            SERVICE_CONTINUE_PENDING = 0x00000005,
            SERVICE_PAUSE_PENDING = 0x00000006,
            SERVICE_PAUSED = 0x00000007,
        }
    }
}
