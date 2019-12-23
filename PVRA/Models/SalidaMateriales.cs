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
    
    public partial class SalidaMateriales
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [DataType(DataType.Date, ErrorMessage = "{0} debe ser una Fecha")]
        public System.DateTime Fecha { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [Remote("CheckCantidad", "SalidaMaterial", AdditionalFields = "Id,InvertarioMateriasPrimasId", ErrorMessage = "No existe esta cantidad en inventario")]
        [DataAnnotationsExtensions.Numeric(ErrorMessage = "N�mero")]
        public decimal Cantidad { get; set; }
        [Display(Name = "Observaci�n")]
        public string Observacion { get; set; }
        [Display(Name = "Usuario")]
        public string UsuarioId { get; set; }
        public int InvertarioMateriasPrimasId { get; set; }

        [Display(Name = "Inventario de Materias Primas")]
        public virtual InvertarioMateriales InvertarioMateriales { get; set; }
    }
}