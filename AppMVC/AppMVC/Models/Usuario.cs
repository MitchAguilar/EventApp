using AppMVC.AccesoDatos.Conection;
using AppMVC.AccesoDatos.Interface;
using System;
using System.Data;

namespace AppMVC.Models
{
    public class Usuario
    {
        /// <summary>
        /// clase de conexion
        /// </summary>
        private IDatos dat = new Datos();

        /// <summary>
        /// metodos get and set
        /// </summary>
        public string user_name { get; set; }
        public string user_pass { get; set; }

        /// <summary>
        /// método para consutlar un usuario
        /// </summary>
        /// <param name="usuario">conocido como nickname del usuario</param>
        /// <param name="contrasena">contraseña pertenecinte al dicho nickname</param>
        /// <returns></returns>
        public DataTable Consoultar_usuario()
        {
            try
            {
                DataTable dta = new DataTable();
                dta = dat.ConsultarDatos("CALL `consultar_usuario`('" + user_name + "', '" + user_pass+ "')");
                if (dta.Rows.Count != 0)
                {
                    return dta;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}