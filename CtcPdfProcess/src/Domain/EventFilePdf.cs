using System;
using System.Text;
using System.Collections.Generic;
using log4net;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.Domain.Dictionary;
using Ctc.CtcPdfProcess.Domain.Collections;
using iTextSharp.text.pdf;

namespace Ctc.CtcPdfProcess.Domain
{
    public class EventFilePdf : IEventFilePdf
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(EventFilePdf));

        public string FileName { get; set; }
        public string DirectoryPath { get; set; }
        public string OutputDirectoryPath { get; set; }

        private List<PdfFileDto> _eventFilePdfList;

        public List<PdfFileDto> EventFilePdfList
        {
            get { return _eventFilePdfList; }
        }

        private EventFilePdf() { }

        public EventFilePdf(PdfFileDto pdfFileDto)
        {
            this.FileName = pdfFileDto.FileName;
            this.DirectoryPath = pdfFileDto.DirectoryPath;
            this.OutputDirectoryPath = pdfFileDto.OutputDirectory;

            _eventFilePdfList = new List<PdfFileDto>();
        }

        public List<PdfFileDto> processFile(AnnotFormatter annotFormatter)
        {
            EventIdList currentEventIdList = new EventIdList();
            string path = new StringBuilder(DirectoryPath).Append("\\").Append(FileName).ToString();
            _log.Debug("Number of pages: " + path);

            PdfReader reader = new PdfReader(path);
            _log.Debug("Version: " + reader.PdfVersion);
            _log.Debug(String.Format("Number of pages: {0}", reader.NumberOfPages));

            try
            {
                EventPdfPageDictionary eventDictionary = new EventPdfPageDictionary();

                /* reading through each page
                 * */
                for (int i = 0; i <= reader.NumberOfPages; i++)
                {
                    EventIdList pageEventIdList = new EventIdList();
                    int id = 0;
                    PdfArray annotarray = null;

                    PdfDictionary pagedic = reader.GetPageN(i);
                    if (pagedic != null)
                        annotarray = pagedic.GetAsArray(PdfName.ANNOTS);

                    /* read through annotations on the page itself
                     * if none returned, should mean try next page
                     * */
                    if (annotarray != null && annotarray.Size != 0)
                    {
                        for (int a = 0; a <= annotarray.Size - 1; a++)
                        {
                            PdfDictionary annotDictionary = (PdfDictionary)PdfReader.GetPdfObject(annotarray[a]);
                            PdfString pdfString = (PdfString)PdfReader.GetPdfObject(annotDictionary.Get(PdfName.CONTENTS));
                            _log.Debug("Annot PDF String: " + pdfString);

                            bool test = false;
                            if (pdfString != null)
                            {
                                annotFormatter.executeFormat(pdfString.ToString());

                                foreach (string s in annotFormatter.FormattedStringArray)
                                {
                                    test = Int32.TryParse(s, out id);
                                    if (test)
                                        pageEventIdList.Add(id);

                                    _log.Debug(String.Format("test: {0}", test.ToString()));
                                    _log.Debug(String.Format("pageEventId: {0}", id));
                                }
                            }
                        }
                    }

             
                    /*this case the pages is a continuation 
                  * of the current event id and simply needs
                  * to be added to the list
                  * */
                    if (annotFormatter.IgnoreFlag)
                    {
                        //do nothing
                    }
                    else if (pageEventIdList.Count > 0 && !pageEventIdList.Equals(currentEventIdList))
                    {
                        currentEventIdList = new EventIdList(pageEventIdList);

                        foreach (int e in currentEventIdList)
                            eventDictionary.addPage(e, i);
                    }
                    else if (pageEventIdList.Count == 0)
                    {
                        foreach (int e in currentEventIdList)
                            eventDictionary.addPage(e, i);
                    }                   
             

                }

                _log.Debug(String.Format("Number of dictionary enteries: {0}", eventDictionary.Keys.Count));
                foreach (int key in eventDictionary.Keys)
                {
                    _log.Debug(String.Format("Key: {0}", key));

                    string outPath = String.Concat(this.OutputDirectoryPath, "\\", key.ToString(), ".pdf");
                    if (!System.IO.Directory.Exists(OutputDirectoryPath))
                        System.IO.Directory.CreateDirectory(OutputDirectoryPath);

                    PdfCopy copier = null;
                    iTextSharp.text.Document doc = null;

                    try
                    {
                        doc = new iTextSharp.text.Document(reader.GetPageSizeWithRotation(1));
                        copier = new PdfCopy(doc, new System.IO.FileStream(outPath, System.IO.FileMode.OpenOrCreate));                        
                        copier.CloseStream = true;
                        doc.Open();

                        IList<int> pages = eventDictionary[key];
                        foreach (int pageNumber in pages)
                        {
                            copier.AddPage(copier.GetImportedPage(reader, pageNumber));
                        }

                        _eventFilePdfList.Add(new PdfFileDto()
                        {
                            DirectoryPath = System.IO.Path.GetDirectoryName(outPath),
                            OutputDirectory = System.IO.Path.GetDirectoryName(outPath),
                            FileName = System.IO.Path.GetFileName(outPath)
                        });
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }
                    finally
                    {
                        if (doc != null && doc.IsOpen())
                            doc.Close();
                        if (copier != null)
                        {
                            try
                            {
                                copier.Close();
                            }
                            catch (Exception e) { _log.Error(e.Message, e); }
                        }
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if(reader != null && reader.IsOpenedWithFullPermissions)
                    reader.Close();
            }


            return _eventFilePdfList;
        }

    }
}
