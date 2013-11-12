using System;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.Service;


namespace Ctc.CtcPdfProcess.ConsoleClient
{
    class Program
    {
        static void Main(string[] args)
        {         
           
            bool running = true;

            while (running)
            {
                    Console.WriteLine();
                    Console.WriteLine();
                    Console.WriteLine("Please choose one of the following operations:");
                    Console.WriteLine("(1) Process file");
                    Console.WriteLine("(2) Exit");
                    string operation = Console.ReadLine();

                    switch (operation)
                    {
                        case "1":
                            handleFileProcess();
                            break;
                        case "2":
                            running = false;
                            break;
                        default:
                            Console.Write("Leave blank and press <enter> to exit: ");
                            if (Console.ReadLine() == string.Empty)
                                running = false;
                            break;
                    }
            }
        }

        private static void handleFileProcess()
        {
            string useDefaults = String.Empty;

            while (!useDefaults.ToLower().Equals("y")
                    && !useDefaults.ToLower().Equals("n"))
            {
                Console.WriteLine("Use Defaults? (Y/N): ");
                useDefaults = Console.ReadLine().Trim();
            }

            PdfFileDto pf = null;
            if (useDefaults.ToLower().Equals("y"))
            {
                pf = new PdfFileDto()
                {
                    FileName = "test.pdf",
                    DirectoryPath = "C:\\temp",
                    OutputDirectory = "C:\\temp\\out"
                };
            }
            else
            {
                pf = new PdfFileDto();
                Console.WriteLine("Enter File Name: ");
                pf.FileName = Console.ReadLine().Trim();
                Console.WriteLine("Enter Directory Path: ");
                pf.DirectoryPath = Console.ReadLine().Trim();
                Console.WriteLine("Enter Output Path: ");
                pf.DirectoryPath = Console.ReadLine().Trim();
            }

            IPdfEventService service = new PdfEventService();
            service.ProcessPdfFile(pf, false);
        }

        //private static void handleDirectoryProcess()
        //{

        //    string useDefaults = String.Empty;
        //    string directoryPath = "C:\\temp";

        //    while (!useDefaults.ToLower().Equals("y")
        //            && !useDefaults.ToLower().Equals("n"))
        //    {
        //        Console.WriteLine("Use Defaults? (Y/N): ");
        //        useDefaults = Console.ReadLine().Trim();
        //    }

        //     if (useDefaults.ToLower().Equals("n"))
        //     {
        //         Console.WriteLine("Please enter path: ");
        //         directoryPath = Console.ReadLine().Trim();
        //     }

        //     IPdfEventService service = new PdfEventService();
        //     service.ProcessPdfDirectory(directoryPath, false);

        //}
    }
}
