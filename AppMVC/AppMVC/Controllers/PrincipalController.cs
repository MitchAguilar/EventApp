using System;
using System.Collections.Generic;
using System.Data;
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
            ViewData["roluser"] = System.Web.HttpContext.Current.Session["roluser"] as String;
            switch (Session["roluser"])
            {
                case "1":
                    Session["Menu"] = "" +
                        "<li class=\"active treeview\">" +
                        " <a href=\"#\">" +
                        "<i class=\"fa fa-dashboar\"></i><span>Inicio</span>" +
                        "<span class=\"pull-right-container\"> " +
                        "<i class=\"fa fa-angle-left pull-right\"></i>" +
                        "</span>" +
                        "</a>" +
                        "<ul class=\"treeview-menu\">" +
                        "<li class=\"\">" +
                        "<a href=\"#\"><i class=\"fa fa-circle-o\"></i>VerReporte</a>" +
                        "</li>" +
                        "</ul>" +
                        "</li>";
                        ;
                    break;
                case "2":

                    break;
            }

            return View();
        }


    }
}