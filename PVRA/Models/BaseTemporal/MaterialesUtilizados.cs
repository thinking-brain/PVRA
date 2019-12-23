using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;

namespace PVRA.Models.BaseTemporal
{
    public class MaterialesUtilizados
    {
        public int EntradaProductoId { get; set; }

        public int InvertarioMaterialesId { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [Remote("CheckCantidad", "ProductoConfeccionado", AdditionalFields = "EntradaProductoId,InvertarioMaterialesId", ErrorMessage = "No existe esta cantidad en inventario")]
        public decimal Cantidad { get; set; }

        public virtual InvertarioMateriales InvertarioMateriales { get; set; }
    }
}