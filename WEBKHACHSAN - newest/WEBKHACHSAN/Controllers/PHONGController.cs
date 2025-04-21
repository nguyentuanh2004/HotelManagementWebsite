using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class PHONGController : Controller
    {
        // GET: PHONG
        KSEntities3 DA = new KSEntities3();
        public ActionResult Index(string IDLOAIPHONG)
        {
            if(IDLOAIPHONG != null && int.TryParse(IDLOAIPHONG, out int idloaiphong))
            {
                var LOAIPHONG = DA.LOAIPHONGs.FirstOrDefault(X => X.IDLOAIPHONG == idloaiphong);
                ViewBag.IDLOAIPHONG = LOAIPHONG.TENHINHANHLOAIPHONG.ToString();
                return View(DA.PHONGs.Where(x => x.IDLOAIPHONG == idloaiphong && x.HINHANHPHONGs.Any(h => h.VITRI == 1)).ToList());
            }else
            {
                return RedirectToAction("LOAIPHONG", "LOAIPHONG");
            }
            
        }
    }
}