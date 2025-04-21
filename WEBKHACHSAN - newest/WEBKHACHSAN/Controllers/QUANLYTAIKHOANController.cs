using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class QUANLYTAIKHOANController : Controller
    {
        // GET: QUANLYTAIKHOAN
        KSEntities3 DA = new KSEntities3();
        public ActionResult QUANLYTAIKHOAN()
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                return View(DA.TAIKHOANs.ToList());
            }else
            {
                return RedirectToAction("Index", "TRANGCHU");
            }
        }
        public ActionResult THEMTAIKHOAN()
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
        public ActionResult THEMTAIKHOAN(TAIKHOAN model)
        {
            if (Session["Manager"] != null && Session["username"].ToString().ToLower() == "admin")
            {
                if (model != null && model.TRANGTHAI != null && model.IDLOAITAIKHOAN != null)
                {
                    try
                    {
                        List<THEMTAIKHOAN_Result> themTAIKHOAN_ = DA.THEMTAIKHOAN(model.TENDANGNHAP, model.MATKHAU, model.TRANGTHAI, model.IDLOAITAIKHOAN).ToList();
                        TempData["QUANLYTAIKHOAN"] = "Thông báo: Thêm tài khoản " + model.TENDANGNHAP + " thành công.";
                        return RedirectToAction("QUANLYTAIKHOAN");
                    }
                    catch (Exception)
                    {
                        ViewBag.THONGBAOTHEMTAIKHOAN = "Thông báo: Tài khoản " + model.TENDANGNHAP + " đã tồn tại.";
                        return View();
                    }
                }
            }
            return RedirectToAction("Index", "TRANGCHU");
        }
        public ActionResult Delete(string TENDANGNHAP)
        {
            var TAIKHOAN = DA.TAIKHOANs.FirstOrDefault(x => x.TENDANGNHAP.Equals(TENDANGNHAP));
            DA.TAIKHOANs.Remove(TAIKHOAN);
            DA.SaveChanges();
            TempData["QUANLYTAIKHOAN"] = "Thông báo: Xóa tài khoản " + TENDANGNHAP + " thành công.";
            return RedirectToAction("QUANLYTAIKHOAN");
        }
        public ActionResult Edit(string TENDANGNHAP)
        {
            var TAIKHOAN = DA.TAIKHOANs.FirstOrDefault(x => x.TENDANGNHAP.Equals(TENDANGNHAP));
            return View(TAIKHOAN);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(TAIKHOAN model)
        {
            if (model != null)
            {
                var TAIKHOAN = DA.TAIKHOANs.FirstOrDefault(x => x.TENDANGNHAP.Equals(model.TENDANGNHAP));

                if(model.MATKHAU != null && !string.IsNullOrEmpty(model.MATKHAU))
                {
                    TAIKHOAN.MATKHAU = model.MATKHAU;
                }
                TAIKHOAN.TRANGTHAI = model.TRANGTHAI;
                TAIKHOAN.IDLOAITAIKHOAN = model.IDLOAITAIKHOAN;

                DA.SaveChanges();
                TempData["QUANLYTAIKHOAN"] = "Thông báo: Sửa tài khoản " + model.TENDANGNHAP + " thành công.";
                return RedirectToAction("QUANLYTAIKHOAN");
            }
            return View();
        }
    }
}