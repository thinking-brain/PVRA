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
    public partial class MaterialesUtilizados : DevExpress.XtraReports.UI.XtraReport
    {
        public MaterialesUtilizados(PeriodoModel periodo)
        {
            InitializeComponent();

            var db = new PvraDataEntities();

            var materiales = from m in db.SalidaMateriales
                             where m.Fecha >= periodo.FechaInicio && m.Fecha <= periodo.FechaFin
                             group m by m.InvertarioMateriales.Material
                                 into pGroup
                                 select new
                                 {

                                     Material = pGroup.Key,
                                     Colores = from c in pGroup
                                               group c by c.InvertarioMateriales.Color into cGroup
                                               select new
                                               {
                                                   Color = cGroup.Key,
                                                   Cantidad = cGroup.Sum(u => u.Cantidad),
                                                   Importe = cGroup.Sum(p => p.InvertarioMateriales.Precio * p.Cantidad)
                                               }


                                 };

            var result = new List<MaterialModel>();

            foreach (var p in materiales)
            {
                foreach (var c in p.Colores)
                {
                    result.Add(new MaterialModel() { Material = p.Material.DescripcionCompleta + " Color: " + c.Color.DescricionCompleta, Cantidad = c.Cantidad, Importe = c.Importe });
                }
            }



            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta: " +
                                periodo.FechaFin.ToShortDateString();

            DataSource = result;

            this.materiaPrimaCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Material")});

            this.cantidadCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cantidad")});

            this.importeCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Importe")});

            totalCantidadCell.Text = result.Sum(i => i.Cantidad).ToString();
            totalImporteCell.Text = result.Sum(i => i.Importe).ToString();
        }

    }
}
