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
    
    public partial class Transaction
    {
        public int id { get; set; }
        public decimal moneyAmount { get; set; }
        public int coinsAmount { get; set; }
        public System.DateTime transactionDate { get; set; }
        public string transactionType { get; set; }
        public int idUser { get; set; }
    
        public virtual User User { get; set; }
    }
}
