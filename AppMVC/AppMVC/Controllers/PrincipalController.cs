﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppMVC.Controllers
{
    public class PrincipalController : Controller
    {
        // GET: Principal
        public ActionResult Inicio()
        {
            return View();
        }


    }
}