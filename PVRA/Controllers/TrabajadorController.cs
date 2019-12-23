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
    public class TrabajadorController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Trabajador/
        public ActionResult Index()
        {
            var persona = db.Trabajadores.Include(t => t.AreaTrabajo).Include(t => t.Ocupacion);
            return View(persona.ToList());
        }

        // GET: /Trabajador/Create
        public ActionResult Create()
        {
            ViewBag.AreaTrabajoId = new SelectList(db.AreaTrabajo, "Id", "Nombre");
            ViewBag.OcupacionId = new SelectList(db.Ocupacion, "Id", "Nombre");
            return View();
        }

        // POST: /Trabajador/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombres,Apellidos,Direccion,Telefono,AreaTrabajoId,OcupacionId")] Persona_Trabajador trabajador)
        {
            if (ModelState.IsValid)
            {
                db.Persona.Add(trabajador);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AreaTrabajoId = new SelectList(db.AreaTrabajo, "Id", "Nombre", trabajador.AreaTrabajoId);
            ViewBag.OcupacionId = new SelectList(db.Ocupacion, "Id", "Nombre", trabajador.OcupacionId);
            return View(trabajador);
        }

        // GET: /Trabajador/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var trabajador = db.Trabajadores.Find(id);
            if (trabajador == null)
            {
                return HttpNotFound();
            }
            ViewBag.AreaTrabajoId = new SelectList(db.AreaTrabajo, "Id", "Nombre", trabajador.AreaTrabajoId);
            ViewBag.OcupacionId = new SelectList(db.Ocupacion, "Id", "Nombre", trabajador.OcupacionId);
            return View(trabajador);
        }

        // POST: /Trabajador/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombres,Apellidos,Direccion,Telefono,AreaTrabajoId,OcupacionId")] Persona_Trabajador trabajador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(trabajador).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AreaTrabajoId = new SelectList(db.AreaTrabajo, "Id", "Nombre", trabajador.AreaTrabajoId);
            ViewBag.OcupacionId = new SelectList(db.Ocupacion, "Id", "Nombre", trabajador.OcupacionId);
            return View(trabajador);
        }

        // GET: /Trabajador/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var trabajador = db.Trabajadores.Find(id);
            if (trabajador == null)
            {
                return HttpNotFound();
            }
            return View(trabajador);
        }

        // POST: /Trabajador/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var trabajador = db.Trabajadores.Find(id);
            db.Persona.Remove(trabajador);
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
