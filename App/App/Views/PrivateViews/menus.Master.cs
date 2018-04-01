using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App.Views.PrivateViews
{
    public partial class menus : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if ("si".Equals(Session["admin"].ToString()))
                {
                }
            }
            catch (Exception)
            {
                Response.Redirect("../../Login.aspx");
            }
        }

        protected void salir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.Remove("DATOS");
            try
            {
                Response.Redirect("../../Login.aspx");
            }
            catch (Exception)
            {

            }
        }
    }
}