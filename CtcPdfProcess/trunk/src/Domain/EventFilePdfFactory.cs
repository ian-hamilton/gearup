using System;
using System.IO;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.Domain.Enumerator;

namespace Ctc.CtcPdfProcess.Domain
{
    public static class EventFilePdfFactory
    {
        public static IEventFilePdf CreateEventFile(PdfFileDto pdfFileDto)
        {
            IEventFilePdf ret = null;

            String extenstion = Path.GetExtension(pdfFileDto.FileName);
            if (extenstion == null)
                throw new InvalidDataException("File Extension is not valid");

            if(extenstion.Equals(EventFileTypeEnum.Convert(EventFileTypeEnum.EventFileType.Pdf)))
                ret = new EventFilePdf(pdfFileDto);
            else
                throw new InvalidCastException(String.Format("File type of {0} is not supported", extenstion));

            return ret;
        }
    }
}
