using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class TRANGCHUController : Controller
    {
        // GET: TRANGCHU
        KSEntities3 DA = new KSEntities3();
        public ActionResult Index()
        {
            if (Session["username"] == null)
            {
                return View();
            }else
            {
                if (Session["username"].ToString().ToLower() == "admin")
                {
                    Session["Manager"] = @"<div class='nav-item dropdown'>
                                                <a href='#' class='nav-link dropdown-toggle' data-bs-toggle='dropdown'>Manager</a>
                                                <div class='dropdown-menu rounded-0 m-0'>
                                                    <a href='/QUANLYTAIKHOAN/QUANLYTAIKHOAN' class='dropdown-item " + (ViewBag.active == 7 ? "active" : "") + @"'>Manager Account</a>
                                                    <a href='/QUANLYPHONG/QUANLYPHONG' class='dropdown-item " + (ViewBag.active == 8 ? "active" : "") + @"'>Manager Rooms</a>
                                                    <a href='/QUANLYLOAIPHONG/QUANLYLOAIPHONG' class='dropdown-item " + (ViewBag.active == 9 ? "active" : "") + @"'>Manager Type Rooms</a>
                                                </div>
                                            </div>";

                }
                return View();
            }
        }
    }
}