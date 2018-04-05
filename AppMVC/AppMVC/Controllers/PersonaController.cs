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
            if (obj.per_contrasena != obj.per_repcontrasena)
            {
                ViewBag.Error = "<script>alert('Las Contraseñas no coiciden');</script>";
            }
            else
            {
                if (obj.Registrar_persona())
                {
                    ViewBag.Error = "<script>alert('Persona registrada de forma satisfactoria');</script>";
                }
                else
                {
                    ViewBag.Error = "<script>alert('La persona no fué registrada');</script>";
                }
            }

            return View();
        }
    }
}