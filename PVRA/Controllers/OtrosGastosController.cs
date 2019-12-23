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
    public class OtrosGastosController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /OtrosGastos/
        public ActionResult Index()
        {
            var otrosgastos = db.OtrosGastos.Include(o => o.ConceptoGasto);
            return View(otrosgastos.ToList());
        }

        // GET: /OtrosGastos/Create
        public ActionResult Create()
        {
            ViewBag.ConceptoGastoId = new SelectList(db.ConceptoGasto, "Id", "Nombre");
            return View();
        }

        // POST: /OtrosGastos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Fecha,Importe,UsuarioId,ConceptoGastoId")] OtrosGastos otrosgastos)
        {
            if (ModelState.IsValid)
            {
                otrosgastos.UsuarioId = User.Identity.Name;
                db.OtrosGastos.Add(otrosgastos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ConceptoGastoId = new SelectList(db.ConceptoGasto, "Id", "Nombre", otrosgastos.ConceptoGastoId);
            return View(otrosgastos);
        }

        // GET: /OtrosGastos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OtrosGastos otrosgastos = db.OtrosGastos.Find(id);
            if (otrosgastos == null)
            {
                return HttpNotFound();
            }
            ViewBag.ConceptoGastoId = new SelectList(db.ConceptoGasto, "Id", "Nombre", otrosgastos.ConceptoGastoId);
            return View(otrosgastos);
        }

        // POST: /OtrosGastos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Fecha,Importe,UsuarioId,ConceptoGastoId")] OtrosGastos otrosgastos)
        {
            if (ModelState.IsValid)
            {
                otrosgastos.UsuarioId = User.Identity.Name;
                db.Entry(otrosgastos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ConceptoGastoId = new SelectList(db.ConceptoGasto, "Id", "Nombre", otrosgastos.ConceptoGastoId);
            return View(otrosgastos);
        }

        // GET: /OtrosGastos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OtrosGastos otrosgastos = db.OtrosGastos.Find(id);
            if (otrosgastos == null)
            {
                return HttpNotFound();
            }
            return View(otrosgastos);
        }

        // POST: /OtrosGastos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OtrosGastos otrosgastos = db.OtrosGastos.Find(id);
            db.OtrosGastos.Remove(otrosgastos);
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
