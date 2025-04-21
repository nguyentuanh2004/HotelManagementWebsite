using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBKHACHSAN.Models;

namespace WEBKHACHSAN.Controllers
{
    public class PHONGDATController : Controller
    {
        // GET: PHONGDAT
        KSEntities3 DA = new KSEntities3();
        public ActionResult PHONGDAT()
        {

            if (Session["username"] == null)
            {
                return RedirectToAction("Index", "DANGNHAP");
            }
            else
            {
                List<PHONGDAT2_Result> PHONGDAT2_Result = DA.PHONGDAT2(Session["username"].ToString()).ToList();
                return View(PHONGDAT2_Result.ToList());
            }
        }
        public ActionResult Delete(int IDDATPHONG)
        {

            if (Session["username"] == null)
            {
                return RedirectToAction("PHONGDAT", "PHONGDAT");
            }
            else
            {
                try
                {
                    List<XOAPHONGDAT_Result> XOAPHONGDAT_Result = DA.XOAPHONGDAT(IDDATPHONG, Session["username"].ToString()).ToList();
                    if (XOAPHONGDAT_Result.Count > 0)
                    {
                        TempData["THONGBAOXOAPHONGDAT"] = "XOA THANH CONG";
                        return RedirectToAction("PHONGDAT", "PHONGDAT");
                    }
                }
                catch (Exception)
                {
                    TempData["THONGBAOXOAPHONGDAT"] = "XOA THAT BAI";
                    return RedirectToAction("PHONGDAT", "PHONGDAT");
                }
            }
            return RedirectToAction("PHONGDAT", "PHONGDAT");
        }
        public ActionResult Edit(int IDDATPHONG)
        {
            if (Session["username"] != null)
            {
                var DATPHONG = DA.DATPHONGs.FirstOrDefault(X => X.IDDATPHONG == IDDATPHONG);
                return View(DATPHONG);
            }else
            {
                return RedirectToAction("PHONGDAT", "PHONGDAT");
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(DATPHONG model, int? Adult, int? Child)
        {
            if(model != null)
            {
                try
                {
                    if(Session["username"] != null && Session["username"].ToString().ToLower() == "nhanviena")
                    {
                        List<CAPNHATPHONGDATTRANGTHAI3_Result> CAPNHATPHONGDATTRANGTHAI3_Results = DA.CAPNHATPHONGDATTRANGTHAI3(model.IDDATPHONG, model.IDTRANGTHAIDATPHONG).ToList();
                        if (CAPNHATPHONGDATTRANGTHAI3_Results.Count > 0)
                        {
                            TempData["THONGBAOCAPNHATPHONGDAT"] = "CAP NHAT THANH CONG";
                            return RedirectToAction("PHONGDAT", "PHONGDAT");
                        }
                    }
                    else
                    {
                        List<CAPNHATPHONGDAT_Result> CAPNHATPHONGDAT_Result = DA.CAPNHATPHONGDAT(model.IDDATPHONG, model.CHECKIN, model.CHECKOUT, Adult, Child, model.GHICHU, model.IDTRANGTHAIDATPHONG).ToList();
                        if (CAPNHATPHONGDAT_Result.Count > 0)
                        {
                            TempData["THONGBAOCAPNHATPHONGDAT"] = "CAP NHAT THANH CONG";
                            return RedirectToAction("PHONGDAT", "PHONGDAT");
                        }
                    }
                }
                catch (Exception)
                {
                    TempData["THONGBAOCAPNHATPHONGDAT"] = "CAP NHAT THAT BAI";
                    return RedirectToAction("PHONGDAT", "PHONGDAT");
                }
            }
            return RedirectToAction("PHONGDAT", "PHONGDAT");
        }
    }
}