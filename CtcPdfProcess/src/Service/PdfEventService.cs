using System;
using System.IO;
using System.Collections.Generic;
using log4net;
using log4net.Config;
using Ctc.CtcPdfProcess.Domain;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.DataAccess.Repository;


namespace Ctc.CtcPdfProcess.Service
{
    public class PdfEventService : IPdfEventService
    {
        private IEventFileRepository _eventFileRepository;
        private static readonly ILog _log = LogManager.GetLogger(typeof(PdfEventService));

        public PdfEventService()
            : this(new EventFileRepository())
        { }

        public PdfEventService(IEventFileRepository eventFileRepository)
        {
            this._eventFileRepository = eventFileRepository;
        }

        public void InitiateFileChanged(FileSystemEventArgs e)
        {
            _log.Info("File: " + e.FullPath);

            try
            {

                IoManager.createOutDirectory(e.Name, e.FullPath);
                IoManager.moveWorkingFile(e.Name, e.FullPath);

                ProcessPdfFile(new PdfFileDto()
                {
                    DirectoryPath = IoManager.getWorkDirectory(e.Name, e.FullPath),
                    FileName = e.Name,
                    OutputDirectory = IoManager.getOutDirectory(e.Name, e.FullPath)
                }, true);

            }
            catch (Exception ex)
            {
                _log.Error(ex.Message, ex);
            }
            finally
            {
                IoManager.dropDirectory(e.Name, e.FullPath, true);
            }


        }

        public void ProcessPdfFile(PdfFileDto pdfFileDto, bool deleteCompletedFile)
        {

            _log.Info(String.Format("--------------- Start for file {0} ------------", pdfFileDto.FileName));

            IEventFilePdf ef = EventFilePdfFactory.CreateEventFile(pdfFileDto);
            List<PdfFileDto> outFileList = ef.processFile(new AnnotFormatter(new AllowableCharacters(), new IgnorableAnnotationExtractor()));

            foreach (PdfFileDto outFileDto in outFileList)
            {
                EventFile eventFile = new EventFile();
                _eventFileRepository.loadEventFile(eventFile.processEventFile(outFileDto));
            }

            _log.Info(String.Format("--------------- Success for file {0} ------------", pdfFileDto.FileName));

        }
    }
}
