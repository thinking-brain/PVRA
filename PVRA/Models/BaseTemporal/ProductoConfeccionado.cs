using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using PVRA.Models;

namespace PVRA.Models.BaseTemporal
{
    public class ProductoConfeccionado
    {
        public ProductoConfeccionado()
        {
            this._costoProduccion = new Dictionary<int, CostoProduccion>();
            this._materialesUtilizados = new Dictionary<int, MaterialesUtilizados>();
        }

        private int _index = 1;
    
        public int Id { get; set; }

        [DataType(DataType.Date, ErrorMessage = "{0} debe ser una fecha")]
        [Required(ErrorMessage = "{0} es obligatorio")]
        public System.DateTime Fecha { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        public int Cantidad { get; set; }
        public int ProductoId { get; set; }

        public int ColorId { get; set; }

        public virtual Producto Producto { get; set; }

        public virtual Color Color { get; set; }

        [Display(Name = "Observación")]
        public string Observacion { get; set; }
        IDictionary<int,CostoProduccion> _costoProduccion { get; set; }
        IDictionary<int, MaterialesUtilizados> _materialesUtilizados { get; set; }

        public void AgregarCosto(Models.BaseTemporal.CostoProduccion costo)
        {
            costo.Id = _index;
            _costoProduccion.Add(_index, costo);
            _index++;
        }
        public void CargarCosto(Models.BaseTemporal.CostoProduccion costo)
        {_costoProduccion.Add(costo.Id, costo);
        }

        public void BorrarCosto(int id)
        {
            if (_costoProduccion.ContainsKey(id))
            {
                _costoProduccion.Remove(id);
                return;
            }
            throw new Exception("No existe este costo");
        }

        public Models.BaseTemporal.CostoProduccion BuscarCosto(int id)
        {
            if (_costoProduccion.ContainsKey(id))
            {
                return _costoProduccion[id];
            }
            return null;
        }

        public void AgregarMaterial(Models.BaseTemporal.MaterialesUtilizados material)
        {
            _materialesUtilizados.Add(material.InvertarioMaterialesId, material);
        }

        public Models.BaseTemporal.MaterialesUtilizados BuscarMaterial(int id)
        {
            if (_materialesUtilizados.ContainsKey(id))
            {
                return _materialesUtilizados[id];
            }
            return null;
        }

        public void BorrarMaterial(int id)
        {
            if (_materialesUtilizados.ContainsKey(id))
            {
                _materialesUtilizados.Remove(id);
                return;
            }
            throw new Exception("No existe este material");
        }

        public List<CostoProduccion> Costos
        {
            get { return _costoProduccion.Values.ToList(); }
        }

        public List<MaterialesUtilizados> Materiales
        {
            get
            {
                return _materialesUtilizados.Values.ToList();
            }
        }
    }
}