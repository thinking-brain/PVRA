using System;
using System.Collections.Generic;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using PVRA.ModelViews;

namespace PVRA.Reportes
{
    public partial class TrabajoSubReport : DevExpress.XtraReports.UI.XtraReport
    {
        public TrabajoSubReport()
        {
            InitializeComponent();
            
        }

        public void CargarDatos(IEnumerable<TrabajoModel> trabajos)
        {
            DataSource = trabajos;

            this.materiaPrimaCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Trabajo")});

            this.importeCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Importe")});
        }

    }
}
