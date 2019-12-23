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
    public class UnidadMedidaController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /UnidadMedida/
        public ActionResult Index()
        {
            return View(db.UnidadMedida.ToList());
        }

        // GET: /UnidadMedida/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /UnidadMedida/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Unidad,Siglas")] UnidadMedida unidadmedida)
        {
            if (ModelState.IsValid)
            {
                db.UnidadMedida.Add(unidadmedida);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(unidadmedida);
        }

        // GET: /UnidadMedida/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UnidadMedida unidadmedida = db.UnidadMedida.Find(id);
            if (unidadmedida == null)
            {
                return HttpNotFound();
            }
            return View(unidadmedida);
        }

        // POST: /UnidadMedida/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Unidad,Siglas")] UnidadMedida unidadmedida)
        {
            if (ModelState.IsValid)
            {
                db.Entry(unidadmedida).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(unidadmedida);
        }

        // GET: /UnidadMedida/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UnidadMedida unidadmedida = db.UnidadMedida.Find(id);
            if (unidadmedida == null)
            {
                return HttpNotFound();
            }
            return View(unidadmedida);
        }

        // POST: /UnidadMedida/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UnidadMedida unidadmedida = db.UnidadMedida.Find(id);
            db.UnidadMedida.Remove(unidadmedida);
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
