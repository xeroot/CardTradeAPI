using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CardTrade.Models
{
    public class UserApp
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
        private string pass;

        public string Pass
        {
            get { return pass; }
            set { pass = value; }
        }
    }
}
