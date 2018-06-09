﻿using System;
using System.Collections.Generic;
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
    public class RulesController : ApiController
    {
        private CardTradeEntities db = new CardTradeEntities();

        // GET api/Rules
        public IQueryable<Rule> GetRules()
        {
            return db.Rules;
        }

        // GET api/Rules/5
        [ResponseType(typeof(Rule))]
        public IHttpActionResult GetRule(int id)
        {
            Rule rule = db.Rules.Find(id);
            if (rule == null)
            {
                return NotFound();
            }

            return Ok(rule);
        }

        // PUT api/Rules/5
        public IHttpActionResult PutRule(int id, Rule rule)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != rule.id)
            {
                return BadRequest();
            }

            db.Entry(rule).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RuleExists(id))
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

        // POST api/Rules
        [ResponseType(typeof(Rule))]
        public IHttpActionResult PostRule(Rule rule)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Rules.Add(rule);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = rule.id }, rule);
        }

        // DELETE api/Rules/5
        [ResponseType(typeof(Rule))]
        public IHttpActionResult DeleteRule(int id)
        {
            Rule rule = db.Rules.Find(id);
            if (rule == null)
            {
                return NotFound();
            }

            db.Rules.Remove(rule);
            db.SaveChanges();

            return Ok(rule);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RuleExists(int id)
        {
            return db.Rules.Count(e => e.id == id) > 0;
        }
    }
}