using Proyecto_Club.AccesoDatos.Conection;
using Proyecto_Club.AccesoDatos.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App.Models
{
    public class Persona
    {
        private IDatos dat = new Datos();
        /// <summary>
        /// metodo para registrar personas
        /// </summary>
        /// <param name="nombres"></param>
        /// <param name="apellidos"></param>
        /// <param name="correo"></param>
        /// <param name="direccion"></param>
        /// <param name="contraseña"></param>
        /// <param name="telefono"></param>
        /// <returns>si fué posible registrar a la persona o no</returns>
        public bool registrar_persona(string nombres,string apellidos,string correo,string direccion,string contraseña,string telefono)
        {
            try
            {
                if (dat.OperarDatos("CALL `registrar persona`('"+nombres+"', '"+apellidos+"', '"+correo+"', '"+
                    direccion+"', '"+contraseña+"', '"+telefono+"')"))
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