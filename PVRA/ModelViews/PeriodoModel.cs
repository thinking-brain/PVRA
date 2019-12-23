using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PVRA.Filtros;

namespace PVRA.ModelViews
{
    public class PeriodoModel
    {

        [DataType(DataType.Date)]
        [Display(Name = "Fecha Inicial")]
        public DateTime FechaInicio { get; set; }

        [DataType(DataType.Date)]
        [FechaMayorQue("FechaInicio")]
        [Display(Name = "Fecha Final")]
        public DateTime FechaFin { get; set; }
    }
}