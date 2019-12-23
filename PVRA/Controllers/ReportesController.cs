using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using DevExpress.XtraReports.UI;
using PVRA.Models;
using PVRA.ModelViews;
using PVRA.Reportes;

namespace PVRA.Controllers
{
    [Authorize(Roles = "ADMIN,GESTOR")]
    public class ReportesController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        static XtraReport report;


        public ActionResult ReportViewerPartial()
        {
            ViewData["Report"] = report;
            return PartialView("ReportViewerPartial");
        }
        public ActionResult ExportReportViewer()
        {
            return DevExpress.Web.Mvc.ReportViewerExtension.ExportTo(report);
        }

        //
        // GET: /Reportes/GananciaMensual
        public ActionResult GananciaMensual()
        {
            var db = new PvraDataEntities();
            var iniY = db.CompraMateriales.Min(f => f.Fecha);
            var finY = db.Ventas.Max(f => f.Fecha);

            var years = new List<dynamic>();
            for (int i = iniY.Year; i <= finY.Year; i++)
            {
                years.Add(new { year = i });
            }
            ViewBag.Year = new SelectList(years, "year", "year");
            return View("GananciaYear");   
        }

        //
        // POST: /Reportes/GananciaMensual
        [HttpPost]
        public ActionResult GananciaMensual(int year)
        {
            report = new Ganancia(year);
            return View("Plantilla");
        }

        //
        // GET: /Reportes/ProductosVendidos
        public ActionResult ProductosVendidos()
        {
            return View("ProductosVendidosPeriodo");
        }

        //
        // POST: /Reportes/ProductosVendidos
        [HttpPost]
        public ActionResult ProductosVendidos(PeriodoModel periodo)
        {
            report = new ProductosVendidosEnPeriodo(periodo);
            return View("Plantilla");  
        }

        //
        // GET: /Reportes/CostoDeProductos
        public ActionResult CostoDeProductos()
        {
            return View("CostoDeProductosPeriodo");
        }

        //
        // POST: /Reportes/CostoDeProductos
        [HttpPost]
        public ActionResult CostoDeProductos(PeriodoModel periodo)
        {
            report = new CostoDeProductosEnPeriodo(periodo);
            return View("Plantilla");  
        }

        //
        // GET: /Reportes/SalariosPagados
        public ActionResult SalariosPagados()
        {
            return View("SalarioPeriodo");
        }

        //
        // POST: /Reportes/MaterialesPorProveedor
        [HttpPost]
        public ActionResult SalariosPagados(PeriodoModel periodo)
        {
            report = new SalarioPorTrabajador(periodo);
            return View("Plantilla");
        }

        //
        // GET: /Reportes/MaterialesPorProveedor
        public ActionResult MaterialesPorProveedor()
        {
            return View("MaterialesPorProveedorPeriodo");
        }

        //
        // POST: /Reportes/MaterialesPorProveedor
        [HttpPost]
        public ActionResult MaterialesPorProveedor(PeriodoModel periodo)
        {
            report = new MaterialesPorProveedor(periodo);
            return View("Plantilla");
        }

        //
        // GET: /Reportes/MaterialesUtilizados
        public ActionResult MaterialesUtilizados()
        {
            return View("MaterialesUtilizadosPeriodo");
        }

        //
        // POST: /Reportes/MaterialesUtilizados
        [HttpPost]
        public ActionResult MaterialesUtilizados(PeriodoModel periodo)
        {
            report = new MaterialesUtilizados(periodo);
            return View("Plantilla");
        }

        

        //
        // GET: /Reportes/TrabajadoresVentas
        public ActionResult TrabajadoresVentas()
        {
            return View("VentasPeriodo");
        }

        //
        // POST: /Reportes/TrabajadoresVentas
        [HttpPost]
        public ActionResult TrabajadoresVentas(PeriodoModel periodo)
        {
            report = new VentasPorTrabajador(periodo);
            return View("Plantilla");
        }
	}
}