using System;
using System.Collections.Generic;
using System.Linq;
using Ctc.CtcPdfProcess.DataAccess.dao;

namespace Ctc.CtcPdfProcess.DataAccess.Repository
{
    public class EventFileRepository : IEventFileRepository
    {
        public void loadEventFile(DataTransfer.EventFileDto eventFileDto)
        {
            if (!checkForEvent(eventFileDto.EventId))
                throw new Exception(String.Format("Event {0} does not exist. File was not uploaded.", eventFileDto.EventId));

            Int64 id = insertFileIntoRepository(eventFileDto.fileByteArray, eventFileDto.FileName);
            insertIntoEventFile(eventFileDto.EventId, id);
        }

         public bool checkForEvent(Int64 eventId)
        {
            bool found = false;

            using (ctcEntities ctx = new ctcEntities())
            {
                IQueryable<events> result = ctx.events.Where(e => e.event_id == eventId);

                IList<events> list = result.ToList<events>();
                if ( list.Count > 0)
                    found = true;
            }

            return found;
        }

        public Int64 insertFileIntoRepository(byte[] byteArray, string fileName)
        {
            Int64 ret;
            using (ctcEntities ctx = new ctcEntities())
            {

                file_repository fileRepository = new file_repository();

                fileRepository.file_name = fileName;
                fileRepository.file_blob = byteArray;
                fileRepository.row_created = DateTime.Now;
                fileRepository.row_created_by_user_id = "csystem";
                fileRepository.row_updated = DateTime.Now;
                fileRepository.row_updated_by_user_id = "csystem";
                fileRepository.status_flag = 1;

                ctx.AddTofile_repository(fileRepository);
                ctx.SaveChanges();

                 ret = fileRepository.file_repository_id;
            }

            return ret;
        }

        public Int64 insertIntoEventFile(Int64 eventId, Int64 fileRepositoryId)
        {
            Int64 ret;
            using (ctcEntities ctx = new ctcEntities())
            {
                event_file ef = new event_file();

                ef.event_id = eventId;
                ef.file_repository_id = fileRepositoryId;
                ef.row_created = DateTime.Now;
                ef.row_created_by_user_id = "csystem";
                ef.row_updated = DateTime.Now;
                ef.row_updated_by_user_id = "csystem";
                ef.status_flag = 1;

                ctx.AddToevent_file(ef);
                ctx.SaveChanges();

                ret = ef.event_file_id;
            }

            return ret;
        }

    }
}
