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
    
    public partial class InvertarioProductos
    {
        public InvertarioProductos()
        {
            this.Ventas = new HashSet<Ventas>();
        }
    
        public int Id { get; set; }
        public int ProductoId { get; set; }
        public int ColorId { get; set; }
        [DataType(DataType.Currency, ErrorMessage = "Debe ser en formato de moneda")]
        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Costo Unitario")]
        [RegularExpression(@"\d*.\d{2}", ErrorMessageResourceName = "DecimalInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        public decimal CostoUnitario { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [RegularExpression(@"\d*", ErrorMessageResourceName = "IntInvalidMessage", ErrorMessageResourceType = typeof(Resources.ResourceGlobal))]
        public int Existencia { get; set; }

        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }
    
        public virtual Color Color { get; set; }
        public virtual Producto Producto { get; set; }
        public virtual ICollection<Ventas> Ventas { get; set; }
        public string Inventario { get { return Producto.DescripcionCompleta + " Color: " + Color.DescricionCompleta + "-" + CostoUnitario + " (Existencia:" + Existencia + ")"; } }

        public string InventarioCorto
        {
            get { return Producto.DescripcionCompleta + " Color: " + Color.DescricionCompleta + " (" + CostoUnitario + ")"; }
        }
    }
}
