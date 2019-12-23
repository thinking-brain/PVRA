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
    [Authorize(Roles = "GESTOR,VENDEDOR")]
    public class EntradaProductoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /EntradaProducto/
        public ActionResult Index()
        {
            var entradaproductos = db.EntradaProductos.Where(i => !i.Confeccionado).Include(e => e.Producto).Include(e => e.Color);
            return View(entradaproductos.ToList());
        }

        // GET: /EntradaProducto/Create
        public ActionResult Create()
        {
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta");
            return View();
        }

        // POST: /EntradaProducto/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Fecha,Importe,Cantidad,Observacion,ProductoId,ColorId")] EntradaProductos entradaproductos)
        {
            if (ModelState.IsValid)
            {
                entradaproductos.Confeccionado = false;
                entradaproductos.UsuarioId = User.Identity.Name;
                db.EntradaProductos.Add(entradaproductos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta", entradaproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", entradaproductos.ColorId);
            return View(entradaproductos);
        }

        // GET: /EntradaProducto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EntradaProductos entradaproductos = db.EntradaProductos.Find(id);
            if (entradaproductos == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta", entradaproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", entradaproductos.ColorId);
            return View(entradaproductos);}

        // POST: /EntradaProducto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,Importe,Cantidad,Observacion,ProductoId,ColorId")] EntradaProductos entradaproductos)
        {
            if (ModelState.IsValid)
            {
                entradaproductos.UsuarioId = User.Identity.Name;
                db.Entry(entradaproductos).State = EntityState.Modified;db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta", entradaproductos.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", entradaproductos.ColorId);
            return View(entradaproductos);
        }

        // GET: /EntradaProducto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EntradaProductos entradaproductos = db.EntradaProductos.Find(id);
            if (entradaproductos == null)
            {
                return HttpNotFound();
            }
            return View(entradaproductos);
        }

        // POST: /EntradaProducto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EntradaProductos entradaproductos = db.EntradaProductos.Find(id);
            db.EntradaProductos.Remove(entradaproductos);
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
