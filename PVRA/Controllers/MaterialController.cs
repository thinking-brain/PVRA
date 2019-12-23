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
    public class MaterialController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /Material/
        public ActionResult Index()
        {
            var material = db.Material.Include(m => m.UnidadMedida);
            return View(material.ToList());
        }

        // GET: /Material/Create
        public ActionResult Create()
        {
            ViewBag.UnidadMedidaId = new SelectList(db.UnidadMedida, "Id", "Unidad");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "Nombre");
            return View();
        }

        // POST: /Material/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Nombre,Descripcion,UnidadMedidaId,ColorId")] Material material)
        {
            if (ModelState.IsValid)
            {
                db.Material.Add(material);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UnidadMedidaId = new SelectList(db.UnidadMedida, "Id", "Unidad", material.UnidadMedidaId);
            return View(material);
        }

        // GET: /Material/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var material = db.Material.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            ViewBag.UnidadMedidaId = new SelectList(db.UnidadMedida, "Id", "Unidad", material.UnidadMedidaId);
            return View(material);
        }

        // POST: /Material/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,Descripcion,UnidadMedidaId,ColorId")] Material material)
        {
            if (ModelState.IsValid)
            {
                db.Entry(material).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UnidadMedidaId = new SelectList(db.UnidadMedida, "Id", "Unidad", material.UnidadMedidaId);
            return View(material);
        }

        // GET: /Material/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var material = db.Material.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // POST: /Material/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var material = db.Material.Find(id);
            db.Material.Remove(material);
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
                var item = db.Material.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower());
                if (item == null)
                {
                    result = true;
                }
            }
            else
            {
                var item = db.Material.FirstOrDefault(i => i.Nombre.ToLower() == nombre.ToLower() && i.Id != id);
                if (item == null)
                {
                    result = true;
                }
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
