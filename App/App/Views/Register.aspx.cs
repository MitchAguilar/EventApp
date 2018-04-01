using App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Views
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            Persona per = new Persona();
            if (P_Password.Value!=P_Repit_Password.Value)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "key", "openInfo3('" +
                    "Las Contraseñas no son iguales',1);", true);
            }
            else
            {
                if (per.registrar_persona(P_Nombres.Value, P_Apellidos.Value, P_Correo.Value,
                    P_Direccion.Value, P_Password.Value, P_Telefono.Value))
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "key", "openInfo3('" +
                    "Usted fué registrado de forma satisfactoria, vaya al login, e ingrese como credenciales" +
                    " su correo: "+P_Correo.Value+", Y la contraseña que digitó. Gracias',2);", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "key", "openInfo3('" +
                    "Lo sentimos, no fué posible llevar a cabo el registro, por favor contactese" +
                    " con el administrador del servicio.',1);", true);
                }
                P_Nombres.Value=null;
                P_Apellidos.Value = null;
                P_Correo.Value = null;
                P_Telefono.Value = null;
                P_Direccion.Value = null;
            }
        }
    }
}