using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;
using PVRA.ModelViews;

namespace PVRA.Controllers
{
    [Authorize(Roles = "ADMIN,GESTOR")]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View("Index", GetVentasCosto());
        }


        public static IList<GraficoModelView> GetVentasCosto()
        {
            var series = new string[] { "Ventas", "Gastos" };
            var meses = new string[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
            var valores = new Dictionary<string, decimal[]>();
            var db = new PvraDataEntities();

            var ventas = from v in db.Ventas
                where v.Fecha.Year == DateTime.Now.Year
                group v by v.Fecha.Month
                into vGroup
                select new
                {
                    Mes = vGroup.Key,
                    Importe = vGroup.Sum(u => u.Importe)
                };

            var salarios = from s in db.Salario
                         where s.Fecha.Year == DateTime.Now.Year
                         group s by s.Fecha.Month
                             into sGroup
                             select new
                             {
                                 Mes = sGroup.Key,
                                 Importe = sGroup.Sum(u => u.Importe)
                             };

            var compras = from v in db.CompraMateriales
                         where v.Fecha.Year == DateTime.Now.Year
                         group v by v.Fecha.Month
                             into vGroup
                             select new
                             {
                                 Mes = vGroup.Key,
                                 Importe = vGroup.Sum(u => u.Importe)
                             };

            var gastos = from s in salarios
                join c in compras on s.Mes equals c.Mes
                select new
                {
                    Mes = c.Mes,
                    Importe = s.Importe + c.Importe
                };
            
            valores.Add(series[0], new decimal[12] );
            valores.Add(series[1], new decimal[12] );
            
            foreach (var g in gastos)
            {
                valores[series[1]][g.Mes - 1] = g.Importe;
            }

            foreach (var v in ventas)
            {
                valores[series[0]][v.Mes - 1] = v.Importe;
            }

            var result = new List<GraficoModelView>();
            foreach (string s in series)
                for (int i = 0; i < meses.Length; i++)
                    result.Add(new GraficoModelView() {Mes = meses[i], Serie = s, Valor = valores[s][i]});
            return result;
        }

        public ActionResult About()
        {
            ViewBag.Message = "La página de descripcion.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Página de contacto.";

            return View();
        }
    }
}