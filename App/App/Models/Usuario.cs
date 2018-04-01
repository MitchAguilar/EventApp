using Proyecto_Club.AccesoDatos.Conection;
using Proyecto_Club.AccesoDatos.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace App.Models
{
    public class Usuario
    {
        private IDatos dat = new Datos();
        /// <summary>
        /// método para consutlar un usuario
        /// </summary>
        /// <param name="usuario">conocido como nickname del usuario</param>
        /// <param name="contrasena">contraseña pertenecinte al dicho nickname</param>
        /// <returns></returns>
        public DataRow Consoultar_usuario(string usuario, string contrasena)
        {
            try
            {
                DataTable dta = new DataTable();
                dta = dat.ConsultarDatos("CALL `consultar_usuario`('" + usuario + "', '" + contrasena + "')");
                if (dta.Rows.Count != 0)
                {
                    return dta.Rows[0];
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