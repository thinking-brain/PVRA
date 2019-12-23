using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PVRA.ModelViews
{
    public class MaterialProveedorModel
    {
        public string Proveedor { get; set; }

        public IEnumerable<MaterialModel> Materiales { get; set; }

        public MaterialProveedorModel()
        {
            Materiales = new List<MaterialModel>();
        }
    }

    public class MaterialModel
    {
        public string Material { get; set; }

        public decimal Cantidad { get; set; }
        public decimal Importe { get; set; }
    }
}