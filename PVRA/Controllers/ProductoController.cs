using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    public class ProductoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Producto/
        public ActionResult Index()
        {
            var producto = db.Producto;
            return View(producto.ToList());
        }

        // GET: /Producto/Create
        public ActionResult Create()
        {
            ViewBag.Talla = new SelectList(Tallas(), "Id", "Nombre");
            return View();
        }

        // POST: /Producto/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre,Descripcion,Modelo,Talla,ColorId")] Producto producto)
        {
            if (ModelState.IsValid)
            {
                db.Producto.Add(producto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.Talla = new SelectList(Tallas(), "Id", "Nombre");
            return View(producto);
        }

        // GET: /Producto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producto producto = db.Producto.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            ViewBag.Talla = new SelectList(Tallas(), "Id", "Nombre",producto.Talla);
            return View(producto);
        }

        // POST: /Producto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,Descripcion,Modelo,Talla,ColorId")] Producto producto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.Talla = new SelectList(Tallas(), "Id", "Nombre", producto.Talla);
            return View(producto);
        }

        // GET: /Producto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producto producto = db.Producto.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            return View(producto);
        }

        // POST: /Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Producto producto = db.Producto.Find(id);
            db.Producto.Remove(producto);
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

        private IEnumerable<dynamic> Tallas()
        {
            var tallas = new List<dynamic>
            {
                new { Id = 1, Nombre = "Pequeño" },
                new { Id = 2, Nombre = "Medio" },
                new {Id = 3, Nombre = "Grande"},
                new {Id = 4, Nombre = "ExtraGrande"},
            };
            return tallas;
        }

        public JsonResult CheckNombre(string nombre, int id = 0)
        {
            var result = false;
            if (id == 0)
            {
                var item = db.Producto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.Producto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
