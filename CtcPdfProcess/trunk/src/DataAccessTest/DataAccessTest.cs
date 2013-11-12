using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using NUnit.Framework;
using Ctc.CtcPdfProcess.DataAccess.dao;
using log4net;
using System.Transactions;

namespace Ctc.CtcPdfProcess.DataAccessTest
{
    [TestFixture]
    public class DataAccessTest
    {
        private static readonly ILog _log = LogManager.GetLogger(typeof(DataAccessTest));

        [Test]
        public void testCRUD()
        {
            log4net.Config.XmlConfigurator.Configure();

            using (ctcEntities ctx = new ctcEntities())
            {
                using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
                {
                    file_repository repo = new file_repository()
                    {
                        file_name = "test.txt",
                        status_flag = 1,
                        row_created = DateTime.Now,
                        row_updated = DateTime.Now,
                        row_created_by_user_id = "nunit",
                        row_updated_by_user_id = "nunit"
                    };

                    event_file ef = new event_file()
                    {
                        event_id = 1,
                        file_repository = repo,
                        status_flag = 1,
                        row_created = DateTime.Now,
                        row_updated = DateTime.Now,
                        row_created_by_user_id = "nunit",
                        row_updated_by_user_id = "nunit"
                    };


                    try
                    {
                        ctx.event_file.AddObject(ef);
                        ctx.SaveChanges();

                        long id = ef.file_repository.file_repository_id;

                        Assert.NotNull(id);

                        throw new Exception("Rollback Exception");

                        //scope.Complete();

                    }
                    catch (Exception ex)
                    {
                        _log.Debug("Exception", ex);
                    }
                   

                }
                
            }
        }
    }
}
