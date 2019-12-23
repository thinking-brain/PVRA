using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;
using PVRA.Models.BaseTemporal;
using CostoProduccion = PVRA.Models.Salario_CostoProduccion;

namespace PVRA.Controllers
{
    [Authorize(Roles = "ADMIN,GESTOR")]
    public class ProductoConfeccionadoController : Controller
    {
        private PvraDataEntities db = new PvraDataEntities();

        // GET: /ProductoConfeccionado/
        public ActionResult Index()
        {
            var productoConfeccionado = db.EntradaProductos.Where(p => p.Confeccionado).Include(p => p.Producto);
            return View(productoConfeccionado.ToList());
        }

        #region Insertar

        // GET: /ProductoConfeccionado/Create
        public ActionResult Create()
        {
            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta");
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta");
            return View();
        }

        // POST: /ProductoConfeccionado/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Fecha,Cantidad,ProductoId,MaterialesUtilizados,ColorId")]  Models.BaseTemporal.ProductoConfeccionado productoconfeccionado)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                dbTemp.AgregarProducto(productoconfeccionado);
                ViewBag.ProductoConfeccionadoId = productoconfeccionado.Id;
                return View("AgregarMateriales", productoconfeccionado.Materiales);
            }

            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta", productoconfeccionado.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", productoconfeccionado.ProductoId);
            return View(productoconfeccionado);
        }


        // GET: /ProductoConfeccionado/Create
        public PartialViewResult PartialMaterial(int productoConfeccionadoId)
        {
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.InvertarioMaterialesId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0), "Id", "Inventario");
            return PartialView("MaterialFormPartial");
        }

        [HttpPost]
        // POST: /ProductoConfeccionado/Create
        public ActionResult PartialMaterial(Models.BaseTemporal.MaterialesUtilizados material, int productoConfeccionadoId)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
                material.InvertarioMateriales = db.InvertarioMateriasPrimas.Find(material.InvertarioMaterialesId);
                prod.AgregarMaterial(material);
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("AgregarMateriales", prod.Materiales);
            }
            ViewBag.InvertarioMaterialesId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0), "Id", "Inventario");
            return PartialView("MaterialFormPartial");
        }



        // GET: /ProductoConfeccionado/AgregarMateriales
        public ActionResult AgregarMateriales(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("AgregarCosto", prod.Costos);
        }

        // GET: /ProductoConfeccionado/Create
        public PartialViewResult PartialCosto(int productoConfeccionadoId)
        {
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return PartialView("CostoFormPartial");
        }

        [HttpPost]
        // POST: /ProductoConfeccionado/Create
        public ActionResult PartialCosto(Models.BaseTemporal.CostoProduccion costo, int productoConfeccionadoId)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
                costo.Fecha = prod.Fecha;
                costo.ConceptoCosto = db.ConceptoCosto.Find(costo.ConceptoCostoId);
                costo.Trabajador = db.Trabajadores.Find(costo.TrabajadorPersonaId);
                prod.AgregarCosto(costo);

                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("AgregarCosto", prod.Costos);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return PartialView("CostoFormPartial");
        }

        public ActionResult CancelarMateriales(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("AgregarMateriales", prod.Materiales);
        }

        public ActionResult CancelarEditarMateriales(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);

            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarMateriales", prod.Materiales);
        }

        public ActionResult CancelarCostos(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);

            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("AgregarCosto", prod.Costos);
        }

        public ActionResult CancelarEditarCostos(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);

            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarCosto", prod.Costos);
        }

        #endregion

        #region Editar-Borrar Materiales

        public ActionResult EditMateriales(int productoConfeccionadoId, int inventarioMaterialId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var mat = prod.BuscarMaterial(inventarioMaterialId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("MaterialEditFormPartial", mat);
        }

        [HttpPost]
        public ActionResult EditMateriales(Models.BaseTemporal.MaterialesUtilizados material, int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var mat = prod.BuscarMaterial(material.InvertarioMaterialesId);
            if (ModelState.IsValid)
            {
                mat.Cantidad = material.Cantidad;
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("AgregarMateriales", prod.Materiales);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("MaterialEditFormPartial", mat);
        }

        public ActionResult DeleteMaterial(int productoConfeccionadoId, int materialId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            prod.BorrarMaterial(materialId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("AgregarMateriales", prod.Materiales);
        }
        #endregion

#region Editar y Borrar Costos
        public ActionResult EditCosto(int productoConfeccionadoId, int costoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var costo = prod.BuscarCosto(costoId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            return PartialView("CostoEditFormPartial", costo);
        }
        [HttpPost]
        public ActionResult EditCosto(Models.BaseTemporal.CostoProduccion costo, int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var c = prod.BuscarCosto(costo.Id);
            if (ModelState.IsValid)
            {
                c.Importe = costo.Importe;
                c.ConceptoCostoId = costo.ConceptoCostoId;
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("AgregarCosto", prod.Costos);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("CostoEditFormPartial", c);
        }



        public ActionResult DeleteCosto(int productoConfeccionadoId, int id)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            prod.BorrarCosto(id);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("AgregarCosto", prod.Costos);
        }

#endregion

#region Editar Producto
        // GET: /ProductoConfeccionado/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var productoconfeccionado = db.EntradaProductos.Find(id);
            if (productoconfeccionado == null)
            {
                return HttpNotFound();
            }

            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            dbTemp.CargarProducto(productoconfeccionado);
            var pro = dbTemp.BuscarProducto(productoconfeccionado.Id);

            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta",pro.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", pro.ColorId);

            return View(pro);
        }
        // POST: /ProductoConfeccionado/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,Cantidad,ProductoId,MaterialesUtilizados,ColorId")]  Models.BaseTemporal.ProductoConfeccionado productoconfeccionado)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                var prod = dbTemp.BuscarProducto(productoconfeccionado.Id);
                prod.ColorId = productoconfeccionado.ColorId;
                prod.Fecha = productoconfeccionado.Fecha;
                prod.Cantidad = productoconfeccionado.Cantidad;
                prod.ProductoId = productoconfeccionado.ProductoId;

                ViewBag.ProductoConfeccionadoId = productoconfeccionado.Id;
                return View("EditarMateriales", prod.Materiales);
            }

            ViewBag.ProductoId = new SelectList(db.Producto, "Id", "DescripcionCompleta", productoconfeccionado.ProductoId);
            ViewBag.ColorId = new SelectList(db.Color, "Id", "DescricionCompleta", productoconfeccionado.ColorId);
            return View(productoconfeccionado);
        }

        public ActionResult EditarMateriales(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarCosto", prod.Costos);
        }




        
        // GET: /ProductoConfeccionado/Create
        public PartialViewResult PartialMaterialEdit(int productoConfeccionadoId)
        {
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.InvertarioMaterialesId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0), "Id", "Inventario");
            return PartialView("EditMaterialFormPartial");
        }

        [HttpPost]
        // POST: /ProductoConfeccionado/Create
        public ActionResult PartialMaterialEdit(Models.BaseTemporal.MaterialesUtilizados material, int productoConfeccionadoId)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
                material.InvertarioMateriales = db.InvertarioMateriasPrimas.Find(material.InvertarioMaterialesId);
                prod.AgregarMaterial(material);
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("EditarMateriales", prod.Materiales);
            }
            ViewBag.InvertarioMaterialesId = new SelectList(db.InvertarioMateriasPrimas.Where(u => u.Existencia > 0), "Id", "Inventario");
            return PartialView("EditMaterialFormPartial");
        }



        // GET: /ProductoConfeccionado/AgregarMateriales
        public ActionResult AgregarMaterialesEdit(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarCosto", prod.Costos);
        }

        // GET: /ProductoConfeccionado/Create
        public PartialViewResult PartialCostoEdit(int productoConfeccionadoId)
        {
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return PartialView("EditCostoFormPartial");
        }

        [HttpPost]
        // POST: /ProductoConfeccionado/Create
        public ActionResult PartialCostoEdit(Models.BaseTemporal.CostoProduccion costo, int productoConfeccionadoId)
        {
            if (ModelState.IsValid)
            {
                var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
                var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
                costo.Fecha = prod.Fecha;
                costo.ConceptoCosto = db.ConceptoCosto.Find(costo.ConceptoCostoId);
                costo.Trabajador = db.Trabajadores.Find(costo.TrabajadorPersonaId);
                prod.AgregarCosto(costo);

                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("EditarCosto", prod.Costos);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            return PartialView("EditCostoFormPartial");
        }

        public ActionResult EditMaterialesEdit(int productoConfeccionadoId, int inventarioMaterialId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var mat = prod.BuscarMaterial(inventarioMaterialId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("EditMaterialEditFormPartial", mat);
        }

        [HttpPost]
        public ActionResult EditMaterialesEdit(Models.BaseTemporal.MaterialesUtilizados material, int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var mat = prod.BuscarMaterial(material.InvertarioMaterialesId);
            if (ModelState.IsValid)
            {
                mat.Cantidad = material.Cantidad;
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("EditarMateriales", prod.Materiales);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("EditMaterialEditFormPartial", mat);
        }

        public ActionResult DeleteMaterialEdit(int productoConfeccionadoId, int materialId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            prod.BorrarMaterial(materialId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarMateriales", prod.Materiales);
        }
        


        public ActionResult EditCostoEdit(int productoConfeccionadoId, int costoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var costo = prod.BuscarCosto(costoId);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            ViewBag.TrabajadorPersonaId = new SelectList(db.Trabajadores, "Id", "NombreApellidos");
            ViewBag.ConceptoCostoId = new SelectList(db.ConceptoCosto, "Id", "Nombre");
            return PartialView("EditCostoEditFormPartial", costo);
        }
        [HttpPost]
        public ActionResult EditCostoEdit(Models.BaseTemporal.CostoProduccion costo, int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var c = prod.BuscarCosto(costo.Id);
            if (ModelState.IsValid)
            {
                c.Importe = costo.Importe;
                c.ConceptoCostoId = costo.ConceptoCostoId;
                ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
                return View("EditarCosto", prod.Costos);
            }
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return PartialView("EditCostoEditFormPartial", c);
        }



        public ActionResult DeleteCostoEdit(int productoConfeccionadoId, int id)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            prod.BorrarCosto(id);
            ViewBag.ProductoConfeccionadoId = productoConfeccionadoId;
            return View("EditarCosto", prod.Costos);
        }
#endregion
        // GET: /ProductoConfeccionado/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var productoconfeccionado = db.EntradaProductos.Find(id);
            if (productoconfeccionado == null)
            {
                return HttpNotFound();
            }
            return View(productoconfeccionado);
        }

        // POST: /ProductoConfeccionado/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var pC = db.EntradaProductos.Find(id);
            foreach (var m in pC.ProductoConfeccionadoInventarioMaterial)
            {
                var salida = db.SalidaMateriales.FirstOrDefault(s => s.Fecha == pC.Fecha && s.Cantidad == m.Cantidad && s.InvertarioMateriasPrimasId == m.InvertarioMateriasPrimasId);
                if (salida != null)
                {
                    db.SalidaMateriales.Remove(salida);
                }
            }
            var lista = pC.Salario_CostoProduccion.Select(c => c).ToList();
            foreach (var c in lista)
            {
                db.CostoProducciones.Remove(c);
            }
            db.EntradaProductos.Remove(pC);
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



        public ActionResult GuardarProducto(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var entrada = new EntradaProductos()
            {
                Cantidad = prod.Cantidad,
                Fecha = prod.Fecha,
                ProductoId = prod.ProductoId,
                ColorId = prod.ColorId,
                UsuarioId = User.Identity.Name,
                Confeccionado = true
            };
            var costoMateriales = 0m;
            foreach (var m in prod.Materiales)
            {
                var maxMateria =
                    db.MateriasPrimasPorProducto.FirstOrDefault(
                        u =>
                            u.MateriaPrimaId == m.InvertarioMateriales.MateriaPrimaId &&
                            u.ProductoId == entrada.ProductoId);
                if (maxMateria == null)
                {
                    throw new Exception("Este producto no se confecciona con estos materiales");
                }
                if (maxMateria.Cantidad * prod.Cantidad < m.Cantidad)
                {
                    throw new Exception("Este producto no se confecciona con esta cantidad de estos materiales");
                }
                costoMateriales += m.Cantidad * m.InvertarioMateriales.Precio;
                entrada.ProductoConfeccionadoInventarioMaterial.Add(new ProductoConfeccionadoInventarioMaterial() { Cantidad = Math.Round(m.Cantidad, 2), InvertarioMateriasPrimasId = m.InvertarioMaterialesId });
                db.SalidaMateriales.Add(new SalidaMateriales() { Fecha = prod.Fecha, Cantidad = Math.Round(m.Cantidad, 2), UsuarioId = User.Identity.Name, InvertarioMateriasPrimasId = m.InvertarioMaterialesId, Observacion = "Confeccionado" });
            }
            var costoProduccion = prod.Costos.Sum(c => c.Importe);
            foreach (var c in prod.Costos)
            {
                entrada.Salario_CostoProduccion.Add(new Salario_CostoProduccion() { ConceptoCostoId = c.ConceptoCostoId, Fecha = c.Fecha, TrabajadorPersonaId = c.TrabajadorPersonaId, Importe = Math.Round(c.Importe, 2) });
            }
            var importe = (costoMateriales + costoProduccion);
            entrada.Importe = Math.Round(importe, 2);
            db.EntradaProductos.Add(entrada);
            //try
            //{
                db.SaveChanges();
            //}
            //catch (Exception)
            //{
            //    throw new Exception("no se ha podido guardar, consulte al administrador");
            //}
            return RedirectToAction("Index");
        }


        public ActionResult EditarProducto(int productoConfeccionadoId)
        {
            var dbTemp = Models.BaseTemporal.TemporalContext.GetContext();
            var prod = dbTemp.BuscarProducto(productoConfeccionadoId);
            var entrada = db.EntradaProductos.Find(productoConfeccionadoId);

            var costoMateriales = 0m;
            var tempMaterias = entrada.ProductoConfeccionadoInventarioMaterial.ToList();
            foreach (var m in tempMaterias)
            {
                if (prod.BuscarMaterial(m.InvertarioMateriasPrimasId) != null) continue;
                var salida =
                    db.SalidaMateriales.FirstOrDefault(
                        u =>
                            u.Fecha == entrada.Fecha && u.InvertarioMateriasPrimasId == m.InvertarioMateriasPrimasId &&
                            u.Cantidad == m.Cantidad && u.Observacion == "Confeccionado");
                db.SalidaMateriales.Remove(salida);
                entrada.ProductoConfeccionadoInventarioMaterial.Remove(m);
            }

            foreach (var m in prod.Materiales)
            {
                var maxMateria =
                    entrada.Producto.Producto_Material.FirstOrDefault(
                        u => u.MateriaPrimaId == m.InvertarioMateriales.MateriaPrimaId);
                if (maxMateria == null)
                {
                    throw new Exception("Este producto no se confecciona con estos materiales");
                }
                if (maxMateria.Cantidad * prod.Cantidad < m.Cantidad)
                {
                    throw new Exception("Este producto no se confecciona con esta cantidad de estos materiales");
                }
                costoMateriales += m.Cantidad * m.InvertarioMateriales.Precio;
                if (entrada.ProductoConfeccionadoInventarioMaterial.FirstOrDefault(u => u.EntradaProductosId == productoConfeccionadoId && u.InvertarioMateriasPrimasId == m.InvertarioMaterialesId) != null)
                {
                    var materia = entrada.ProductoConfeccionadoInventarioMaterial.FirstOrDefault(
                        u =>
                            u.EntradaProductosId == productoConfeccionadoId &&
                            u.InvertarioMateriasPrimasId == m.InvertarioMaterialesId);
                    
                    var salida =
                        db.SalidaMateriales.FirstOrDefault(
                            u =>
                                u.Fecha == entrada.Fecha && 
                                u.InvertarioMateriasPrimasId == materia.InvertarioMateriasPrimasId &&
                                u.Cantidad == Math.Round(materia.Cantidad, 2) && u.Observacion == "Confeccionado");

                    salida.Fecha = prod.Fecha;
                    salida.Cantidad = Math.Round(m.Cantidad, 2);
                    salida.UsuarioId = User.Identity.Name;

                    materia.Cantidad = Math.Round(m.Cantidad, 2);
                    db.Entry(materia).State = EntityState.Modified;
                    db.Entry(salida).State = EntityState.Modified;
                }
                else
                {
                    db.SalidaMateriales.Add(new SalidaMateriales() { Cantidad = Math.Round(m.Cantidad,2), Fecha = prod.Fecha, InvertarioMateriasPrimasId = m.InvertarioMaterialesId, UsuarioId = User.Identity.Name, Observacion = "Confecionado" });
                    entrada.ProductoConfeccionadoInventarioMaterial.Add(new ProductoConfeccionadoInventarioMaterial() { Cantidad = Math.Round(m.Cantidad, 2), InvertarioMateriasPrimasId = m.InvertarioMaterialesId });
                }
                
            }

            var costoProduccion = 0m;
            var tempCostos = entrada.Salario_CostoProduccion.ToList();
            foreach (var c in tempCostos)
            {
                if (prod.BuscarCosto(c.Id) != null) continue;
                var costo =
                    db.CostoProducciones.Find(c.Id);
                db.CostoProducciones.Remove(costo);
                entrada.Salario_CostoProduccion.Remove(c);
            }

            foreach (var c in prod.Costos)
            {
                costoProduccion += c.Importe;
                var costo = entrada.Salario_CostoProduccion.FirstOrDefault(u => u.Id == c.Id);
                if (costo != null)
                {
                    costo.Importe = Math.Round(c.Importe, 2);
                    costo.TrabajadorPersonaId = c.TrabajadorPersonaId;
                    costo.ConceptoCostoId = c.ConceptoCostoId;
                    db.Entry(costo).State = EntityState.Modified;
                }
                else
                {
                    var nuevoCosto = db.CostoProducciones.Add(new CostoProduccion() {Fecha = entrada.Fecha, ConceptoCostoId = c.ConceptoCostoId, TrabajadorPersonaId = c.TrabajadorPersonaId, Importe =  Math.Round(c.Importe,2)});
                    entrada.Salario_CostoProduccion.Add(nuevoCosto);
                }
            }
            entrada.Importe = Math.Round(costoMateriales + costoProduccion, 2); ;
            entrada.Fecha = prod.Fecha;
            entrada.ProductoId = prod.ProductoId;
            entrada.ColorId = prod.ColorId;
            entrada.Observacion = prod.Observacion;
            entrada.Confeccionado = true;
            entrada.Cantidad = prod.Cantidad;
            entrada.UsuarioId = User.Identity.Name;
            db.Entry(entrada).State = EntityState.Modified;
            dbTemp.Clear();
            //try
            //{
                db.SaveChanges();
            //}
            //catch (Exception)
            //{
            //    throw new Exception("no se ha podido modificar, consulte al administrador");
            //}
            return RedirectToAction("Index");
        }

        //public JsonResult CheckCantidad(decimal cantidad,int entradaProductoId, int invertarioMaterialesId)
        //{
        //    var result = false;
        //    if (entradaProductoId == 0)
        //    {
        //        var item = db.InvertarioMateriasPrimas.FirstOrDefault(i => i.Id == invertarioMaterialesId);
        //        if (item != null)
        //        {
        //            if (cantidad <= item.Existencia)
        //            {
        //                result = true;
        //            }
        //        }
        //    }
        //    else
        //    {
        //        var entrada = db.EntradaProductos.Find(entradaProductoId);
        //        if (entrada.ProductoConfeccionadoInventarioMaterial.First(u => u.InvertarioMateriasPrimasId == invertarioMaterialesId) != null)
        //        {
        //            var invAnterior = db.InvertarioProductos.FirstOrDefault(i => i.Id == entrada.InvertarioProductosId);
        //            var existenciaAnterior = invAnterior.Existencia + entrada.Cantidad;
        //            if (cantidad <= existenciaAnterior)
        //            {
        //                result = true;
        //            }
        //        }
        //        else
        //        {
        //            var item = db.InvertarioProductos.FirstOrDefault(i => i.Id == invertarioProductosId);
        //            if (item != null)
        //            {
        //                if (cantidad <= item.Existencia)
        //                {
        //                    result = true;
        //                }
        //            }
        //        }
        //    }
        //    return Json(result, JsonRequestBehavior.AllowGet);
        //}
    }
}
