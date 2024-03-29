//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace PVRA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Persona_Trabajador : Persona
    {
        public Persona_Trabajador()
        {
            this.Salario = new HashSet<Salario>();
            this.Ventas = new HashSet<Ventas>();
        }
    
        public int AreaTrabajoId { get; set; }
        public int OcupacionId { get; set; }

        [Display(Name = "�rea de Trabajo")]
        public virtual AreaTrabajo AreaTrabajo { get; set; }

        [Display(Name = "Ocupaci�n")]
        public virtual Ocupacion Ocupacion { get; set; }
        public virtual ICollection<Salario> Salario { get; set; }
        public virtual ICollection<Ventas> Ventas { get; set; }
    }
}
