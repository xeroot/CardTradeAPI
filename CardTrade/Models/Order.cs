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
    
    public partial class Order
    {
        public int id { get; set; }
        public bool isReviced { get; set; }
        public Nullable<System.DateTime> dateRecived { get; set; }
        public string status { get; set; }
        public int idAuction { get; set; }
        public System.DateTime beginDate { get; set; }
        public System.DateTime endDate { get; set; }
        public string shippingMethod { get; set; }
    
        public virtual Auction Auction { get; set; }
    }
}
