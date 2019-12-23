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
    public class AreaTrabajoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /AreaTrabajo/
        public ActionResult Index()
        {
            return View(db.AreaTrabajo.ToList());
        }

        // GET: /AreaTrabajo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /AreaTrabajo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre")] AreaTrabajo areatrabajo)
        {
            if (ModelState.IsValid)
            {
                db.AreaTrabajo.Add(areatrabajo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(areatrabajo);
        }

        // GET: /AreaTrabajo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AreaTrabajo areatrabajo = db.AreaTrabajo.Find(id);
            if (areatrabajo == null)
            {
                return HttpNotFound();
            }
            return View(areatrabajo);
        }

        // POST: /AreaTrabajo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Nombre")] AreaTrabajo areatrabajo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(areatrabajo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(areatrabajo);
        }

        // GET: /AreaTrabajo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AreaTrabajo areatrabajo = db.AreaTrabajo.Find(id);
            if (areatrabajo == null)
            {
                return HttpNotFound();
            }
            return View(areatrabajo);
        }

        // POST: /AreaTrabajo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AreaTrabajo areatrabajo = db.AreaTrabajo.Find(id);
            db.AreaTrabajo.Remove(areatrabajo);
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
                var item = db.AreaTrabajo.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.AreaTrabajo.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
