using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.DataTransfer
{
    public class PdfFileDto
    {

        public PdfFileDto() { }

        public PdfFileDto(string fileName, string directoryPath)
        {
            this.FileName = fileName;
            this.DirectoryPath = directoryPath;
        }

        public string FileName { get; set; }
        public string DirectoryPath { get; set; }
        public string OutputDirectory { get; set; }
    }
}
