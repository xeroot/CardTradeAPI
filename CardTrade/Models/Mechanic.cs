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
    
    public partial class Mechanic
    {
        public Mechanic()
        {
            this.R_Card_Mechanic = new HashSet<R_Card_Mechanic>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
    
        public virtual ICollection<R_Card_Mechanic> R_Card_Mechanic { get; set; }
    }
}
