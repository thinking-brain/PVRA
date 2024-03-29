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
    
    public partial class Persona
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Direcci�n")]
        public string Direccion { get; set; }
        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Tel�fono")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Nombres")]
        public string Nombres { get; set; }

        [Required(ErrorMessage = "{0} es obligatorio")]
        [Display(Name = "Apellidos")]
        public string Apellidos { get; set; }

        [Display(Name = "Nombre y Apellidos")]
        public string NombreApellidos
        {
            get { return Nombres + " " + Apellidos; }
        }}
}
