using App.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Views
{
    public partial class Logi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Usuario usr = new Usuario();
            DataRow usrv = usr.Consoultar_usuario(U_usuario.Value, U_Password.Value);
            if (usrv != null)
            {
                Session["DATOS"] = usrv;
                Response.Redirect("PrivateViews/index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "key", "openInfo3('Usuario o contraseña incorrectos',1);", true);
            }
        }
    }
}