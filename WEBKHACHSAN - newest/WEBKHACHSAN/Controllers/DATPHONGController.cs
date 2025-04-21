using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class DATPHONGController : Controller
    {
        // GET: DATPHONG
        KSEntities3 DA = new KSEntities3();
        public ActionResult Index(string IDPHONG)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("Index", "DANGNHAP");
            }else
            {
                string TENDANGNHAP = Session["username"].ToString().ToLower();
                var THONGTINKHACHHANG = DA.THONGTINKHACHHANGs.FirstOrDefault(X => X.TENDANGNHAP.ToLower() == TENDANGNHAP);
                if (THONGTINKHACHHANG != null && THONGTINKHACHHANG.TEN != null && THONGTINKHACHHANG.EMAIL != null)
                {
                    ViewBag.TEN = THONGTINKHACHHANG.TEN;
                    ViewBag.EMAIL = THONGTINKHACHHANG.EMAIL;
                }
                else
                {
                    ViewBag.TEN = null;
                    ViewBag.EMAIL = null;
                }

                if (IDPHONG != null && int.TryParse(IDPHONG, out int idphong))
                {
                    var PHONG = DA.PHONGs.FirstOrDefault(X => X.IDPHONG == idphong);
                    ViewBag.IDPHONG = IDPHONG;
                    return View(PHONG);
                }
                else
                {
                    var phongNhoNhat = DA.PHONGs
                    .Where(p => p.IDLOAIPHONG == DA.PHONGs.Min(x => x.IDLOAIPHONG)) // Tìm loại phòng nhỏ nhất
                    .OrderBy(p => p.IDPHONG) // Sắp xếp phòng theo ID tăng dần
                    .FirstOrDefault();
                    ViewBag.IDPHONG = phongNhoNhat.IDPHONG;
                    return View(phongNhoNhat);
                }
            } 
        }
        public ActionResult DATPHONG(string name, string email, DateTime? checkin, DateTime? checkout, int Adult, int Child, string message, int IDPHONG, int? SOPHONG)
        {
            try
            {
                var PHONG = DA.PHONGs.FirstOrDefault(X => X.IDPHONG == IDPHONG);
                int IDLOAIPHONG = PHONG?.IDLOAIPHONG ?? 0;
                List<BOOKPHONG_Result> bOOKPHONG_ = DA.BOOKPHONG(name, email, checkin, checkout, Session["username"].ToString(), IDLOAIPHONG, Adult, Child, message, SOPHONG).ToList();
                if (bOOKPHONG_.Count > 0)
                {
                    //TempData["THONGBAOBOOKPHONG"] = "Thông báo: Đặt phòng thành công.";
                    return RedirectToAction("PHONGDAT", "PHONGDAT");
                }
            }
            catch (Exception)
            {
                TempData["THONGBAOBOOKPHONG"] = "Thông báo: Đặt phòng bại, thời gian này đã hết slot.";
                return RedirectToAction("Index", "DATPHONG");
            }
            TempData["THONGBAOBOOKPHONG"] = "ERRON";
            return RedirectToAction("PHONGDAT", "PHONGDAT");
        }
    }
}