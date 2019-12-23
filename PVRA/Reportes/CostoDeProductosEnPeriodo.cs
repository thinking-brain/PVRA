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
    public partial class CostoDeProductosEnPeriodo : DevExpress.XtraReports.UI.XtraReport
    {
        public CostoDeProductosEnPeriodo(PeriodoModel periodo)
        {
            InitializeComponent();
            var db = new PvraDataEntities();

            var productos = from v in db.EntradaProductos
                            where v.Fecha >= periodo.FechaInicio && v.Fecha <= periodo.FechaFin
                            group v by v.Producto
                                into vGroup
                                select new
                                {
                                    Producto = vGroup.Key,
                                    Colores = from c in vGroup
                                              group c by c.Color into cGroup
                                              select new
                                              {
                                                  Color = cGroup.Key,
                                                  Cantidad = cGroup.Sum(p => p.Cantidad),
                                                  Costo = cGroup.Sum(p => p.Importe)
                                              }
                                };
           

            var result = new List<CostoProductoModel>();

            foreach (var p in productos)
            {
                result.AddRange(p.Colores.Select(c => new CostoProductoModel() { Producto = p.Producto.DescripcionCompleta + " Color: " + c.Color.DescricionCompleta, Cantidad = c.Cantidad, Costo = c.Costo }));
            }

            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta: " +
                                periodo.FechaFin.ToShortDateString();

            DataSource = result.ToList();

            this.productoCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Producto")});

            this.cantidadCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cantidad")});

            this.costoCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Costo")});

            totalCantidadCell.Text = result.Sum(p => p.Cantidad).ToString();
            totalCostoCell.Text = result.Sum(p => p.Costo).ToString();
        }

    }
}
