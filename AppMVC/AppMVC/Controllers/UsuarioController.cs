using AppMVC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppMVC.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult login(Usuario obj)
        {
            DataRow usrv = obj.Consoultar_usuario();
            if (usrv != null)
            {
                Session["User"] = usrv;
                //Session["Nombre"]=usrv.
                Session["Menu"] = "<p>menu</p>";
                Response.Redirect("PrivateViews/index.aspx");
            }
            else
            {
                ViewBag.Error = "<script>alert('Usuario o contraseña incorrecto');</script>";
            }
            return View();
        }
    }
}