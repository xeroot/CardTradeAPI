//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CardTrade.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Profile
    {
        public int id { get; set; }
        public string name { get; set; }
        public string type { get; set; }
        public string status { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string age { get; set; }
        public string sex { get; set; }
        public int coins { get; set; }
        public decimal rating { get; set; }
        public string address { get; set; }
        public int idUser { get; set; }
    
        public virtual User User { get; set; }
    }
}