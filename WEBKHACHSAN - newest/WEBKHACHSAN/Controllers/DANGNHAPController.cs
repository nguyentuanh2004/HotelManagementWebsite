using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class DANGNHAPController : Controller
    {
        // GET: DANGNHAP
        KSEntities3 DA = new KSEntities3();
        public ActionResult Index(string UsernameLogin, string PasswordLogin, string UsernameRegister, string PasswordRegister, string check)
        {
            if (Session["username"] == null)
            {
                if (UsernameLogin == null && PasswordLogin == null && UsernameRegister == null && PasswordRegister == null)
                {
                    return View();
                }
                else
                {
                    if (check != null && UsernameRegister == null && PasswordRegister == null)
                    {
                        try
                        {
                            List<DANGNHAP_Result> dangNHAP_ = DA.DANGNHAP(UsernameLogin, PasswordLogin).ToList();
                            if (dangNHAP_.Count > 0 && dangNHAP_ != null)
                            {
                                Session["username"] = UsernameLogin.ToUpper();
                                return RedirectToAction("Index", "TRANGCHU");
                            }
                        }
                        catch (Exception)
                        {
                            ViewBag.THONGBAOLOGIN = "Thông báo: Sai tên đăng nhập hoặc mật khẩu";
                            return View();
                        }
                        return View();
                    }
                    else
                    {
                        if (UsernameLogin == null && PasswordLogin == null)
                        {
                            try
                            {
                                List<DANGKY_Result> dangKY_ = DA.DANGKY(UsernameRegister, PasswordRegister).ToList();
                                if (dangKY_.Count > 0 && dangKY_ != null)
                                {
                                    ViewBag.THONGBAOLOGIN = "Thông báo: Đăng ký thành công vui lòng đăng nhập lại.";
                                    return View();
                                }
                            }
                            catch (Exception)
                            {
                                ViewBag.THONGBAOREGISTER = "Thông báo: Tài khoản đã tồn tại";
                                ViewBag.ActiveTab = "register";
                                return View();
                            }
                            return View();
                        }
                        else
                        {
                            ViewBag.ActiveTab = "register";
                            return View();
                        }
                    }
                }
            }
            else
            {
                Session["username"] = null;
                Session["Manager"] = null;
                Session["STATUS"] = null;
                return RedirectToAction("Index", "TRANGCHU");
            }
        }
    }
}