using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PVRA.ModelViews
{
    public class TrabajadorProveedorModel
    {
        public string Trabajador { get; set; }

        public IEnumerable<TrabajoModel> Trabajos { get; set; }

        public TrabajadorProveedorModel()
        {
            Trabajos = new List<TrabajoModel>();
        }
    }

    public class TrabajoModel
    {
        public string Trabajo { get; set; }
        
        public decimal Importe { get; set; }
    }
}