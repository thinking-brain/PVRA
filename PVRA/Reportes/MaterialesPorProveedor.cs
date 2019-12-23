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
    public partial class MaterialesPorProveedor : DevExpress.XtraReports.UI.XtraReport
    {
        public MaterialesPorProveedor(PeriodoModel periodo)
        {
            InitializeComponent();
            var db = new PvraDataEntities();
           

            var materiales = from m in db.CompraMateriales
                             where m.Fecha >= periodo.FechaInicio && m.Fecha <= periodo.FechaFin
                             group m by m.Persona_Proveedor
                                 into pGroup
                                 select new
                                 {
                                     Proveedor = pGroup.Key,
                                     Materiales = from mat in pGroup
                                                  group mat by mat.Material into mGroup
                                                  select new
                                                  {
                                                      Material = mGroup.Key,
                                                      Colores = from c in mGroup
                                                                group c by c.Color into cGroup
                                                                select new
                                                                {
                                                                    Color = cGroup.Key,
                                                                    Cantidad = cGroup.Sum(u => u.Cantidad),
                                                                    Importe = cGroup.Sum(u => u.Importe)
                                                                }

                                                  }
                                 };
           
            var result = new List<MaterialProveedorModel>();

            foreach (var p in materiales)
            {
                foreach (var m in p.Materiales)
                {
                    var lista = new List<MaterialModel>();
                    foreach (var c in m.Colores)
                    {
                        lista.Add( new MaterialModel(){ Material = m.Material.DescripcionCompleta + " Color: " + c.Color.DescricionCompleta, Cantidad = c.Cantidad, Importe = c.Importe});
                    }
                    result.Add(new MaterialProveedorModel()
                    {
                        Proveedor = p.Proveedor.NombreApellidos,
                        Materiales = lista
                    });
                }
            }



            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta: " +
                                periodo.FechaFin.ToShortDateString();

            DataSource = result;

            xrSubreport1.ReportSource = new MaterialesSubReport();

            this.proveedorLabel.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Proveedor")});

        }

        private void xrSubreport1_BeforePrint_1(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var lista = (List<MaterialModel>)GetCurrentColumnValue("Materiales");
            var report = ((MaterialesSubReport)((XRSubreport)sender).ReportSource);
            report.CargarDatos(lista);
        }

    }
}
