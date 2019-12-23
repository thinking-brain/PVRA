using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;

namespace PVRA.Controllers
{
    [Authorize(Roles = "ADMIN,GESTOR")]
    public class SalidaMaterialController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /SalidaMaterial/
        public ActionResult Index()
        {
            var salidamateriales = db.SalidaMateriales.Include(s => s.InvertarioMateriales);
            return View(salidamateriales.ToList());
        }

        // GET: /SalidaMaterial/Create
        public ActionResult Create()
        {
            ViewBag.InvertarioMateriasPrimasId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0), "Id", "Inventario");
            return View();
        }

        // POST: /SalidaMaterial/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Fecha,Cantidad,Observacion,UsuarioId,InvertarioMateriasPrimasId")] SalidaMateriales salidamateriales)
        {
            if (salidamateriales.Observacion == "Confeccionado")
            {
                ModelState.AddModelError("", "No se puede Crear con Confeccionado en las observaciones");
            }
            if (ModelState.IsValid)
            {
                salidamateriales.UsuarioId = User.Identity.Name;
                db.SalidaMateriales.Add(salidamateriales);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.InvertarioMateriasPrimasId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0 || u.Id == salidamateriales.InvertarioMateriasPrimasId), "Id", "Inventario", salidamateriales.InvertarioMateriasPrimasId);
            return View(salidamateriales);
        }

        // GET: /SalidaMaterial/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalidaMateriales salidamateriales = db.SalidaMateriales.Find(id);
            if (salidamateriales == null)
            {
                return HttpNotFound();
            }
            ViewBag.InvertarioMateriasPrimasId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0 || u.Id == salidamateriales.InvertarioMateriasPrimasId), "Id", "Inventario", salidamateriales.InvertarioMateriasPrimasId);
            return View(salidamateriales);
        }

        // POST: /SalidaMaterial/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,Cantidad,Observacion,UsuarioId,InvertarioMateriasPrimasId")] SalidaMateriales salidamateriales)
        {
            if (salidamateriales.Observacion == "Confeccionado")
            {
                ModelState.AddModelError("","No se puede modificar porque es una salida de productos confeccionado");
            }
            if (ModelState.IsValid)
            {
                salidamateriales.UsuarioId = User.Identity.Name;
                db.Entry(salidamateriales).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.InvertarioMateriasPrimasId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0 || u.Id == salidamateriales.InvertarioMateriasPrimasId), "Id", "Inventario", salidamateriales.InvertarioMateriasPrimasId);
            return View(salidamateriales);
        }

        // GET: /SalidaMaterial/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalidaMateriales salidamateriales = db.SalidaMateriales.Find(id);
            if (salidamateriales == null)
            {
                return HttpNotFound();
            }
            if (salidamateriales.Observacion == "Confeccionado")
            {
                throw new Exception("No se puede modificar porque es una salida de productos confeccionado");
            }
            return View(salidamateriales);
        }

        // POST: /SalidaMaterial/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SalidaMateriales salidamateriales = db.SalidaMateriales.Find(id);
            db.SalidaMateriales.Remove(salidamateriales);
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

        public JsonResult CheckCantidad(decimal cantidad, int invertarioMateriasPrimasId, int id = 0)
        {
            var result = false;
            if (id == 0)
            {
                var item = db.InvertarioMateriasPrimas.FirstOrDefault(i => i.Id == invertarioMateriasPrimasId);
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
                var salida = db.SalidaMateriales.Find(id);
                if (salida.InvertarioMateriasPrimasId == invertarioMateriasPrimasId)
                {
                    var invAnterior = db.InvertarioMateriasPrimas.FirstOrDefault(i => i.Id == salida.InvertarioMateriasPrimasId);
                    var existenciaAnterior = invAnterior.Existencia + salida.Cantidad;
                    if (cantidad <= existenciaAnterior)
                    {
                        result = true;
                    }
                }
                else
                {
                    var item = db.InvertarioMateriasPrimas.FirstOrDefault(i => i.Id == invertarioMateriasPrimasId);
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
