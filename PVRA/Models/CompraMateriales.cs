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
    
    public partial class CompraMateriales
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "{0} es obligatorio")]
        [DataType(DataType.Date, ErrorMessageResourceName = "DateInvalidProperty", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        public System.DateTime Fecha { get; set; }
        public int MateriaPrimaId { get; set; }
        public int ColorId { get; set; }
        [DataType(DataType.Currency, ErrorMessage = "Debe ser en formato de moneda")]
        [RegularExpression(@"\d*.\d{2}", ErrorMessageResourceName = "DecimalInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Importe Total")]
        public decimal Importe { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [RegularExpression(@"\d*.\d{2}", ErrorMessageResourceName = "DecimalInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        public decimal Cantidad { get; set; }
        [Display(Name = "Observación")]
        public string Observacion { get; set; }
        [Display(Name = "Usuario")]
        public string UsuarioId { get; set; }
        public int ProveedorPersonaId { get; set; }
    
        public virtual Color Color { get; set; }

        [Display(Name = "Proveedor")]
        public virtual Persona_Proveedor Persona_Proveedor { get; set; }
        public virtual Material Material { get; set; }
    }
}
