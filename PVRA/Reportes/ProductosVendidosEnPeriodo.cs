using System;
using System.Collections.Generic;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Linq;
using DevExpress.XtraReports.UI;
using PVRA.Models;
using PVRA.ModelViews;

namespace PVRA.Reportes
{
    public partial class ProductosVendidosEnPeriodo : DevExpress.XtraReports.UI.XtraReport
    {
        public ProductosVendidosEnPeriodo(PeriodoModel periodo)
        {
            InitializeComponent();
            var db = new PvraDataEntities();

            var productos = from s in db.Ventas
                            where s.Fecha >= periodo.FechaInicio && s.Fecha <= periodo.FechaFin
                            group s by s.InvertarioProductos.Producto
                                into sGroup
                                select new 
                                {
                                    Producto = sGroup.Key,
                                    Colores = from c in sGroup  group c by c.InvertarioProductos.Color into cGroup
                                              select new
                                              {
                                                  Color = cGroup.Key,
                                                  Cantidad = cGroup.Sum(p => p.Cantidad),
                                                  Costo = cGroup.Sum(p => p.InvertarioProductos.CostoUnitario * p.Cantidad)
                                              }
                                };
            var result = new List<CostoProductoModel>();

            foreach (var p in productos)
            {
                result.AddRange(p.Colores.Select(c => new CostoProductoModel() {Producto = p.Producto.DescripcionCompleta + " Color: " + c.Color.DescricionCompleta, Cantidad = c.Cantidad, Costo = c.Costo}));
            }

            DataSource = result.ToList();

            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta " + periodo.FechaFin.ToShortDateString();

            this.productoCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Producto")});

            this.cantidadCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cantidad")});

            this.importeCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Costo")});

            totalCantidadCell.Text = result.Sum(p => p.Cantidad).ToString();
            importeTotalCell.Text = result.Sum(p => p.Costo).ToString();
        }

    }
}
