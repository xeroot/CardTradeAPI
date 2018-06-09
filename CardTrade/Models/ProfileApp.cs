using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardTrade.Models
{
    public class ProfileApp
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
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string age;

        public string Age
        {
            get { return age; }
            set { age = value; }
        }
        private string sex;

        public string Sex
        {
            get { return sex; }
            set { sex = value; }
        }
        private int coins;

        public int Coins
        {
            get { return coins; }
            set { coins = value; }
        }
        private decimal rating;

        public decimal Rating
        {
            get { return rating; }
            set { rating = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private int idUser;

        public int IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }
    }
}