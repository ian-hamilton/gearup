using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net;
using Ctc.CtcPdfProcess.DataAccess.Repository;
using Ctc.CtcPdfProcess.DataTransfer;

namespace Ctc.CtcPdfProcess.Service
{
    public class Bootstrapper
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(Bootstrapper));
        private static FileSystemWatcher _watcher;

        public void WireUp()
        {
            try
            {

                IoManager.Setup();

                string path = IoManager.getWatchDirectory();
                _log.Info("Watchers Path: " + path);

                _watcher = new FileSystemWatcher(path);

                _watcher.NotifyFilter = NotifyFilters.FileName;  
                _watcher.Created += new FileSystemEventHandler(OnCreated);

                // Begin watching.
                _watcher.EnableRaisingEvents = true;

                _log.Info("Listening....");
            }
            catch (Exception e)
            {
                _log.WarnFormat("Exception Message: {0}", e.Message);
                _log.WarnFormat("Stack Trace: /n{0}", e.StackTrace);
                throw e;
            }
        }

        private static void OnCreated(object source, FileSystemEventArgs e)
        {
            _log.Info("Start OnChanged: " + e.Name);
            IPdfEventService service = new PdfEventService(new EventFileRepository());
            service.InitiateFileChanged(e);
        }

        public void TearDown()
        {
            if(_watcher != null)
                _watcher.Dispose();
        }
  
    }
}
