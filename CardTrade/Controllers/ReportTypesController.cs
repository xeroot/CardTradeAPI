using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CardTrade.Models;

namespace CardTrade.Controllers
{
    public class ReportTypesController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET: api/ReportTypes
        public IHttpActionResult GetReportTypes()
        {
            var reportTypes = from i in db.ReportTypes
                             select new ReportTypeApp
                             {
                                 Id = i.id,
                                 Description = i.description
                             };
            return Ok(reportTypes);
        }

        // GET: api/ReportTypes/5
        [ResponseType(typeof(ReportType))]
        public IHttpActionResult GetReportType(int id)
        {
            ReportType reportType = db.ReportTypes.Find(id);
            if (reportType == null)
            {
                return NotFound();
            }

            return Ok(reportType);
        }

        // PUT: api/ReportTypes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutReportType(int id, ReportType reportType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != reportType.id)
            {
                return BadRequest();
            }

            db.Entry(reportType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReportTypeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ReportTypes
        [ResponseType(typeof(ReportType))]
        public IHttpActionResult PostReportType(ReportType reportType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ReportTypes.Add(reportType);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = reportType.id }, reportType);
        }

        // DELETE: api/ReportTypes/5
        [ResponseType(typeof(ReportType))]
        public IHttpActionResult DeleteReportType(int id)
        {
            ReportType reportType = db.ReportTypes.Find(id);
            if (reportType == null)
            {
                return NotFound();
            }

            db.ReportTypes.Remove(reportType);
            db.SaveChanges();

            return Ok(reportType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ReportTypeExists(int id)
        {
            return db.ReportTypes.Count(e => e.id == id) > 0;
        }
    }
}