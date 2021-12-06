using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Nhom14_ChuDu.Models;
namespace Nhom14_ChuDu.Controllers
{
    public class HomeController : Controller
    {
        private ChuDu24 db = new ChuDu24();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Content()
        {
            return View();
        }
        public ActionResult KhachSan()
        {
            var khachSans = db.KhachSans.Select(p => p);
            return View(khachSans.ToList());
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(string Ten, string MatKhau, RouteCollection routes)
        {
            if (ModelState.IsValid)
            {
                var user = db.TaiKhoans.Where(u => u.Ten.Equals(Ten) && u.MatKhau.Equals(MatKhau)).ToList();
                if (user.Count() > 0)
                {
                    Session["IDTK"] = user.FirstOrDefault().IDTK;
                    Session["MatKhau"] = user.FirstOrDefault().MatKhau;
                    Session["Ten"] = user.FirstOrDefault().Ten;
                    Session["DiaChi"] = user.FirstOrDefault().DiaChi;
                    Session["sodienthoai"] = user.FirstOrDefault().SDT;
                    Session["VaiTro"] = user.FirstOrDefault().VaiTro;
                    if (Session["VaiTro"].Equals(true))
                    {
                        return RedirectToAction("Index_admin");
                    }
                    else
                        return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Sai tên đăng nhập hoặc mật khẩu";
                }
            }
            return View();
        }
        public ActionResult Index_admin()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

        public ActionResult register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult register([Bind(Include = "IDTK, MatKhau, Ten, DiaChi, SDT, VaiTro")] TaiKhoan taiKhoan)
        {
            string ten = Request["Ten"].ToString();
            string mk = Request["MatKhau"].ToString();
            string dc = Request["DiaChi"].ToString();
            string sdt = Request["SDT"].ToString();
            if (ten == "" || mk == "" || dc == "" || sdt == "")
            {
                ViewBag.error = "Bạn phải nhập dữ liệu";
                return View();
            }
            taiKhoan.IDTK = db.TaiKhoans.ToList().Last().IDTK + 1;
            taiKhoan.VaiTro = false;
            List<TaiKhoan> taiKhoans = new List<TaiKhoan>();
            taiKhoans = db.TaiKhoans.Where(s => s.SDT.ToString().Equals(sdt)).Select(s => s).ToList();
            if (taiKhoans.Count == 0)
            {
                db.TaiKhoans.Add(taiKhoan);
                db.SaveChanges();
                return RedirectToAction("DangNhap");
            }
            else
            {
                ViewBag.errorPass = "Số điện thoại đã tồn tại";
                return View();
            }
        }
    }
}