using System;
using System.Collections.Generic;
using iTextSharp.text.pdf;

namespace Ctc.CtcPdfProcess.Domain.Dictionary
{
    public class EventPdfPageDictionary : Dictionary<int, IList<int>>
    {
        public void addPage(int eventId, int pdfPageNumber)
        {
            IList<int> pages = null;

            if(this.ContainsKey(eventId))
                pages = this[eventId];
            else
            {
                pages = new List<int>();
                this.Add(eventId, pages);
            }

            pages.Add(pdfPageNumber);
        }
    }
}
