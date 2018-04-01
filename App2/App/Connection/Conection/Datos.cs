using App.Connection.Interface;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace App.Connection.Conection
{
    public class Datos: Connection, IDatos
    {
        //Realizar operaciones en la base de datos
        public bool OperarDatos(string sql)
        {
            try
            {
                MySqlCommand comando = new MySqlCommand(sql, Conectar());
                if (comando.ExecuteNonQuery() > 0)
                {
                    Desconector();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        //Realizar consulta en la base de datos.
        public DataTable ConsultarDatos(string sql)
        {
            DataTable datos = new DataTable();
            try
            {
                MySqlDataAdapter da = new MySqlDataAdapter(sql, Conectar());
                da.Fill(datos);
                Desconector();
                return datos;
            }
            catch
            {
                return null;
            }
        }
    }
}