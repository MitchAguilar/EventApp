using Proyecto.AccesoDatos.Conection;
using Proyecto.AccesoDatos.Interface;
using System;
using System.Collections.Generic;
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
        public bool Consoultar_usuario(string usuario, string contrasena)
        {
            try
            {
                if (dat.ConsultarDatos("CALL `consultar_usuario`('RSA_ENCRYPT(str" + usuario + "','event')), 'RSA_ENCRYPT(str" + contrasena+ "','event'))").Rows.Count!=0)
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