using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.DataAccess.Repository;

namespace Ctc.CtcPdfProcess.Domain
{
    public class EventFile
    {       
        public EventFile()
        { }

        public EventFileDto processEventFile(PdfFileDto pdfFileDto)
        {
            EventFileDto eventFileDto = new EventFileDto();
            string path = new StringBuilder(pdfFileDto.OutputDirectory).Append("\\").Append(pdfFileDto.FileName).ToString();

            string eventFromFileName = System.IO.Path.GetFileNameWithoutExtension(path);

            eventFileDto.EventId = Int32.Parse(eventFromFileName);
            eventFileDto.FileName = pdfFileDto.FileName;
            eventFileDto.fileByteArray = this.ReadFileInBytes(path);

            return eventFileDto;
        }

        private byte[] ReadFileInBytes(string filePath)
        {
            byte[] buffer;
            FileStream fileStream = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            try
            {
                int length = (int)fileStream.Length;  
                buffer = new byte[length];          
                int count;                            
                int sum = 0;                          

                /*
                 * read until Read method returns 0 (end of the stream has been reached)
                 * */
                while ((count = fileStream.Read(buffer, sum, length - sum)) > 0)
                    sum += count;  // sum is a buffer offset for next reading
            }
            finally
            {
                fileStream.Close();
            }
            return buffer;
        }
    }
}
