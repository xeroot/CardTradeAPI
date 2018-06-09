using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardTrade.Models
{
    public class OrderApp
    {
        private int id;
        private bool isRecived;
        private DateTime? dateRecived;
        private string status;
        private int idAuction;
        private DateTime beginDate;
        private DateTime endDate;
        private string shippingMethod;

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

        public bool IsRecived
        {
            get
            {
                return isRecived;
            }

            set
            {
                isRecived = value;
            }
        }

        public DateTime? DateRecived
        {
            get
            {
                return dateRecived;
            }

            set
            {
                dateRecived = value;
            }
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

        public int IdAuction
        {
            get
            {
                return idAuction;
            }

            set
            {
                idAuction = value;
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

        public string ShippingMethod
        {
            get
            {
                return shippingMethod;
            }

            set
            {
                shippingMethod = value;
            }
        }
    }
}