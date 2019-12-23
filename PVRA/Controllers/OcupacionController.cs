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
    public class OcupacionController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Ocupacion/
        public ActionResult Index()
        {
            return View(db.Ocupacion.ToList());
        }

        // GET: /Ocupacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ocupacion ocupacion = db.Ocupacion.Find(id);
            if (ocupacion == null)
            {
                return HttpNotFound();
            }
            return View(ocupacion);
        }

        // GET: /Ocupacion/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Ocupacion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre,Descripcion")] Ocupacion ocupacion)
        {
            if (ModelState.IsValid)
            {
                db.Ocupacion.Add(ocupacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ocupacion);
        }

        // GET: /Ocupacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ocupacion ocupacion = db.Ocupacion.Find(id);
            if (ocupacion == null)
            {
                return HttpNotFound();
            }
            return View(ocupacion);
        }

        // POST: /Ocupacion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Nombre,Descripcion")] Ocupacion ocupacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ocupacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ocupacion);
        }

        // GET: /Ocupacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ocupacion ocupacion = db.Ocupacion.Find(id);
            if (ocupacion == null)
            {
                return HttpNotFound();
            }
            return View(ocupacion);
        }

        // POST: /Ocupacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ocupacion ocupacion = db.Ocupacion.Find(id);
            db.Ocupacion.Remove(ocupacion);
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
                var item = db.Ocupacion.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.Ocupacion.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
