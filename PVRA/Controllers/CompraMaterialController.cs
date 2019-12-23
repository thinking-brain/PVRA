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
    public class CompraMaterialController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /CompraMaterial/
        public ActionResult Index()
        {
            var compramateriales = db.CompraMateriales.Include(c => c.Persona_Proveedor).Include(c => c.Material).Include(e => e.Color);
            return View(compramateriales.ToList());
        }

        // GET: /CompraMaterial/Create
        public ActionResult Create()
        {
            ViewBag.ProveedorPersonaId = new SelectList(db.Proveedores, "Id", "NombreApellidos");
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta");
            return View();
        }

        // POST: /CompraMaterial/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Fecha,Importe,Cantidad,Observacion,ProveedorPersonaId,MateriaPrimaId,ColorId")] CompraMateriales compramateriales)
        {
            if (ModelState.IsValid)
            {
                compramateriales.UsuarioId = User.Identity.Name;
                db.CompraMateriales.Add(compramateriales);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProveedorPersonaId = new SelectList(db.Proveedores, "Id", "NombreApellidos", compramateriales.ProveedorPersonaId);
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta", compramateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", compramateriales.ColorId);
            return View(compramateriales);
        }

        // GET: /CompraMaterial/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompraMateriales compramateriales = db.CompraMateriales.Find(id);
            if (compramateriales == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProveedorPersonaId = new SelectList(db.Proveedores, "Id", "NombreApellidos", compramateriales.ProveedorPersonaId);
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta", compramateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", compramateriales.ColorId);
            return View(compramateriales);
        }

        // POST: /CompraMaterial/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,Importe,Cantidad,Observacion,ProveedorPersonaId,MateriaPrimaId,ColorId")] CompraMateriales compramateriales)
        {
            if (ModelState.IsValid)
            {
                compramateriales.UsuarioId = User.Identity.Name;
                db.Entry(compramateriales).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProveedorPersonaId = new SelectList(db.Proveedores, "Id", "NombreApellidos", compramateriales.ProveedorPersonaId);
            ViewBag.MateriaPrimaId = new SelectList(db.Material, "Id", "DescripcionCompleta", compramateriales.MateriaPrimaId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", compramateriales.ColorId);
            return View(compramateriales);
        }

        // GET: /CompraMaterial/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompraMateriales compramateriales = db.CompraMateriales.Find(id);
            if (compramateriales == null)
            {
                return HttpNotFound();
            }
            return View(compramateriales);
        }

        // POST: /CompraMaterial/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CompraMateriales compramateriales = db.CompraMateriales.Find(id);
            db.CompraMateriales.Remove(compramateriales);
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
