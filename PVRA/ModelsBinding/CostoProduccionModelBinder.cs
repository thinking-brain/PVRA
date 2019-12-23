using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;

namespace PVRA.ModelsBinding
{
    public class CostoProduccionModelBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            ValueProviderResult value = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
            if (value == null)
                return null;
            if (string.IsNullOrEmpty(value.AttemptedValue))
                return null;
            var listaId = value.AttemptedValue.Split(',');
            var lista = new List<Salario_CostoProduccion>();
            foreach (var id in listaId)
            {
                int entityId;
                if (!int.TryParse(id, out entityId))
                {
                    return null;
                }
                var entity = new PvraDataEntities().CostoProducciones.AsNoTracking().FirstOrDefault(p => p.Id == entityId);
                lista.Add(entity);
            }
            return lista;
        }
    }
}