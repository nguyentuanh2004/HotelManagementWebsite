using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class QUANLYPHONGController : Controller
    {
        // GET: QUANLYPHONG
        KSEntities3 DA = new KSEntities3();
        public ActionResult QUANLYPHONG()
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin" )
            {
                return View(DA.PHONGs.Where(X => X.HINHANHPHONGs.Any(H => H.VITRI == 1)).ToList());
            }
            else
            {
                return RedirectToAction("Index", "TRANGCHU");
            }
        }
        public ActionResult THEMPHONG()
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "TRANGCHU");
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult THEMPHONG(PHONG model, HttpPostedFileBase fileanh)
        {
            string TENANH = null;
            if (fileanh != null && fileanh.ContentLength > 0)
            {
                // Đường dẫn tuyệt đối của thư mục lưu ảnh
                string rootfolder = Server.MapPath("~/IMAGEPHONG/"); // Đảm bảo ~/ thay vì /

                // Đảm bảo thư mục tồn tại trước khi lưu file
                if (!Directory.Exists(rootfolder))
                {
                    Directory.CreateDirectory(rootfolder);
                }

                // Đường dẫn đầy đủ của file
                string pathImage = Path.Combine(rootfolder, fileanh.FileName);

                // Lưu file vào thư mục
                fileanh.SaveAs(pathImage);

                // Lưu URL để hiển thị trên web
                TENANH = fileanh.FileName;
            }
            else
            {
                TENANH = "NULLPHONG.PNG"; // Đảm bảo file mặc định đúng đường dẫn
            }


            try
            {
                List<THEMPHONG_Result> themPHONG_ = DA.THEMPHONG(model.SOPHONG, model.TENPHONG, model.MOTAPHONG, model.GIAPHONG, model.SOLUONGGIUONGPHONG, model.SOLUONGPHONGTAM, Session["username"].ToString(), model.IDLOAIPHONG, TENANH).ToList();
                if(themPHONG_.Count > 0)
                {
                    TempData["QUANLYPHONG"] = "Thông báo: Thêm phòng " + model.SOPHONG + " thành công.";
                    return RedirectToAction("QUANLYPHONG");
                }

            }
            catch (Exception)
            {
                ViewBag.THONGBAOTHEMPHONG = "Thông báo: Thêm phòng " + model.SOPHONG + " thất bại.";
                return View(model);
            }

            return View();
        }
        public ActionResult Delete(int IDPHONG)
        {
            try
            {
                List<XOAPHONG_Result> xoaPHONG_ = DA.XOAPHONG(IDPHONG).ToList();
                
                if (xoaPHONG_.Count > 0)
                {
                    TempData["QUANLYPHONG"] = "Thông báo: Xóa phòng thành công.";
                    return RedirectToAction("QUANLYPHONG");
                }
            }
            catch (Exception)
            {
                TempData["QUANLYPHONG"] = "Thông báo: Xóa phòng thất bại.";
                return RedirectToAction("QUANLYPHONG");
            }
            return RedirectToAction("QUANLYPHONG");
        }
        public ActionResult Edit(string IDPHONG)
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                if (IDPHONG != null && int.TryParse(IDPHONG, out int idphong))
                {
                    var PHONG = DA.PHONGs.FirstOrDefault(x => x.IDPHONG == idphong);
                    return View(PHONG);
                }
            }
            return RedirectToAction("Index", "TRANGCHU");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(PHONG model, HttpPostedFileBase fileanh, string HinhanhCu)
        {
            string TENANH = null;
            if (fileanh != null && fileanh.ContentLength > 0)
            {
                // Đường dẫn tuyệt đối của thư mục lưu ảnh
                string rootfolder = Server.MapPath("~/IMAGEPHONG/"); // Đảm bảo ~/ thay vì /

                // Đảm bảo thư mục tồn tại trước khi lưu file
                if (!Directory.Exists(rootfolder))
                {
                    Directory.CreateDirectory(rootfolder);
                }

                // Đường dẫn đầy đủ của file
                string pathImage = Path.Combine(rootfolder, fileanh.FileName);

                // Lưu file vào thư mục
                fileanh.SaveAs(pathImage);

                // Lưu URL để hiển thị trên web
                TENANH = fileanh.FileName;
            }
            else
            {
                if(HinhanhCu != null)
                {
                    TENANH = HinhanhCu; // Đảm bảo file mặc định đúng đường dẫn
                }
            }

            try
            {
                List<CAPNHATPHONG_Result> capnhatPHONG_ = DA.CAPNHATPHONG(model.IDPHONG, TENANH, model.SOPHONG, model.TENPHONG, model.MOTAPHONG, model.GIAPHONG, model.SOLUONGGIUONGPHONG, model.SOLUONGPHONGTAM, model.IDLOAIPHONG).ToList();
                if (capnhatPHONG_ != null && capnhatPHONG_.Count > 0)
                {
                    TempData["QUANLYPHONG"] = "Thông báo: Sửa phòng " + model.SOPHONG + " thành công.";
                    return RedirectToAction("QUANLYPHONG");
                }
            }
            catch (Exception)
            {
                ViewBag.THONGBAOSUAPHONG = "Thông báo: Sửa phòng " + model.SOPHONG + " thất bại.";
                return View(model);
            }
            return RedirectToAction("QUANLYPHONG");
        }
        public ActionResult CONGPHONG(string IDLOAIPHONG, string SOPHONG)
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                if (IDLOAIPHONG != null && int.TryParse(IDLOAIPHONG, out int idloaiphong) && SOPHONG != null && int.TryParse(SOPHONG, out int sophong))
                {
                    try
                    {
                        List<THEMPHONGNHANBAN2_Result> tHEMPHONGNHANBAN2_ = DA.THEMPHONGNHANBAN2(idloaiphong, sophong).ToList();
                        if (tHEMPHONGNHANBAN2_.Count > 0)
                        {
                            TempData["QUANLYPHONG"] = "Thông báo: Thêm phòng nhân bản thành công.";
                            return RedirectToAction("QUANLYPHONG");
                        }
                    }
                    catch (Exception)
                    {
                        TempData["QUANLYPHONG"] = "Thông báo: Thêm phòng nhân bản thất bại.";
                        return RedirectToAction("QUANLYPHONG");
                    }
                }
            }
            return RedirectToAction("Index", "TRANGCHU");
        }
        public ActionResult TRUPHONG(string IDLOAIPHONG, string SOPHONG)
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                if (IDLOAIPHONG != null && int.TryParse(IDLOAIPHONG, out int idloaiphong) && SOPHONG != null && int.TryParse(SOPHONG, out int sophong))
                {
                    try
                    {
                        List<XOAPHONGNHANBAN_Result> xOAPHONGNHANBAN_ = DA.XOAPHONGNHANBAN(idloaiphong, sophong).ToList();
                        if (xOAPHONGNHANBAN_.Count > 0)
                        {
                            TempData["QUANLYPHONG"] = "Thông báo: Xóa phòng nhân bản thành công.";
                            return RedirectToAction("QUANLYPHONG");
                        }
                    }
                    catch (Exception)
                    {
                        TempData["QUANLYPHONG"] = "Thông báo: Xóa phòng nhân bản thất bại.";
                        return RedirectToAction("QUANLYPHONG");
                    }
                }
            }
            return RedirectToAction("Index", "TRANGCHU");
        }
    }
}