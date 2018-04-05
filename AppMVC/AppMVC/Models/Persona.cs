using AppMVC.AccesoDatos.Conection;
using AppMVC.AccesoDatos.Interface;
using System;
using System.Collections.Generic;
using System.Data;
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
        public string per_repcontrasena { get; set; }
        /// <summary>
        /// clase de conexion
        /// </summary>
        private IDatos dat = new Datos();
        public bool Registrar_persona()
        {
            try
            {
                if (dat.OperarDatos("CALL `registrar_persona`('" + per_identificacion + "','" + per_nombre + "','" + per_apellido + "','" + per_correo + "','" + per_celular + "','" + per_contrasena + "')"))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}