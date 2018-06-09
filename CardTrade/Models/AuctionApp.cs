using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardTrade.Models
{
    public class AuctionApp
    {
        
        int id;
        string cardName;
        string nameUserSeller;
        string descriptionCard;
        Decimal? currentAmount;
        DateTime beginDate;
        DateTime endDate;
        string status;
        string type;
        decimal amount;
        double calificationUser;

        public double CalificationUser
        {
            get { return calificationUser; }
            set { calificationUser = value; }
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string CardName
        {
            get { return cardName; }
            set { cardName = value; }
        }

        public string UsernameUserSeller
        {
            get
            {
                return nameUserSeller;
            }

            set
            {
                nameUserSeller = value;
            }
        }

        public Decimal? CurrentAmount
        {
            get
            {
                return currentAmount;
            }

            set
            {
                currentAmount = value;
            }
        }

        public DateTime BeginDate
        {
            get
            {
                return beginDate;
            }

            set
            {
                beginDate = value;
            }
        }

        public DateTime EndDate
        {
            get
            {
                return endDate;
            }

            set
            {
                endDate = value;
            }
        }

        public string DescriptionCard
        {
            get { return descriptionCard; }
            set { descriptionCard = value; }
        }

        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public string Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

        public decimal Amount
        {
            get
            {
                return amount;
            }

            set
            {
                amount = value;
            }
        }
        
        /*
        public int id { get; set; }
        public int idCard { get; set; }
        public int idUserSeller { get; set; }
        public System.DateTime beginDate { get; set; }
        public System.DateTime endDate { get; set; }
        public string status { get; set; }
        public string type { get; set; }
        public Nullable<decimal> currentAmount { get; set; }
        public Nullable<decimal> amount { get; set; }
        public Nullable<int> idCurrentUser { get; set; }

        //nuevos
        public string cardName { get; set; }
        public string userSellerName { get; set; }
        */

    }
}