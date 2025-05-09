//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WEBKHACHSAN.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;

    public partial class KSEntities3 : DbContext
    {
        public KSEntities3()
            : base("name=KSEntities3")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<DATPHONG> DATPHONGs { get; set; }
        public virtual DbSet<HINHANHPHONG> HINHANHPHONGs { get; set; }
        public virtual DbSet<LOAIPHONG> LOAIPHONGs { get; set; }
        public virtual DbSet<LOAITAIKHOAN> LOAITAIKHOANs { get; set; }
        public virtual DbSet<PHONG> PHONGs { get; set; }
        public virtual DbSet<TAIKHOAN> TAIKHOANs { get; set; }
        public virtual DbSet<THIETBIPHONG> THIETBIPHONGs { get; set; }
        public virtual DbSet<THONGTINKHACHHANG> THONGTINKHACHHANGs { get; set; }
        public virtual DbSet<TRANGTHAIDATPHONG> TRANGTHAIDATPHONGs { get; set; }

        public virtual ObjectResult<BOOKPHONG_Result> BOOKPHONG(string tEN, string eMAIL, Nullable<System.DateTime> cHECKIN, Nullable<System.DateTime> cHECKOUT, string tENDANGNHAP, Nullable<int> iDLOAIPHONG, Nullable<int> nGUOILON, Nullable<int> tREEM, string gHICHU, Nullable<int> sOPHONG)
        {
            var tENParameter = tEN != null ?
                new ObjectParameter("TEN", tEN) :
                new ObjectParameter("TEN", typeof(string));

            var eMAILParameter = eMAIL != null ?
                new ObjectParameter("EMAIL", eMAIL) :
                new ObjectParameter("EMAIL", typeof(string));

            var cHECKINParameter = cHECKIN.HasValue ?
                new ObjectParameter("CHECKIN", cHECKIN) :
                new ObjectParameter("CHECKIN", typeof(System.DateTime));

            var cHECKOUTParameter = cHECKOUT.HasValue ?
                new ObjectParameter("CHECKOUT", cHECKOUT) :
                new ObjectParameter("CHECKOUT", typeof(System.DateTime));

            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            var nGUOILONParameter = nGUOILON.HasValue ?
                new ObjectParameter("NGUOILON", nGUOILON) :
                new ObjectParameter("NGUOILON", typeof(int));

            var tREEMParameter = tREEM.HasValue ?
                new ObjectParameter("TREEM", tREEM) :
                new ObjectParameter("TREEM", typeof(int));

            var gHICHUParameter = gHICHU != null ?
                new ObjectParameter("GHICHU", gHICHU) :
                new ObjectParameter("GHICHU", typeof(string));

            var sOPHONGParameter = sOPHONG.HasValue ?
                new ObjectParameter("SOPHONG", sOPHONG) :
                new ObjectParameter("SOPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<BOOKPHONG_Result>("BOOKPHONG", tENParameter, eMAILParameter, cHECKINParameter, cHECKOUTParameter, tENDANGNHAPParameter, iDLOAIPHONGParameter, nGUOILONParameter, tREEMParameter, gHICHUParameter, sOPHONGParameter);
        }

        public virtual ObjectResult<CAPNHATLOAIPHONG_Result> CAPNHATLOAIPHONG(Nullable<int> iDLOAIPHONG, string tENLOAIPHONG, string mOTALOAIPHONG, string tENHINHANHLOAIPHONG)
        {
            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            var tENLOAIPHONGParameter = tENLOAIPHONG != null ?
                new ObjectParameter("TENLOAIPHONG", tENLOAIPHONG) :
                new ObjectParameter("TENLOAIPHONG", typeof(string));

            var mOTALOAIPHONGParameter = mOTALOAIPHONG != null ?
                new ObjectParameter("MOTALOAIPHONG", mOTALOAIPHONG) :
                new ObjectParameter("MOTALOAIPHONG", typeof(string));

            var tENHINHANHLOAIPHONGParameter = tENHINHANHLOAIPHONG != null ?
                new ObjectParameter("TENHINHANHLOAIPHONG", tENHINHANHLOAIPHONG) :
                new ObjectParameter("TENHINHANHLOAIPHONG", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<CAPNHATLOAIPHONG_Result>("CAPNHATLOAIPHONG", iDLOAIPHONGParameter, tENLOAIPHONGParameter, mOTALOAIPHONGParameter, tENHINHANHLOAIPHONGParameter);
        }

        public virtual ObjectResult<CAPNHATPHONG_Result> CAPNHATPHONG(Nullable<int> iDPHONG, string tENHINHANHPHONG, Nullable<int> sOPHONG, string tENPHONG, string mOTAPHONG, Nullable<decimal> gIAPHONG, Nullable<int> sOLUONGGIUONGPHONG, Nullable<int> sOLUONGPHONGTAM, Nullable<int> iDLOAIPHONG)
        {
            var iDPHONGParameter = iDPHONG.HasValue ?
                new ObjectParameter("IDPHONG", iDPHONG) :
                new ObjectParameter("IDPHONG", typeof(int));

            var tENHINHANHPHONGParameter = tENHINHANHPHONG != null ?
                new ObjectParameter("TENHINHANHPHONG", tENHINHANHPHONG) :
                new ObjectParameter("TENHINHANHPHONG", typeof(string));

            var sOPHONGParameter = sOPHONG.HasValue ?
                new ObjectParameter("SOPHONG", sOPHONG) :
                new ObjectParameter("SOPHONG", typeof(int));

            var tENPHONGParameter = tENPHONG != null ?
                new ObjectParameter("TENPHONG", tENPHONG) :
                new ObjectParameter("TENPHONG", typeof(string));

            var mOTAPHONGParameter = mOTAPHONG != null ?
                new ObjectParameter("MOTAPHONG", mOTAPHONG) :
                new ObjectParameter("MOTAPHONG", typeof(string));

            var gIAPHONGParameter = gIAPHONG.HasValue ?
                new ObjectParameter("GIAPHONG", gIAPHONG) :
                new ObjectParameter("GIAPHONG", typeof(decimal));

            var sOLUONGGIUONGPHONGParameter = sOLUONGGIUONGPHONG.HasValue ?
                new ObjectParameter("SOLUONGGIUONGPHONG", sOLUONGGIUONGPHONG) :
                new ObjectParameter("SOLUONGGIUONGPHONG", typeof(int));

            var sOLUONGPHONGTAMParameter = sOLUONGPHONGTAM.HasValue ?
                new ObjectParameter("SOLUONGPHONGTAM", sOLUONGPHONGTAM) :
                new ObjectParameter("SOLUONGPHONGTAM", typeof(int));

            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<CAPNHATPHONG_Result>("CAPNHATPHONG", iDPHONGParameter, tENHINHANHPHONGParameter, sOPHONGParameter, tENPHONGParameter, mOTAPHONGParameter, gIAPHONGParameter, sOLUONGGIUONGPHONGParameter, sOLUONGPHONGTAMParameter, iDLOAIPHONGParameter);
        }

        public virtual ObjectResult<CAPNHATPHONGDAT_Result> CAPNHATPHONGDAT(Nullable<int> iDDATPHONG, Nullable<System.DateTime> cHECKIN, Nullable<System.DateTime> cHECKOUT, Nullable<int> nGUOILON, Nullable<int> tREME, string gHICHU, Nullable<int> iDTRANGTHAIDATPHONG)
        {
            var iDDATPHONGParameter = iDDATPHONG.HasValue ?
                new ObjectParameter("IDDATPHONG", iDDATPHONG) :
                new ObjectParameter("IDDATPHONG", typeof(int));

            var cHECKINParameter = cHECKIN.HasValue ?
                new ObjectParameter("CHECKIN", cHECKIN) :
                new ObjectParameter("CHECKIN", typeof(System.DateTime));

            var cHECKOUTParameter = cHECKOUT.HasValue ?
                new ObjectParameter("CHECKOUT", cHECKOUT) :
                new ObjectParameter("CHECKOUT", typeof(System.DateTime));

            var nGUOILONParameter = nGUOILON.HasValue ?
                new ObjectParameter("NGUOILON", nGUOILON) :
                new ObjectParameter("NGUOILON", typeof(int));

            var tREMEParameter = tREME.HasValue ?
                new ObjectParameter("TREME", tREME) :
                new ObjectParameter("TREME", typeof(int));

            var gHICHUParameter = gHICHU != null ?
                new ObjectParameter("GHICHU", gHICHU) :
                new ObjectParameter("GHICHU", typeof(string));

            var iDTRANGTHAIDATPHONGParameter = iDTRANGTHAIDATPHONG.HasValue ?
                new ObjectParameter("IDTRANGTHAIDATPHONG", iDTRANGTHAIDATPHONG) :
                new ObjectParameter("IDTRANGTHAIDATPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<CAPNHATPHONGDAT_Result>("CAPNHATPHONGDAT", iDDATPHONGParameter, cHECKINParameter, cHECKOUTParameter, nGUOILONParameter, tREMEParameter, gHICHUParameter, iDTRANGTHAIDATPHONGParameter);
        }

        public virtual ObjectResult<CAPNHATPHONGDATTRANGTHAI3_Result> CAPNHATPHONGDATTRANGTHAI3(Nullable<int> iDDATPHONG, Nullable<int> iDTRANGTHAIDATPHONG)
        {
            var iDDATPHONGParameter = iDDATPHONG.HasValue ?
                new ObjectParameter("IDDATPHONG", iDDATPHONG) :
                new ObjectParameter("IDDATPHONG", typeof(int));

            var iDTRANGTHAIDATPHONGParameter = iDTRANGTHAIDATPHONG.HasValue ?
                new ObjectParameter("IDTRANGTHAIDATPHONG", iDTRANGTHAIDATPHONG) :
                new ObjectParameter("IDTRANGTHAIDATPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<CAPNHATPHONGDATTRANGTHAI3_Result>("CAPNHATPHONGDATTRANGTHAI3", iDDATPHONGParameter, iDTRANGTHAIDATPHONGParameter);
        }

        public virtual ObjectResult<DANGKY_Result> DANGKY(string tENDANGNHAP, string mATKHAU)
        {
            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            var mATKHAUParameter = mATKHAU != null ?
                new ObjectParameter("MATKHAU", mATKHAU) :
                new ObjectParameter("MATKHAU", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DANGKY_Result>("DANGKY", tENDANGNHAPParameter, mATKHAUParameter);
        }

        public virtual ObjectResult<DANGNHAP_Result> DANGNHAP(string tENDANGNHAP, string mATKHAU)
        {
            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            var mATKHAUParameter = mATKHAU != null ?
                new ObjectParameter("MATKHAU", mATKHAU) :
                new ObjectParameter("MATKHAU", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<DANGNHAP_Result>("DANGNHAP", tENDANGNHAPParameter, mATKHAUParameter);
        }

        public virtual ObjectResult<PHONGDAT2_Result> PHONGDAT2(string tENDANGNHAP)
        {
            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<PHONGDAT2_Result>("PHONGDAT2", tENDANGNHAPParameter);
        }

        public virtual ObjectResult<THEMLOAIPHONG2_Result> THEMLOAIPHONG2(string tENLOAIPHONG, string mOTALOAIPHONG, string tENHINHANHLOAIPHONG)
        {
            var tENLOAIPHONGParameter = tENLOAIPHONG != null ?
                new ObjectParameter("TENLOAIPHONG", tENLOAIPHONG) :
                new ObjectParameter("TENLOAIPHONG", typeof(string));

            var mOTALOAIPHONGParameter = mOTALOAIPHONG != null ?
                new ObjectParameter("MOTALOAIPHONG", mOTALOAIPHONG) :
                new ObjectParameter("MOTALOAIPHONG", typeof(string));

            var tENHINHANHLOAIPHONGParameter = tENHINHANHLOAIPHONG != null ?
                new ObjectParameter("TENHINHANHLOAIPHONG", tENHINHANHLOAIPHONG) :
                new ObjectParameter("TENHINHANHLOAIPHONG", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<THEMLOAIPHONG2_Result>("THEMLOAIPHONG2", tENLOAIPHONGParameter, mOTALOAIPHONGParameter, tENHINHANHLOAIPHONGParameter);
        }

        public virtual ObjectResult<THEMPHONG_Result> THEMPHONG(Nullable<int> sOPHONG, string tENPHONG, string mOTAPHONG, Nullable<decimal> gIAPHONG, Nullable<int> sOLUONGGIOUNGPHONG, Nullable<int> sOLUONGPHONGTAM, string tENDDANGNHAP, Nullable<int> iDLOAIPHONG, string tENHINHANHPHONG)
        {
            var sOPHONGParameter = sOPHONG.HasValue ?
                new ObjectParameter("SOPHONG", sOPHONG) :
                new ObjectParameter("SOPHONG", typeof(int));

            var tENPHONGParameter = tENPHONG != null ?
                new ObjectParameter("TENPHONG", tENPHONG) :
                new ObjectParameter("TENPHONG", typeof(string));

            var mOTAPHONGParameter = mOTAPHONG != null ?
                new ObjectParameter("MOTAPHONG", mOTAPHONG) :
                new ObjectParameter("MOTAPHONG", typeof(string));

            var gIAPHONGParameter = gIAPHONG.HasValue ?
                new ObjectParameter("GIAPHONG", gIAPHONG) :
                new ObjectParameter("GIAPHONG", typeof(decimal));

            var sOLUONGGIOUNGPHONGParameter = sOLUONGGIOUNGPHONG.HasValue ?
                new ObjectParameter("SOLUONGGIOUNGPHONG", sOLUONGGIOUNGPHONG) :
                new ObjectParameter("SOLUONGGIOUNGPHONG", typeof(int));

            var sOLUONGPHONGTAMParameter = sOLUONGPHONGTAM.HasValue ?
                new ObjectParameter("SOLUONGPHONGTAM", sOLUONGPHONGTAM) :
                new ObjectParameter("SOLUONGPHONGTAM", typeof(int));

            var tENDDANGNHAPParameter = tENDDANGNHAP != null ?
                new ObjectParameter("TENDDANGNHAP", tENDDANGNHAP) :
                new ObjectParameter("TENDDANGNHAP", typeof(string));

            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            var tENHINHANHPHONGParameter = tENHINHANHPHONG != null ?
                new ObjectParameter("TENHINHANHPHONG", tENHINHANHPHONG) :
                new ObjectParameter("TENHINHANHPHONG", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<THEMPHONG_Result>("THEMPHONG", sOPHONGParameter, tENPHONGParameter, mOTAPHONGParameter, gIAPHONGParameter, sOLUONGGIOUNGPHONGParameter, sOLUONGPHONGTAMParameter, tENDDANGNHAPParameter, iDLOAIPHONGParameter, tENHINHANHPHONGParameter);
        }

        public virtual ObjectResult<THEMPHONGNHANBAN2_Result> THEMPHONGNHANBAN2(Nullable<int> iDLOAIPHONG, Nullable<int> sOPHONG)
        {
            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            var sOPHONGParameter = sOPHONG.HasValue ?
                new ObjectParameter("SOPHONG", sOPHONG) :
                new ObjectParameter("SOPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<THEMPHONGNHANBAN2_Result>("THEMPHONGNHANBAN2", iDLOAIPHONGParameter, sOPHONGParameter);
        }

        public virtual ObjectResult<THEMTAIKHOAN_Result> THEMTAIKHOAN(string tENDANGNHAP, string mATKHAU, Nullable<int> tRANGTHAI, Nullable<int> iDLOAITAIKHOAN)
        {
            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            var mATKHAUParameter = mATKHAU != null ?
                new ObjectParameter("MATKHAU", mATKHAU) :
                new ObjectParameter("MATKHAU", typeof(string));

            var tRANGTHAIParameter = tRANGTHAI.HasValue ?
                new ObjectParameter("TRANGTHAI", tRANGTHAI) :
                new ObjectParameter("TRANGTHAI", typeof(int));

            var iDLOAITAIKHOANParameter = iDLOAITAIKHOAN.HasValue ?
                new ObjectParameter("IDLOAITAIKHOAN", iDLOAITAIKHOAN) :
                new ObjectParameter("IDLOAITAIKHOAN", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<THEMTAIKHOAN_Result>("THEMTAIKHOAN", tENDANGNHAPParameter, mATKHAUParameter, tRANGTHAIParameter, iDLOAITAIKHOANParameter);
        }

        public virtual ObjectResult<XOALOAIPHONG_Result> XOALOAIPHONG(Nullable<int> iDLOAIPHONG)
        {
            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<XOALOAIPHONG_Result>("XOALOAIPHONG", iDLOAIPHONGParameter);
        }

        public virtual ObjectResult<XOAPHONG_Result> XOAPHONG(Nullable<int> iDPHONG)
        {
            var iDPHONGParameter = iDPHONG.HasValue ?
                new ObjectParameter("IDPHONG", iDPHONG) :
                new ObjectParameter("IDPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<XOAPHONG_Result>("XOAPHONG", iDPHONGParameter);
        }

        public virtual ObjectResult<XOAPHONGDAT_Result> XOAPHONGDAT(Nullable<int> iDDATPHONG, string tENDANGNHAP)
        {
            var iDDATPHONGParameter = iDDATPHONG.HasValue ?
                new ObjectParameter("IDDATPHONG", iDDATPHONG) :
                new ObjectParameter("IDDATPHONG", typeof(int));

            var tENDANGNHAPParameter = tENDANGNHAP != null ?
                new ObjectParameter("TENDANGNHAP", tENDANGNHAP) :
                new ObjectParameter("TENDANGNHAP", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<XOAPHONGDAT_Result>("XOAPHONGDAT", iDDATPHONGParameter, tENDANGNHAPParameter);
        }

        public virtual ObjectResult<XOAPHONGNHANBAN_Result> XOAPHONGNHANBAN(Nullable<int> iDLOAIPHONG, Nullable<int> sOPHONG)
        {
            var iDLOAIPHONGParameter = iDLOAIPHONG.HasValue ?
                new ObjectParameter("IDLOAIPHONG", iDLOAIPHONG) :
                new ObjectParameter("IDLOAIPHONG", typeof(int));

            var sOPHONGParameter = sOPHONG.HasValue ?
                new ObjectParameter("SOPHONG", sOPHONG) :
                new ObjectParameter("SOPHONG", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<XOAPHONGNHANBAN_Result>("XOAPHONGNHANBAN", iDLOAIPHONGParameter, sOPHONGParameter);
        }
    }
}
