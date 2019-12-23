using System;
using System.Collections.Generic;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using PVRA.ModelViews;

namespace PVRA.Reportes
{
    public partial class MaterialesSubReport : DevExpress.XtraReports.UI.XtraReport
    {
        public MaterialesSubReport()
        {
            InitializeComponent();
            
        }

        public void CargarDatos(IEnumerable<MaterialModel> materiales)
        {
            DataSource = materiales;

            this.materiaPrimaCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Material")});

            this.cantidadCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cantidad")});

            this.importeCell.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Importe")});
        }

    }
}
