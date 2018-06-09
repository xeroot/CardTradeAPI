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
    public class RaritiesController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET: api/Rarities
        public IHttpActionResult GetRarities()
        {
            var rarities = from i in db.Rarities
                         select new RarityApp
                         {
                             Id = i.id,
                             Description = i.description
                         };
            return Ok(rarities);
        }

        // GET: api/Rarities/5
        [ResponseType(typeof(Rarity))]
        public IHttpActionResult GetRarity(int id)
        {
            Rarity rarity = db.Rarities.Find(id);
            if (rarity == null)
            {
                return NotFound();
            }

            return Ok(rarity);
        }

        // PUT: api/Rarities/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutRarity(int id, Rarity rarity)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != rarity.id)
            {
                return BadRequest();
            }

            db.Entry(rarity).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RarityExists(id))
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

        // POST: api/Rarities
        [ResponseType(typeof(Rarity))]
        public IHttpActionResult PostRarity(Rarity rarity)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Rarities.Add(rarity);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = rarity.id }, rarity);
        }

        // DELETE: api/Rarities/5
        [ResponseType(typeof(Rarity))]
        public IHttpActionResult DeleteRarity(int id)
        {
            Rarity rarity = db.Rarities.Find(id);
            if (rarity == null)
            {
                return NotFound();
            }

            db.Rarities.Remove(rarity);
            db.SaveChanges();

            return Ok(rarity);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RarityExists(int id)
        {
            return db.Rarities.Count(e => e.id == id) > 0;
        }
    }
}