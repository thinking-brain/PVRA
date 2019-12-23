using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;

namespace PVRA.Controllers
{
    public class PruebasController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        //
        // GET: /Pruebas/
        public ActionResult Index()
        {
            var p = db.EntradaProductos.FirstOrDefault();
            ViewBag.ProductoConfeccionadoId = p.Id;
            return View(p.ProductoConfeccionadoInventarioMaterial);
        }
	}
}