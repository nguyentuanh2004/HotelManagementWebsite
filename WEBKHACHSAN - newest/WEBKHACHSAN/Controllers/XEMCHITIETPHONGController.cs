using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class XEMCHITIETPHONGController : Controller
    {
        // GET: XEMCHITIETPHONG
        KSEntities3 DA = new KSEntities3();
        public ActionResult XEMCHITIETPHONG(String IDPHONG)
        {
            if(IDPHONG != null) 
            {
                int idphong = 0;

                if (IDPHONG != null && int.TryParse(IDPHONG, out idphong))
                {
                    ViewBag.TENHINHANHPHONG = DA.HINHANHPHONGs.FirstOrDefault(X => X.IDPHONG == idphong && X.VITRI == 1).TENHINHANHPHONG;
                    var PHONG = DA.PHONGs.FirstOrDefault(x => x.IDPHONG == idphong);
                    ViewBag.MOTAPHONG = PHONG.MOTAPHONG;  //DA.PHONGs.FirstOrDefault(X => X.IDPHONG == idphong).MOTAPHONG;
                    ViewBag.TENPHONG = PHONG.TENPHONG;
                    ViewBag.IDPHONG = idphong;
                    return View(DA.HINHANHPHONGs.Where(x => x.IDPHONG == idphong));
                }
                else
                {
                    var PHONG = DA.PHONGs.FirstOrDefault(X => X.IDPHONG == idphong);
                    return RedirectToAction("Index", "PHONG", new { IDLOAIPHONG = PHONG.IDLOAIPHONG });
                }
            }else
            {
                return RedirectToAction("LOAIPHONG", "LOAIPHONG");
            }
        }
    }
}