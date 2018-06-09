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
    public class AuctionsController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET: api/Auctions
        /*public IQueryable<Auction> GetAuctions()
        {
            db.Configuration.ProxyCreationEnabled = false;
            return db.Auctions;
        }*/
        
        // GET: api/AuctionApp
        public IEnumerable<AuctionApp> GetAuctions()
        {
            db.Configuration.ProxyCreationEnabled = false;
            IEnumerable<AuctionApp> auctions = from i in db.Auctions where i.status == "active"
                                               select new AuctionApp
                                                 {
                                                     Id = i.id,
                                                     CardName = i.Card.name,
                                                     UsernameUserSeller = i.User.username,
                                                     DescriptionCard = i.Card.description,
                                                     EndDate = i.endDate,
                                                     BeginDate = i.beginDate,
                                                     Amount = (decimal)i.amount,
                                                     CurrentAmount = i.currentAmount == null ? i.amount : i.currentAmount,
                                                     Status = i.status,
                                                     Type = i.type
                                                     //CalificationUser = c.User.
                                                 };
            //System.Diagnostics.Debug.WriteLine("MENSAJE: " + DateTime.Now);            
            return auctions;
        }


        [ResponseType(typeof(Auction))]
        public IHttpActionResult GetAuction(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            Auction auction = db.Auctions.Find(id);
            if (auction == null)
            {
                return NotFound();
            }

            return Ok(auction);
        }

        // GET: api/Auctions/5
        [ResponseType(typeof(Auction))]
        public IHttpActionResult GetAuction(int id, string type)
        {
            switch (type.ToLower()) {
                case "currentuser":
                    var auctionCurrentUser = from i in db.Auctions
                          where i.idCurrentUser == id && i.status=="active"
                          select new AuctionApp
                          {
                              Id = i.id,
                              CardName = i.Card.name,
                              UsernameUserSeller = i.User.username,
                              BeginDate = i.beginDate,
                              EndDate = i.endDate,
                              Status = i.status,
                              Type = i.type,
                              Amount = (decimal)i.amount,
                              CurrentAmount = (decimal)i.currentAmount
                          };

            if (auctionCurrentUser == null)
            {
                return NotFound();
            }
            return Ok(auctionCurrentUser.ToList());
                case "userowner":
                    var auctionsOwner = from i in db.Auctions
                                  where i.idUserSeller == id && i.status == "active"
                                        select new AuctionApp
                                  {
                                      Id = i.id,
                                      CardName = i.Card.name,
                                      UsernameUserSeller = i.User.username,
                                      CurrentAmount = (decimal)i.currentAmount,
                                      BeginDate = i.beginDate,
                                      EndDate = i.endDate,
                                      Status = i.status,
                                      Type = i.type,
                                      Amount = (decimal)i.amount
                                  };

                    if (auctionsOwner == null)
                    {
                        return NotFound();
                    }
                    return Ok(auctionsOwner.ToList());
                case "home":
                    var auctionsHome = from i in db.Auctions
                                       where i.idUserSeller != id && i.status == "active"
                                       select new AuctionApp
                                   {
                                       Id = i.id,
                                       CardName = i.Card.name,
                                       UsernameUserSeller = i.User.username,
                                       CurrentAmount = (decimal)i.currentAmount,
                                       BeginDate = i.beginDate,
                                       EndDate = i.endDate,
                                       Status = i.status,
                                       Type = i.type,
                                       Amount = (decimal)i.amount
                                   };
                    var orderedByPremium = auctionsHome.OrderByDescending(i => i);
                    if (auctionsHome == null)
                    {
                        return NotFound();
                    }
                    return Ok(orderedByPremium.ToList());
                case "useroutbided":
                    var auctionsOutbided = from i in db.R_Auction_CurrentUsers
                                           where i.idCurrentUser == id && i.Auction.status == "active" && i.idCurrentUser != i.Auction.idCurrentUser
                                           select new AuctionApp
                                        {
                                            Id = i.Auction.id,
                                            CardName = i.Auction.Card.name,
                                            UsernameUserSeller = i.User.username,
                                            CurrentAmount = (decimal)i.Auction.currentAmount,
                                            BeginDate = i.Auction.beginDate,
                                            EndDate = i.Auction.endDate,
                                            Status = i.Auction.status,
                                            Type = i.Auction.type,
                                            Amount = (decimal)i.Auction.amount
                                        };

                    if (auctionsOutbided == null)
                    {
                        return NotFound();
                    }
                    return Ok(auctionsOutbided.ToList());

            }
            return null;
        }
        
        // PUT: api/Auctions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAuction(int id,int idUser, Auction auction)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != auction.id)
            {
                return BadRequest();
            }
            Auction updated_auction = db.Auctions.Find(id);
            updated_auction.currentAmount = auction.currentAmount;
            updated_auction.idCurrentUser = idUser;
            db.Entry(updated_auction).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }catch{}

            // creamos nuevo AuctionCurrentUsers
            R_Auction_CurrentUsers rac = new R_Auction_CurrentUsers();
            rac.idAuction = id;
            rac.idCurrentUser = idUser;
            rac.amount = (decimal)updated_auction.currentAmount;
            db.R_Auction_CurrentUsers.Add(rac);
            try
            {
                db.SaveChanges();
            }catch { }
            return StatusCode(HttpStatusCode.OK);
        }
        /*
        // PUT: api/Auctions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAuction(int id, int idUser, decimal newcurrentAmount)
        {
            //if (!ModelState.IsValid) return BadRequest(ModelState);

            Auction auction = db.Auctions.Find(id);
            if (auction == null) return NotFound();

            auction.currentAmount = newcurrentAmount;


            db.Entry(auction).State = EntityState.Modified;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AuctionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }*/

        // POST: api/Auctions
        [ResponseType(typeof(Auction))]
        public IHttpActionResult PostAuction(Auction auction)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Auctions.Add(auction);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = auction.id }, auction);
        }

        // DELETE: api/Auctions/5
        [ResponseType(typeof(Auction))]
        public IHttpActionResult DeleteAuction(int id)
        {
            Auction auction = db.Auctions.Find(id);
            if (auction == null)
            {
                return NotFound();
            }

            db.Auctions.Remove(auction);
            db.SaveChanges();

            return Ok(auction);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AuctionExists(int id)
        {
            return db.Auctions.Count(e => e.id == id) > 0;
        }
    }
}