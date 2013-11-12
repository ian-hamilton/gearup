using System;
using System.IO;
using Ctc.CtcPdfProcess.DataTransfer;

namespace Ctc.CtcPdfProcess.Service
{
    public interface IPdfEventService
    {
        void InitiateFileChanged(FileSystemEventArgs e);
        void ProcessPdfFile(PdfFileDto pdfFileDto, bool deleteCompletedFile);
    }
}
