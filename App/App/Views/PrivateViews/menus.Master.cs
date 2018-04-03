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
                if ("3456".Equals(Session["DATOS"].ToString()))
                {
                }
            }
            catch (Exception)
            {
                Response.Redirect("../../Views/Login.aspx");
            }
        }

        protected void salir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.Remove("DATOS");
            try
            {
                Response.Redirect("../../Views/Login.aspx");
            }
            catch (Exception)
            {

            }
        }
    }
}