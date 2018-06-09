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
    public class MechanicsController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET: api/Mechanics
        public IHttpActionResult GetMechanics()
        {
            var mechanics = from i in db.Mechanics
                            select new MechanicsApp
                            {
                                Id = i.id,
                                Name = i.name
                            };
            return Ok(mechanics);
        }

        // GET: api/Mechanics/5
        [ResponseType(typeof(Mechanic))]
        public IHttpActionResult GetMechanic(int id)
        {
            Mechanic mechanic = db.Mechanics.Find(id);
            if (mechanic == null)
            {
                return NotFound();
            }

            return Ok(mechanic);
        }

        // PUT: api/Mechanics/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMechanic(int id, Mechanic mechanic)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != mechanic.id)
            {
                return BadRequest();
            }

            db.Entry(mechanic).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MechanicExists(id))
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

        // POST: api/Mechanics
        [ResponseType(typeof(Mechanic))]
        public IHttpActionResult PostMechanic(Mechanic mechanic)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Mechanics.Add(mechanic);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = mechanic.id }, mechanic);
        }

        // DELETE: api/Mechanics/5
        [ResponseType(typeof(Mechanic))]
        public IHttpActionResult DeleteMechanic(int id)
        {
            Mechanic mechanic = db.Mechanics.Find(id);
            if (mechanic == null)
            {
                return NotFound();
            }

            db.Mechanics.Remove(mechanic);
            db.SaveChanges();

            return Ok(mechanic);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MechanicExists(int id)
        {
            return db.Mechanics.Count(e => e.id == id) > 0;
        }
    }
}