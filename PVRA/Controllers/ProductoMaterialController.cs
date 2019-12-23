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
    public class ProductoMaterialController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /ProductoMaterial/
        public ActionResult Index(int? id)
        {
            if (id ==null)
            {
                ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta");
            }
            else
            {
                ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta",id);
            }
            return View();
        }

        public ActionResult PartialMateriales(int id)
        {
            var producto = db.Producto.Find(id);
            ViewBag.ProductoId = id;
            return PartialView("PartialMaterial",producto.Producto_Material );
        }

        // GET: /ProductoMaterial/Create
        public ActionResult Create(int id)
        {
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta");
            ViewBag.Id = id;
            return View();
        }

        // POST: /ProductoMaterial/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MateriaPrimaId,Cantidad")] Producto_Material producto_material, int id)
        {
            producto_material.ProductoId = id;
            if (ModelState.IsValid)
            {
                db.MateriasPrimasPorProducto.Add(producto_material);
                db.SaveChanges();
                return RedirectToAction("Index",new{Id = id});
            }

            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta");
            ViewBag.Id = id;
            return View(producto_material);
        }

        // GET: /ProductoMaterial/Edit/5
        public ActionResult Edit(int? id, int? materialId )
        {
            if (id == null || materialId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var producto_material = db.MateriasPrimasPorProducto.Find(id, materialId);
            if (producto_material == null)
            {
                return HttpNotFound();
            }
            return View(producto_material);
        }

        // POST: /ProductoMaterial/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MateriaPrimaId,Cantidad")] Producto_Material producto_material, int id)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producto_material).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { Id = id });
            }
            return View(producto_material);
        }

        // GET: /ProductoMaterial/Delete/5
        public ActionResult Delete(int? id, int? materialId)
        {
            if (id == null || materialId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var producto_material = db.MateriasPrimasPorProducto.Find(id,materialId);
            if (producto_material == null)
            {
                return HttpNotFound();
            }
            return View(producto_material);
        }

        // POST: /ProductoMaterial/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id, int materialId)
        {
            var producto_material = db.MateriasPrimasPorProducto.Find(id, materialId);
            db.MateriasPrimasPorProducto.Remove(producto_material);
            db.SaveChanges();
            return RedirectToAction("Index", new { Id = id });
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
