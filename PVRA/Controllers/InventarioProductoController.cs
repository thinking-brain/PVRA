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
    
    public class InventarioProductoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /InventarioProducto/
        [Authorize(Roles = "ADMIN")]
        public ActionResult Index()
        {
            var invertarioproductos = db.InvertarioProductos.Where(i => i.Existencia > 0).Include(i => i.Producto).Include(e => e.Color);
            return View(invertarioproductos.ToList());
        }

        [Authorize(Roles = "ADMIN,GESTOR")]
        // GET: /InventarioProducto/
        public ActionResult Lista()
        {
            var invertarioproductos = db.InvertarioProductos.Where(i => i.Existencia > 0).Include(i => i.Producto).Include(e => e.Color);
            return View(invertarioproductos.ToList());
        }

        // GET: /InventarioProducto/Create
        [Authorize(Roles = "ADMIN")]
        public ActionResult Create()
        {
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "Nombre");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta");
            return View();
        }

        // POST: /InventarioProducto/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult Create([Bind(Include="Id,ProductoId,CostoUnitario,Existencia")] InvertarioProductos invertarioproductos)
        {
            if (ModelState.IsValid)
            {
                db.InvertarioProductos.Add(invertarioproductos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "Nombre", invertarioproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertarioproductos.ColorId);
            return View(invertarioproductos);
        }

        // GET: /InventarioProducto/Edit/5
        [Authorize(Roles = "ADMIN")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InvertarioProductos invertarioproductos = db.InvertarioProductos.Find(id);
            if (invertarioproductos == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "Nombre", invertarioproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertarioproductos.ColorId);
            return View(invertarioproductos);
        }

        // POST: /InventarioProducto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult Edit([Bind(Include="Id,ProductoId,CostoUnitario,Existencia")] InvertarioProductos invertarioproductos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invertarioproductos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "Nombre", invertarioproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", invertarioproductos.ColorId);
            return View(invertarioproductos);
        }

        // GET: /InventarioProducto/Delete/5
        [Authorize(Roles = "ADMIN")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            InvertarioProductos invertarioproductos = db.InvertarioProductos.Find(id);
            if (invertarioproductos == null)
            {
                return HttpNotFound();
            }
            return View(invertarioproductos);
        }

        // POST: /InventarioProducto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "ADMIN")]
        public ActionResult DeleteConfirmed(int id)
        {
            InvertarioProductos invertarioproductos = db.InvertarioProductos.Find(id);
            db.InvertarioProductos.Remove(invertarioproductos);
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
