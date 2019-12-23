using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DevExpress.XtraPrinting.Export.Pdf;
using PVRA.Models;

namespace PVRA.Models.BaseTemporal
{
    public class CostoProduccion
    {
        public int Id { get; set; }

        [DataType(DataType.Date, ErrorMessage = "{0} debe ser una fecha")]
        [Required(ErrorMessage = "{0} es obligatorio")]
        public System.DateTime Fecha { get; set; }

        [DataType(DataType.Currency, ErrorMessage = "Debe ser en formato de moneda")]
        [Required(ErrorMessage = "{0} es obligatorio")]
        public decimal Importe { get; set; }
        public int TrabajadorPersonaId { get; set; }

        public virtual Persona_Trabajador Trabajador { get; set; }

        public int ConceptoCostoId { get; set; }

        [Display(Name = "Concepto de costo")]
        public virtual ConceptoCosto ConceptoCosto { get; set; }
    }
}