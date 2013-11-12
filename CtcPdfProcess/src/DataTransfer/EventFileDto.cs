using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ctc.CtcPdfProcess.DataTransfer
{
    public class EventFileDto
    {
        public int EventId { get; set; }
        public string FileName { get; set; }
        public byte[] fileByteArray { get; set; }
    }
}
