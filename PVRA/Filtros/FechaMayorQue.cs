using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PVRA.Filtros
{
    public class FechaMayorQue:ValidationAttribute
    {
        public string OtraPropiedad { get; set; }

        public FechaMayorQue(string otraPropiedad)
            : base("{0} debe ser mayor que {1}")
        {
            OtraPropiedad = otraPropiedad;
        }

        public override string FormatErrorMessage(string name)
        {
            return String.Format(ErrorMessageString, name, OtraPropiedad);
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                var otraPropiedadInfo = validationContext.ObjectType.GetProperty(OtraPropiedad);
                var otraFecha = (DateTime)otraPropiedadInfo.GetValue(validationContext.ObjectInstance);
                var estaFecha = (DateTime)value;
                if (otraFecha >= estaFecha)
                {
                    var mensaje = FormatErrorMessage(validationContext.DisplayName);
                    return new ValidationResult(mensaje);
                } 
            }
            return null;
        }
    }
}