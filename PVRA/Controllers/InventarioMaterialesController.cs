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
    
    public class InventarioMaterialesController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /InventarioMateriales/
        [Authorize(Roles = "ADMIN")]
        public ActionResult Index()
        {
            var invertariomateriales = db.InvertarioMateriasPrimas.Where(i => i.Existencia > 0).Include(i => i.Material).Include(e => e.Color);
            return View(invertariomateriales.ToList());
        }

        [Authorize(Roles = "ADMIN,GESTOR")]
        // GET: /InventarioMateriales/
        public ActionResult Lista()
        {
            var invertariomateriales = db.InvertarioMateriasPrimas.Where(i => i.Existencia > 0).Include(i => i.Material).Include(e => e.Color);
            return View(invertariomateriales.ToList());
        }

        // GET: /InventarioMateriales/Create
        [Authorize(Roles = "ADMIN")]
        public ActionResult Create()
        {
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "Nombre");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta");
            return View();
        }

        // POST: /InventarioMateriales/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult Create([Bind(Include = "Id,MateriaPrimaId,Precio,Existencia,Descripcion")] InvertarioMateriales invertariomateriales)
        {
            if (ModelState.IsValid)
            {
                db.InvertarioMateriasPrimas.Add(invertariomateriales);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "Nombre", invertariomateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertariomateriales.ColorId);
            return View(invertariomateriales);
        }

        // GET: /InventarioMateriales/Edit/5
        [Authorize(Roles = "ADMIN")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var invertariomateriales = db.InvertarioMateriasPrimas.Find(id);
            if (invertariomateriales == null)
            {
                return HttpNotFound();
            }
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "Nombre", invertariomateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertariomateriales.ColorId);
            return View(invertariomateriales);
        }

        // POST: /InventarioMateriales/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult Edit([Bind(Include = "Id,MateriaPrimaId,Precio,Existencia,Descripcion")] InvertarioMateriales invertariomateriales)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invertariomateriales).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "Nombre", invertariomateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertariomateriales.ColorId);
            return View(invertariomateriales);
        }

        // GET: /InventarioMateriales/Delete/5
        [Authorize(Roles = "ADMIN")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var invertariomateriales = db.InvertarioMateriasPrimas.Find(id);
            if (invertariomateriales == null)
            {
                return HttpNotFound();
            }
            return View(invertariomateriales);
        }

        // POST: /InventarioMateriales/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult DeleteConfirmed(int id)
        {
            var invertariomateriales = db.InvertarioMateriasPrimas.Find(id);
            db.InvertarioMateriasPrimas.Remove(invertariomateriales);
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
    }
}
