//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace PVRA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ventas
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        //[RegularExpression(@"(\d{2})/(\d{2})/(\d{4})", ErrorMessage = "{0} debe tener el formato {1}")]
        [DataType(DataType.Date, ErrorMessage = "{0} debe ser una Fecha")]
        public System.DateTime Fecha { get; set; }

        [DataType(DataType.Currency, ErrorMessage = "Debe ser en formato de moneda")]
        [Required(ErrorMessage = "{0} es obligatorio")]
        [RegularExpression(@"\d*.\d{2}", ErrorMessageResourceName = "DecimalInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        [Display(Name = "Importe Total")]
        public decimal Importe { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [RegularExpression(@"\d*", ErrorMessageResourceName = "IntInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        [Remote("CheckCantidad", "Venta", AdditionalFields = "Id,InvertarioProductosId", ErrorMessage = "No existe esta cantidad en inventario")]
        public int Cantidad { get; set; }
        [Display(Name = "Observación")]
        public string Observacion { get; set; }
        [Display(Name = "Usuario")]
        public string UsuarioId { get; set; }
        public int InvertarioProductosId { get; set; }
        public int TrabajadorPersonaId { get; set; }

        [Display(Name = "Inventario de Productos")]
        public virtual InvertarioProductos InvertarioProductos { get; set; }

        [Display(Name = "Trabajador")]
        public virtual Persona_Trabajador Persona_Trabajador { get; set; }
    }
}
