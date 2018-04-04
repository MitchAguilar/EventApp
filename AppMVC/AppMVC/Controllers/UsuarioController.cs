using AppMVC.Models;
using System;
using System.Collections.Generic;
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
           
            return View();
        }
    }
}