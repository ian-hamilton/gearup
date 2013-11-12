using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using log4net;
using log4net.Config;

namespace Ctc.CtcPdfProcess.WindowsService
{
    static class Program
    {       
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            AppDomain.CurrentDomain.Load("CtcPdfProcess.DataAccess");
            AppDomain.CurrentDomain.Load("CtcPdfProcess.DataTransfer");

            ServiceBase[] ServicesToRun = new ServiceBase[]
                                              {
                                                  new Service
                                                      {
                                                          AutoLog = true,
                                                          ServiceName = "CtcPdfProcess",
                                                          CanPauseAndContinue = false,
                                                          CanStop = true
                                                      }
                                              };

            ServiceBase.Run(ServicesToRun);
        }
    }
}
