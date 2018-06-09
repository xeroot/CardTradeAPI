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
    public class ProfilesController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET api/Profiles
        public IEnumerable<ProfileApp> GetProfiles()
        {
            db.Configuration.ProxyCreationEnabled = false;
            var profiles = from p in db.Profiles
                           select new ProfileApp
                           {
                               Address = p.address,
                               Age = p.age,
                               Coins = p.coins,
                               Email = p.email,
                               Id = p.id,
                               IdUser = p.idUser,
                               Name = p.name,
                               Phone = p.phone,
                               Rating = p.rating,
                               Sex = p.sex,
                               Status = p.status,
                               Type = p.type
                           };
            return profiles;
        }

        // GET api/Profiles/5
        [ResponseType(typeof(Profile))]
        public IHttpActionResult GetProfile(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            var profiles = from p in db.Profiles
                           where p.id == id
                           select new ProfileApp
                           {
                               Address = p.address,
                               Age = p.age,
                               Coins = p.coins,
                               Email = p.email,
                               Id = p.id,
                               IdUser = p.idUser,
                               Name = p.name,
                               Phone = p.phone,
                               Rating = p.rating,
                               Sex = p.sex,
                               Status = p.status,
                               Type = p.type
                           };
            return Ok(profiles.FirstOrDefault());
        }

        // PUT api/Profiles/5
        public IHttpActionResult PutProfile(int id, Profile profile)
        {
            db.Configuration.ProxyCreationEnabled = false;
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != profile.id)
            {
                return BadRequest();
            }

            db.Entry(profile).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProfileExists(id))
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

        // POST api/Profiles
        [ResponseType(typeof(Profile))]
        public IHttpActionResult PostProfile(Profile profile)
        {
            db.Configuration.ProxyCreationEnabled = false;
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Profiles.Add(profile);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = profile.id }, profile);
        }

        // DELETE api/Profiles/5
        [ResponseType(typeof(Profile))]
        public IHttpActionResult DeleteProfile(int id)
        {
            Profile profile = db.Profiles.Find(id);
            if (profile == null)
            {
                return NotFound();
            }

            db.Profiles.Remove(profile);
            db.SaveChanges();

            return Ok(profile);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProfileExists(int id)
        {
            return db.Profiles.Count(e => e.id == id) > 0;
        }
    }
}