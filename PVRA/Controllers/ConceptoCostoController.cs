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
    public class ConceptoCostoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /ConceptoCosto/
        public ActionResult Index()
        {
            return View(db.ConceptoCosto.ToList());
        }

        // GET: /ConceptoCosto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /ConceptoCosto/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre")] ConceptoCosto conceptocosto)
        {
            if (ModelState.IsValid)
            {
                db.ConceptoCosto.Add(conceptocosto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(conceptocosto);
        }

        // GET: /ConceptoCosto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConceptoCosto conceptocosto = db.ConceptoCosto.Find(id);
            if (conceptocosto == null)
            {
                return HttpNotFound();
            }
            return View(conceptocosto);
        }

        // POST: /ConceptoCosto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Nombre")] ConceptoCosto conceptocosto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(conceptocosto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(conceptocosto);
        }

        // GET: /ConceptoCosto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConceptoCosto conceptocosto = db.ConceptoCosto.Find(id);
            if (conceptocosto == null)
            {
                return HttpNotFound();
            }
            return View(conceptocosto);
        }

        // POST: /ConceptoCosto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ConceptoCosto conceptocosto = db.ConceptoCosto.Find(id);
            db.ConceptoCosto.Remove(conceptocosto);
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
                var item = db.ConceptoCosto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.ConceptoCosto.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
