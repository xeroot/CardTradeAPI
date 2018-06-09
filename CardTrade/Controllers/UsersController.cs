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
    public class UsersController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET api/User
        public IEnumerable<UserApp> GetUsers()
        {
            IEnumerable<UserApp> users = from u in db.Users
                        select new UserApp
                        {
                            Id = u.id,
                            Name = u.username,
                            Pass = u.pass
                        };
            return users;
        }

        // GET api/User/5
        [ResponseType(typeof(User))]
        public IHttpActionResult GetUser(int id)
        {
            IEnumerable<UserApp> users = from u in db.Users
                                         where u.id == id
                                         select new UserApp
                                         {
                                             Id = u.id,
                                             Name = u.username,
                                             Pass = u.pass
                                         };
            return Ok(users.FirstOrDefault());
        }
        
        // GET api/User/5
        [ResponseType(typeof(User))]
        public IHttpActionResult GetUser(string username, string password)
        {
            IEnumerable<UserApp> users = from u in db.Users
                                         where u.username == username && u.pass == password
                                         select new UserApp
                                         {
                                             Id = u.id,
                                             Name = u.username,
                                             Pass = u.pass
                                         };
            return Ok(users.FirstOrDefault());
        }

        // PUT api/User/5
        public IHttpActionResult PutUser(int id, User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.id)
            {
                return BadRequest();
            }

            db.Entry(user).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
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

        // POST api/User
        [ResponseType(typeof(User))]
        public IHttpActionResult PostUser(User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Users.Add(user);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = user.id }, user);
        }

        // DELETE api/User/5
        [ResponseType(typeof(User))]
        public IHttpActionResult DeleteUser(int id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            db.Users.Remove(user);
            db.SaveChanges();

            return Ok(user);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.id == id) > 0;
        }
    }
}