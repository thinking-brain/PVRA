using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PVRA.Models;

namespace PVRA.ModelsBinding
{
    public class EntityModelBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(Type modelType)
        {
            if (typeof(ICollection<InvertarioMateriales>).IsAssignableFrom(modelType))
                return new InventarioMaterialModelBinder();
            if (typeof(ICollection<Salario_CostoProduccion>).IsAssignableFrom(modelType))
                return new CostoProduccionModelBinder();
            return null;
        }
    }
}