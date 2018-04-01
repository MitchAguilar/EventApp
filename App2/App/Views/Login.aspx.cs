using App.Models;
using System;
using System.Collections.Generic;
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
            if (usr.Consoultar_usuario(U_usuario.Value, U_Password.Value))
            {
                Response.Write("<script>alert('yes');</script>");
            }
            else
            {
                Response.Write("<script>alert('no');</script>");
            }
        }
    }
}