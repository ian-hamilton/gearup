using System;
using System.Collections.Generic;
using Ctc.CtcPdfProcess.DataTransfer;

namespace Ctc.CtcPdfProcess.Domain
{
    public interface IEventFilePdf
    {
        List<PdfFileDto> processFile(AnnotFormatter annotFormatter);
    }
}
