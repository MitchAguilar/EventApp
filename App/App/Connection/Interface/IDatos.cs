using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.AccesoDatos.Interface
{
  interface IDatos
  {
    bool OperarDatos(string sql);
    DataTable ConsultarDatos(string sql);
  }
}

