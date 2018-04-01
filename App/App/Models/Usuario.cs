using Proyecto_Club.AccesoDatos.Conection;
using Proyecto_Club.AccesoDatos.Interface;
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
                if (dat.ConsultarDatos("CALL `consultar_usuario`('AA', 'AA')").Rows.Count!=0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception io)
            {
                string aa = io.Message;
                return false;
            }
        }
    }
}