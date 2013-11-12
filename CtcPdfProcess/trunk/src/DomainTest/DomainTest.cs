using System;
using log4net;
using NUnit.Framework;
using Ctc.CtcPdfProcess.DataTransfer;
using Ctc.CtcPdfProcess.Domain;

namespace Ctc.CtcPdfProcess.DomainTest
{
    [TestFixture]
    public class DomainTest
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(DomainTest));

        [Test]
        public void testDomainDocLoad()
        {
            log4net.Config.XmlConfigurator.Configure();

            PdfFileDto pf = new PdfFileDto()
            {
                FileName = "test.pdf",
                DirectoryPath = "files",
                OutputDirectory = "files\\out"
            };

            try
            {

                IEventFilePdf ef = EventFilePdfFactory.CreateEventFile(pf);
                ef.processFile(new AnnotFormatter(new AllowableCharacters(), new IgnorableAnnotationExtractor()));

            }
            catch (Exception ex)
            {
                _log.Error(string.Format("Message: {0} \n Stack: {1}", new object[] { ex.Message, ex.StackTrace }));
                throw ex;
            }

        }


        [Test]
        public void testDomainUploadDoc()
        {
            log4net.Config.XmlConfigurator.Configure();

             PdfFileDto pf = new PdfFileDto()
            {
                FileName = "59585.pdf",
                DirectoryPath = "files",
                OutputDirectory = "files\\out"
            };


            try
            {

                EventFile eventFile = new EventFile();
                eventFile.processEventFile(pf);

            }
            catch (Exception ex)
            {
                _log.Error(string.Format("Message: {0} \n Stack: {1}", new object[] { ex.Message, ex.StackTrace }));
                throw ex;
            }

        }
    }
}
