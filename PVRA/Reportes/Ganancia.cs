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
    public partial class Ganancia : DevExpress.XtraReports.UI.XtraReport
    {
        private PvraDataEntities db = new PvraDataEntities();
        public Ganancia(int year)
        {
            InitializeComponent();
            var result = new List<GananciaModel>();
            for (int i = 1; i <= 12; i++)
            {
                result.Add(CalcularGananciaPorMes(i,year));
            }

            DataSource = result;

            this.mesCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "MesLetras")});

            this.ingresosCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Ingreso")});

            this.gastosCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Gasto")});

            this.gananciaCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Ganancia")});
        }

        public GananciaModel CalcularGananciaPorMes(int mes, int year)
        {
            var ventas = db.Ventas.Where(v => v.Fecha.Month == mes && v.Fecha.Year == year).ToList().Sum(v => v.Importe);
            var gastos = db.OtrosGastos.Where(v => v.Fecha.Month == mes && v.Fecha.Year == year).ToList().Sum(v => v.Importe);
            var salarios = db.Salario.Where(v => v.Fecha.Month == mes && v.Fecha.Year == year).ToList().Sum(v => v.Importe);
            var costos = db.Ventas.Where(v => v.Fecha.Month == mes && v.Fecha.Year == year).ToList().Sum(v => v.InvertarioProductos.CostoUnitario * v.Cantidad);
            return new GananciaModel() { Gasto = gastos + costos + salarios, Ingreso = ventas, Mes = mes, Ganancia = ventas - (gastos + costos + salarios) };
        }

    }
}
