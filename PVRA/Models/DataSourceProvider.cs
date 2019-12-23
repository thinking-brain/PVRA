using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PVRA.Models
{
    public static class DataSourceProvider
    {
        private static PvraDataEntities db = new PvraDataEntities();

        public static IEnumerable GetInventarioMateriales()
        {
            return db.InvertarioMateriasPrimas.ToList();
        }
    }
}