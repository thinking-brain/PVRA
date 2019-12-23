using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PVRA.Models.BaseTemporal
{
    public class TemporalContext
    {
        static TemporalContext _context;

        private Dictionary<int, Models.BaseTemporal.ProductoConfeccionado> _productoConfeccionados;

        private int _index = 1;

        private TemporalContext()
        {
            _productoConfeccionados = new Dictionary<int, Models.BaseTemporal.ProductoConfeccionado>();
        }

        public static TemporalContext GetContext()
        {
            return _context ?? (_context = new TemporalContext());
        }

        public void AgregarProducto(Models.BaseTemporal.ProductoConfeccionado producto)
        {
            Clear();
            producto.Id = _index;
            _productoConfeccionados.Add(_index,producto);
            _index++;
        }

        public void CargarProducto(EntradaProductos producto)
        {
            var db = new PvraDataEntities();
            Clear();
            _index = producto.Id;
            var prodConfecc = new ProductoConfeccionado()
            {
                Fecha = producto.Fecha,
                ColorId = producto.ColorId,
                Cantidad = producto.Cantidad,
                Id = producto.Id,
                Observacion = producto.Observacion,
                ProductoId = producto.ProductoId
            };
            foreach (var m in producto.ProductoConfeccionadoInventarioMaterial)
            {
                prodConfecc.AgregarMaterial(new MaterialesUtilizados(){Cantidad = m.Cantidad, InvertarioMaterialesId = m.InvertarioMateriasPrimasId, InvertarioMateriales = db.InvertarioMateriasPrimas.Find(m.InvertarioMateriasPrimasId)});
            }
            foreach (var c in producto.Salario_CostoProduccion)
            {
                prodConfecc.CargarCosto(new CostoProduccion() { Fecha = c.Fecha, ConceptoCostoId = c.ConceptoCostoId, ConceptoCosto = db.ConceptoCosto.Find(c.ConceptoCostoId), Id = c.Id, Importe = c.Importe, TrabajadorPersonaId = c.TrabajadorPersonaId, Trabajador = db.Trabajadores.Find(c.TrabajadorPersonaId)});
            }
            _productoConfeccionados.Add(_index, prodConfecc);
        }

        public void Clear()
        {
            _productoConfeccionados.Clear();
            _index = 0;
        }

        public Models.BaseTemporal.ProductoConfeccionado BuscarProducto(int id)
        {
            if (_productoConfeccionados.ContainsKey(id))
            {
                return _productoConfeccionados[id]; 
            }
            throw new Exception("No existe ese producto");
        }
    }
}