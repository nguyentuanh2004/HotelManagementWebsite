using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class QUANLYLOAIPHONGController : Controller
    {
        // GET: QUANLYLOAIPHONG
        KSEntities3 DA = new KSEntities3();
        public ActionResult QUANLYLOAIPHONG()
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                return View(DA.LOAIPHONGs.ToList());
            }
            else
            {
                return RedirectToAction("Index", "TRANGCHU");
            }
        }
        public ActionResult THEMLOAIPHONG()
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
        public ActionResult THEMLOAIPHONG(LOAIPHONG model, HttpPostedFileBase fileanh)
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
                List<THEMLOAIPHONG2_Result> themLOAIPHONG_ = DA.THEMLOAIPHONG2(model.TENLOAIPHONG, model.MOTALOAIPHONG, TENANH).ToList();
                if (themLOAIPHONG_.Count > 0)
                {
                    TempData["QUANLYLOAIPHONG"] = "Thông báo: Thêm loại phòng " + model.TENLOAIPHONG + " thành công.";
                    return RedirectToAction("QUANLYLOAIPHONG");
                }

            }
            catch (Exception)
            {
                ViewBag.THONGBAOTHEMLOAIPHONG = "Thông báo: Thêm loại phòng " + model.TENLOAIPHONG + " thất bại.";
                return View(model);
            }

            return View();
        }
        public ActionResult Delete(int IDLOAIPHONG)
        {
            try
            {
                List<XOALOAIPHONG_Result> xoaLOAIPHONG_ = DA.XOALOAIPHONG(IDLOAIPHONG).ToList();

                if (xoaLOAIPHONG_.Count > 0)
                {
                    TempData["QUANLYLOAIPHONG"] = "Thông báo: Xóa phòng thành công.";
                    return RedirectToAction("QUANLYLOAIPHONG");
                }
            }
            catch (Exception)
            {
                TempData["QUANLYLOAIPHONG"] = "Thông báo: Xóa phòng thất bại.";
                return RedirectToAction("QUANLYLOAIPHONG");
            }
            return RedirectToAction("QUANLYLOAIPHONG");
        }
        public ActionResult Edit(string IDLOAIPHONG)
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                if (IDLOAIPHONG != null && int.TryParse(IDLOAIPHONG, out int idphong))
                {
                    var LOAIPHONG = DA.LOAIPHONGs.FirstOrDefault(x => x.IDLOAIPHONG == idphong);
                    return View(LOAIPHONG);
                }
                return View();
            }
            return RedirectToAction("Index", "TRANGCHU");
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(LOAIPHONG model, HttpPostedFileBase fileanh, string HinhanhCu)
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
                if (HinhanhCu != null)
                {
                    TENANH = HinhanhCu; // Đảm bảo file mặc định đúng đường dẫn
                }
            }

            try
            {
                List<CAPNHATLOAIPHONG_Result> capnhatLOAIPHONG_ = DA.CAPNHATLOAIPHONG(model.IDLOAIPHONG, model.TENLOAIPHONG, model.MOTALOAIPHONG, TENANH).ToList();
                if (capnhatLOAIPHONG_ != null && capnhatLOAIPHONG_.Count > 0)
                {
                    TempData["QUANLYLOAIPHONG"] = "Thông báo: Sửa phòng " + model.TENLOAIPHONG + " thành công.";
                    return RedirectToAction("QUANLYLOAIPHONG");
                }
            }
            catch (Exception)
            {
                ViewBag.THONGBAOSUALOAIPHONG = "Thông báo: Sửa phòng " + model.TENLOAIPHONG + " thất bại.";
                return View(model);
            }
            return RedirectToAction("QUANLYLOAIPHONG");
        }
    }
}