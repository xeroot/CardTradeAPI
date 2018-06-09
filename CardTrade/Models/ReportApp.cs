using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CardTrade.Models
{
    public class ReportApp
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private string route;

        public string Route
        {
            get { return route; }
            set { route = value; }
        }
        private string reportType;

        public string ReportType
        {
            get { return reportType; }
            set { reportType = value; }
        }
        private int idauction;

        public int Idauction
        {
            get { return idauction; }
            set { idauction = value; }
        }
    }
}