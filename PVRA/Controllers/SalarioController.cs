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
    public class SalarioController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Salario/
        public ActionResult Index()
        {
            var salario = db.Salario.Where(s => !(s is Salario_CostoProduccion)).Include(s => s.Persona_Trabajador);
            return View(salario.ToList());
        }

        // GET: /Salario/Create
        public ActionResult Create()
        {
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return View();
        }

        // POST: /Salario/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Fecha,Importe,TrabajadorPersonaId")] Salario salario)
        {
            if (ModelState.IsValid)
            {
                db.Salario.Add(salario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", salario.TrabajadorPersonaId);
            return View(salario);
        }

        // GET: /Salario/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Salario salario = db.Salario.Find(id);
            if (salario == null)
            {
                return HttpNotFound();
            }
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", salario.TrabajadorPersonaId);
            return View(salario);
        }

        // POST: /Salario/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Fecha,Importe,TrabajadorPersonaId")] Salario salario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(salario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos", salario.TrabajadorPersonaId);
            return View(salario);
        }

        // GET: /Salario/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Salario salario = db.Salario.Find(id);
            if (salario == null)
            {
                return HttpNotFound();
            }
            return View(salario);
        }

        // POST: /Salario/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Salario salario = db.Salario.Find(id);
            db.Salario.Remove(salario);
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
