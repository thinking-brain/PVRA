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
    public partial class VentasPorTrabajador : DevExpress.XtraReports.UI.XtraReport
    {
        public VentasPorTrabajador(PeriodoModel periodo)
        {
            InitializeComponent();
            var db = new PvraDataEntities();

            var productos = from s in db.Ventas
                            where s.Fecha >= periodo.FechaInicio && s.Fecha <= periodo.FechaFin
                            group s by s.Persona_Trabajador
                                into sGroup
                                select new 
                                {
                                    Trabajador = sGroup.Key,
                                    Cantidad = sGroup.Sum(p => p.Cantidad),
                                    Costo = sGroup.Sum(p => p.Importe)
                                };


            DataSource = productos.ToList();

            periodoLabel.Text = "Desde: " + periodo.FechaInicio.ToShortDateString() + " hasta " + periodo.FechaFin.ToShortDateString();

            this.productoCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Trabajador.NombreApellidos")});

            this.cantidadCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cantidad")});

            this.importeCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Costo")});

            totalCantidadCell.Text = productos.Sum(p => p.Cantidad).ToString();
            importeTotalCell.Text = productos.Sum(p => p.Costo).ToString();
        }

    }
}
