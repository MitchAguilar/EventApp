using AppMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppMVC.Controllers
{
    public class PersonaController : Controller
    {
        // GET: Persona
        public ActionResult registro()
        {
            return View();
        }

        [HttpPost]
        public ActionResult registro(Persona obj)
        {
            return View();
        }
    }
}