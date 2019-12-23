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
    [Authorize(Roles = "ADMIN")]
    public class ConceptoGastoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /ConceptoGasto/
        public ActionResult Index()
        {
            return View(db.ConceptoGasto.ToList());
        }

        // GET: /ConceptoGasto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /ConceptoGasto/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre,Descripcion")] ConceptoGasto conceptogasto)
        {
            if (ModelState.IsValid)
            {
                db.ConceptoGasto.Add(conceptogasto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(conceptogasto);
        }

        // GET: /ConceptoGasto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConceptoGasto conceptogasto = db.ConceptoGasto.Find(id);
            if (conceptogasto == null)
            {
                return HttpNotFound();
            }
            return View(conceptogasto);
        }

        // POST: /ConceptoGasto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Nombre,Descripcion")] ConceptoGasto conceptogasto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(conceptogasto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(conceptogasto);
        }

        // GET: /ConceptoGasto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConceptoGasto conceptogasto = db.ConceptoGasto.Find(id);
            if (conceptogasto == null)
            {
                return HttpNotFound();
            }
            return View(conceptogasto);
        }

        // POST: /ConceptoGasto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ConceptoGasto conceptogasto = db.ConceptoGasto.Find(id);
            db.ConceptoGasto.Remove(conceptogasto);
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

        public JsonResult CheckNombre(string nombre, int id = 0)
        {
            var result = false;
            if (id == 0)
            {
                var item = db.ConceptoGasto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.ConceptoGasto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
