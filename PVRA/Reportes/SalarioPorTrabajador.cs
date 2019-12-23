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
    public partial class SalarioPorTrabajador : DevExpress.XtraReports.UI.XtraReport
    {
        public SalarioPorTrabajador(PeriodoModel periodo)
        {
            InitializeComponent();
            var db = new PvraDataEntities();
           

            var trabajadores = from m in db.CostoProducciones
                             where m.Fecha >= periodo.FechaInicio && m.Fecha <= periodo.FechaFin
                             group m by m.Persona_Trabajador
                                 into pGroup
                                 select new
                                 {
                                     Trabajador = pGroup.Key,
                                     Trabajos = from c in pGroup
                                                  group c by c.ConceptoCosto into cGroup
                                                  select new
                                                  {
                                                      Trabajo = cGroup.Key,
                                                      Importe = cGroup.Sum(u => u.Importe)
                                                  }
                                 };
           
            var result = new List<TrabajadorProveedorModel>();

            foreach (var p in trabajadores)
            {
                var lista = new List<TrabajoModel>();
                foreach (var m in p.Trabajos)
                {
                        lista.Add( new TrabajoModel(){ Trabajo = m.Trabajo.Nombre, Importe = m.Importe});
                }
                result.Add(new TrabajadorProveedorModel()
                {
                    Trabajador = p.Trabajador.NombreApellidos,
                    Trabajos = lista
                });
            }



            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta: " +
                                periodo.FechaFin.ToShortDateString();

            DataSource = result;

            xrSubreport1.ReportSource = new TrabajoSubReport();

            this.proveedorLabel.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Trabajador")});

        }

        private void xrSubreport1_BeforePrint_1(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var lista = (List<TrabajoModel>)GetCurrentColumnValue("Trabajos");
            var report = ((TrabajoSubReport)((XRSubreport)sender).ReportSource);
            report.CargarDatos(lista);
        }

    }
}
