using System;
using System.Collections.Generic;
using log4net;

namespace Ctc.CtcPdfProcess.Service
{
    public static class IoManager
    {
        //private static string WIP_DIR = "/wip";
        //private static string WATCH_DIR = "/wip/watch";
        //private static string WORK_DIR_ROOT = "/wip/work";
        //private static string OUT_DIR = "/out";

        private static readonly ILog _log = LogManager.GetLogger(typeof(IoManager));

        private static string CONFIG_WIP_DIR = "WIP_DIR";
        private static string CONFIG_WATCH_DIR = "WATCH_DIR";
        private static string CONFIG_WORK_DIR_ROOT = "WORK_DIR";
        private static string OUT_DIR = @"\out";

        public enum DirectoryType
        {
            WATCH,
            WORK,
            OUT,
            WIP
        }

        public static void Setup()
        {
            if (!System.IO.Directory.Exists(getDirectoryConfiguration(DirectoryType.WIP)))
                System.IO.Directory.CreateDirectory(getDirectoryConfiguration(DirectoryType.WIP));
            if (!System.IO.Directory.Exists(getDirectoryConfiguration(DirectoryType.WATCH)))
                System.IO.Directory.CreateDirectory(getDirectoryConfiguration(DirectoryType.WATCH));
            if (!System.IO.Directory.Exists(getDirectoryConfiguration(DirectoryType.WORK)))
                System.IO.Directory.CreateDirectory(getDirectoryConfiguration(DirectoryType.WORK));
        }


        private static string getDirectoryConfiguration(DirectoryType directoryType)
        {

            switch (directoryType)
            {
                case DirectoryType.WATCH:
                    return System.Configuration.ConfigurationManager.AppSettings[CONFIG_WATCH_DIR];
                case DirectoryType.WORK:
                    return System.Configuration.ConfigurationManager.AppSettings[CONFIG_WORK_DIR_ROOT];
                case DirectoryType.OUT:
                    return OUT_DIR;
                case DirectoryType.WIP:
                    return System.Configuration.ConfigurationManager.AppSettings[CONFIG_WIP_DIR];
                default:
                    throw new ArgumentException(String.Format("Invalid directory type: {0}", directoryType.ToString()));
            }

        }


        public static string getWatchDirectory()
        {
            return getDirectoryConfiguration(IoManager.DirectoryType.WATCH);
        }

        public static void createOutDirectory(string fileName, string path)
        {
            System.IO.Directory.CreateDirectory(getOutDirectory(fileName, path));            
        }

        public static void moveWorkingFile(string fileName, string path)
        {            
            DateTime stamp = DateTime.Now;
            while (true)
            {

                try
                {
                    System.Threading.Thread.Sleep(5000);

                    System.IO.File.Copy(path,
                        String.Concat(getWorkDirectory(fileName, path),
                        @"\",
                        fileName));
                    break;
                }
                catch 
                {
                    TimeSpan span = DateTime.Now.Subtract(stamp); // endTime.Subtract(startTime);
                    if (span.Seconds > 120)
                        throw new ApplicationException("File lock wait timed out");
                }

            }

        }


        public static string getOutDirectory(string fileName, string path)
        {            

            string outDir = String.Concat(getWorkDirectory(fileName, path),
                           IoManager.getDirectoryConfiguration(IoManager.DirectoryType.OUT));

            return outDir;
        }

        public static string getWorkDirectory(string fileName, string path)
        {
            string workDir = String.Concat(
               IoManager.getDirectoryConfiguration(IoManager.DirectoryType.WORK),
                   @"\",
                    System.IO.Path.GetFileNameWithoutExtension(fileName));

            return workDir;
        }


        public static void dropDirectory(string fileName, string path, bool deleteCompletedFile)
        {
            try
            {
                System.IO.Directory.Delete(getWorkDirectory(fileName, path), true);
                if (deleteCompletedFile)
                    System.IO.File.Delete(path);
            }
            catch { }
        }
    }
}
