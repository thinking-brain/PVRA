//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace PVRA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UnidadMedida
    {
        public UnidadMedida()
        {
            this.Material = new HashSet<Material>();
        }
    
        public int Id { get; set; }
        [Required(ErrorMessage = "{0} es obligatorio")]
        public string Unidad { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [StringLength(3, ErrorMessage = "{0} no puede tener mas de {1} caracteres")]
        public string Siglas { get; set; }
    
        public virtual ICollection<Material> Material { get; set; }
    }
}
