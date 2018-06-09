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
using System.Diagnostics;

namespace CardTrade.Controllers
{
    public class CardsController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET api/Card
        public IQueryable<Card> GetCards()
        {
            db.Configuration.ProxyCreationEnabled = false; // esto evita errores de conexion
            /*IEnumerable<CardApp> cards = from c in db.Cards
                                         select new CardApp
                                         {
                                             Category = c.Category.name,
                                             Cost = c.cost,
                                             Description = c.description,
                                             Id = c.id,
                                             IsFoil = c.isFoil,
                                             ManaCost = c.manaCost,
                                             MinValue = c.minValue,
                                             Name = c.name,
                                             Power = c.power,
                                             Rarity = c.Rarity.description,
                                             Status = c.status,
                                             Supertype = c.Supertype.name,
                                             Toughtness = c.toughness,
                                             UserId = c.idUser
                                         };*/
            return db.Cards;
        }

        // GET api/Card
        public IEnumerable<CardApp> GetCards(int iduser,bool ismine) // obtener las cartas que NO son mias
        {
            db.Configuration.ProxyCreationEnabled = false;
            if (ismine) iduser = 0; // si es true tonces retorno todas las cartas
            IEnumerable<CardApp> cards = from c in db.Cards
                                         where 1 != iduser && c.status == "active"
                                         select new CardApp
                                         {
                                             Category = c.Category.name,
                                             Cost = c.cost,
                                             Description = c.description,
                                             Id = c.id,
                                             IsFoil = c.isFoil,
                                             ManaCost = c.manaCost,
                                             MinValue = c.minValue,
                                             Name = c.name,
                                             Power = c.power,
                                             Rarity = c.Rarity.description,
                                             Status = c.status,
                                             Supertype = c.Supertype.name,
                                             Toughtness = c.toughness
                                         };
            return cards;
        }

        // GET api/Card/5
        [ResponseType(typeof(Card))]
        public IHttpActionResult GetCard(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            IEnumerable<CardApp> card = from c in db.Cards
                                         where c.id == id
                                         select new CardApp
                                         {
                                             Category = c.Category.name,
                                             Cost = c.cost,
                                             Description = c.description,
                                             Id = c.id,
                                             IsFoil = c.isFoil,
                                             ManaCost = c.manaCost,
                                             MinValue = c.minValue,
                                             Name = c.name,
                                             Power = c.power,
                                             Rarity = c.Rarity.description,
                                             Status = c.status,
                                             Supertype = c.Supertype.name,
                                             Toughtness = c.toughness
                                         };
            return Ok(card.FirstOrDefault());
        }
        // GET api/Card/5
        [ResponseType(typeof(Card))] // GET CARDS BY FILTERS
        public IHttpActionResult GetCard(int idcategory, decimal cost, string description, bool isfoil, int manacost, int minvalue,
                                         string name, int power, int idrarity, int idsupertype, int toughness)
        {
            db.Configuration.ProxyCreationEnabled = false;
            IEnumerable<CardApp> card = from c in db.Cards
                                        where c.status == "active" && c.idCategory == idcategory && c.cost == cost &&
                                                c.description.ToLower().Contains(description.ToLower()) && c.isFoil == isfoil &&
                                                c.manaCost == manacost && c.minValue == minvalue && c.name.ToLower().Contains(name.ToLower()) &&
                                                c.power == power && c.idRarity == idrarity && c.idSupertype == idsupertype && c.toughness == toughness
                                        select new CardApp
                                        {
                                            Category = c.Category.name,
                                            Cost = c.cost,
                                            Description = c.description,
                                            Id = c.id,
                                            IsFoil = c.isFoil,
                                            ManaCost = c.manaCost,
                                            MinValue = c.minValue,
                                            Name = c.name,
                                            Power = c.power,
                                            Rarity = c.Rarity.description,
                                            Status = c.status,
                                            Supertype = c.Supertype.name,
                                            Toughtness = c.toughness
                                        };
            return Ok(card.FirstOrDefault());
        }

        // PUT api/Card/5
        public IHttpActionResult PutCard(int id, Card card)
        {
            db.Configuration.ProxyCreationEnabled = false;
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != card.id)
            {
                return BadRequest();
            }

            db.Entry(card).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CardExists(id))
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

        // POST api/Card
        [ResponseType(typeof(Card))]
        public IHttpActionResult PostCard(Card card)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Cards.Add(card);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = card.id }, card);
        }

        // DELETE api/Card/5
        [ResponseType(typeof(Card))]
        public IHttpActionResult DeleteCard(int id)
        {
            Card card = db.Cards.Find(id);
            if (card == null)
            {
                return NotFound();
            }

            db.Cards.Remove(card);
            db.SaveChanges();

            return Ok(card);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CardExists(int id)
        {
            return db.Cards.Count(e => e.id == id) > 0;
        }
    }
}