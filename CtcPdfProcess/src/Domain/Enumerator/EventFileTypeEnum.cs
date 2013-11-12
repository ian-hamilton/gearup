using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.Domain.Enumerator
{
    public class EventFileTypeEnum
    {
        public enum EventFileType
        {
            Pdf,
            Tiff
        }

        public static string Convert(EventFileType type)
        {
            switch (type)
            {
                case EventFileType.Pdf:
                    return ".pdf";
                case EventFileType.Tiff:
                    return ".tif";
                default:
                    throw new Exception(String.Format("Provided file type of {0} does not exist", type.ToString()));
            }
        }
    }
}
