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
    public class OrdersController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET: api/Orders
        public IQueryable<Order> GetOrders()
        {
            return db.Orders;
        }

        // GET: api/Orders/5
        [ResponseType(typeof(Order))]
        public IHttpActionResult GetOrder(int id, string type)
        {
            switch (type.ToLower()) {
                case "buyer":
            var orderBuyer = from i in db.Orders
                                   where i.Auction.idCurrentUser == id
                                   select new OrderApp
                                   {
                                       Id = i.Auction.id,
                                       IsRecived = i.isReviced,
                                       DateRecived = i.dateRecived,
                                       Status = i.status,
                                       IdAuction = i.idAuction,
                                       BeginDate = i.beginDate,
                                       EndDate = i.endDate,
                                       ShippingMethod= i.shippingMethod

                                   };
            if (orderBuyer == null)
            {
                return NotFound();
            }

            return Ok(orderBuyer);
                case "seller":
                    var orderSeller = from i in db.Orders
                                     where i.Auction.idUserSeller == id
                                     select new OrderApp
                                     {
                                         Id = i.Auction.id,
                                         IsRecived = i.isReviced,
                                         DateRecived = i.dateRecived,
                                         Status = i.status,
                                         IdAuction = i.idAuction,
                                         BeginDate = i.beginDate,
                                         EndDate = i.endDate,
                                         ShippingMethod = i.shippingMethod

                                     };
                    if (orderSeller == null)
                    {
                        return NotFound();
                    }
                    return Ok(orderSeller);

        }
            return null;
        }

        // PUT: api/Orders/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutOrder(int id, bool isRecived)
        {
            Order order = db.Orders.Find(id);
            order.isReviced = isRecived;
            if (isRecived)
            {
                order.dateRecived = DateTime.Now;
                order.status = "Delivered";
            }
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != order.id)
            {
                return BadRequest();
            }

            db.Entry(order).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
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

        // POST: api/Orders
        [ResponseType(typeof(Order))]
        public IHttpActionResult PostOrder(int idAuction, string shippingMethod)
        {
            Order order = new Order();
            order.status = "Active";
            order.idAuction = idAuction;
            order.beginDate = DateTime.Now;
            order.endDate = Convert.ToDateTime(DateTime.Now).AddDays(7);
            order.shippingMethod = shippingMethod;
            order.isReviced = false;
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Orders.Add(order);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = order.id }, order);
        }

        // DELETE: api/Orders/5
        [ResponseType(typeof(Order))]
        public IHttpActionResult DeleteOrder(int id)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return NotFound();
            }

            db.Orders.Remove(order);
            db.SaveChanges();

            return Ok(order);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OrderExists(int id)
        {
            return db.Orders.Count(e => e.id == id) > 0;
        }
    }
}