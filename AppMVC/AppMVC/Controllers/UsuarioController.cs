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
            DataTable usrv = new DataTable();
            usrv=obj.Consoultar_usuario();
            if (usrv != null)
            {
                string abc = usrv.Rows[0]["ROL"].ToString();
                Session["User"] = usrv;
                System.Web.HttpContext.Current.Session["roluser"] = usrv.Rows[0]["ROL"].ToString();
                return RedirectToAction("../Principal/Inicio");
            }
            else
            {
                ViewBag.Error = "<script>alert('Usuario o contraseña incorrecto');</script>";
                return RedirectToAction("login");
            }
        }
    }
}