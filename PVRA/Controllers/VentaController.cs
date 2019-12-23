using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PVRA.Models;

namespace PVRA.Controllers
{
   [Authorize(Roles = "GESTOR,VENDEDOR")]
    public class VentaController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Venta/
        public ActionResult Index()
        {
            var ventas = db.Ventas.Include(v => v.InvertarioProductos).Include(v => v.Persona_Trabajador);
            return View(ventas.ToList());
        }


        // GET: /Venta/Create
        public ActionResult Create()
        {
            ViewBag.InvertarioProductosId = new SelectList(db.InvertarioProductos.Where(u => u.Existencia > 0 ), "Id", "Inventario");
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return View();
        }

        // POST: /Venta/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Fecha,Importe,Cantidad,Observacion,UsuarioId,InvertarioProductosId,TrabajadorPersonaId")] Ventas ventas)
        {
            if (ModelState.IsValid)
            {
                ventas.UsuarioId = User.Identity.Name;
                db.Ventas.Add(ventas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.InvertarioProductosId = new SelectList(db.InvertarioProductos.Where(u => u.Existencia > 0 || u.Id == ventas.InvertarioProductosId), "Id", "Inventario", ventas.InvertarioProductosId);
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", ventas.TrabajadorPersonaId);
            return View(ventas);
        }

        // GET: /Venta/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return HttpNotFound();
            }
            ViewBag.InvertarioProductosId = new SelectList(db.InvertarioProductos.Where(u => u.Existencia > 0 || u.Id == ventas.InvertarioProductosId), "Id", "Inventario", ventas.InvertarioProductosId);
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", ventas.TrabajadorPersonaId);
            return View(ventas);
        }

        // POST: /Venta/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Fecha,Importe,Cantidad,Observacion,UsuarioId,InvertarioProductosId,TrabajadorPersonaId")] Ventas ventas)
        {
            if (ModelState.IsValid)
            {
                ventas.UsuarioId = User.Identity.Name;
                db.Entry(ventas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.InvertarioProductosId = new SelectList(db.InvertarioProductos.Where(u => u.Existencia > 0 || u.Id == ventas.InvertarioProductosId), "Id", "Inventario", ventas.InvertarioProductosId);
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", ventas.TrabajadorPersonaId);
            return View(ventas);
        }

        // GET: /Venta/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return HttpNotFound();
            }
            return View(ventas);
        }

        // POST: /Venta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ventas ventas = db.Ventas.Find(id);
            db.Ventas.Remove(ventas);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public JsonResult CheckCantidad(decimal cantidad, int invertarioProductosId, int id = 0)
        {
            var result = false;
            if (id == 0)
            {
                var item = db.InvertarioProductos.FirstOrDefault(i => i.Id == invertarioProductosId);
                if (item != null)
                {
                    if (cantidad <= item.Existencia)
                    {
                        result = true;
                    }
                }
            }
            else
            {
                var venta = db.Ventas.Find(id);
                if (venta.InvertarioProductosId == invertarioProductosId)
                {
                    var invAnterior = db.InvertarioProductos.FirstOrDefault(i => i.Id == venta.InvertarioProductosId);
                    var existenciaAnterior = invAnterior.Existencia + venta.Cantidad;
                    if (cantidad <= existenciaAnterior)
                    {
                        result = true;
                    }
                }
                else
                {
                    var item = db.InvertarioProductos.FirstOrDefault(i => i.Id == invertarioProductosId);
                    if (item != null)
                    {
                        if (cantidad <= item.Existencia)
                        {
                            result = true;
                        }
                    }
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
