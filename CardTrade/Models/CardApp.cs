using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardTrade.Models
{
    public class CardApp
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private decimal cost;

        public decimal Cost
        {
            get { return cost; }
            set { cost = value; }
        }
        private decimal minValue;

        public decimal MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
        private int userId;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        private int manaCost;

        public int ManaCost
        {
            get { return manaCost; }
            set { manaCost = value; }
        }
        private int? power;

        public int? Power
        {
            get { return power; }
            set { power = value; }
        }
        private int? toughtness;

        public int? Toughtness
        {
            get { return toughtness; }
            set { toughtness = value; }
        }
        private bool isFoil;

        public bool IsFoil
        {
            get { return isFoil; }
            set { isFoil = value; }
        }
        private string rarity;

        public string Rarity
        {
            get { return rarity; }
            set { rarity = value; }
        }
        private string category;

        public string Category
        {
            get { return category; }
            set { category = value; }
        }
        private string supertype;

        internal string Supertype
        {
            get { return supertype; }
            set { supertype = value; }
        }


    }
}