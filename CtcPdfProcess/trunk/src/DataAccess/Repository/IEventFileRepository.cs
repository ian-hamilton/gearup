using System;
using Ctc.CtcPdfProcess.DataTransfer;


namespace Ctc.CtcPdfProcess.DataAccess.Repository
{
    public interface IEventFileRepository
    {
        void loadEventFile(EventFileDto eventFileDto);
    }
}
