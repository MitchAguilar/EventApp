using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMVC.Models
{
    public class Persona
    {
        public string per_identificacion { get; set; }
        public string per_nombre { get; set; }
        public string per_apellido { get; set; }
        public string per_correo { get; set; }
        public string per_celular { get; set; }

        public string per_contrasena { get; set; }
        public string per_repcontrasena{ get; set; }
        
    }
}