package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.KHACHHANG_OBJ;
import Model.KHACHANG_MOD;
import Model.EncryptMD5;

@WebServlet(urlPatterns = { "/KHACHHANG_CTR" })
public class KHACHHANG_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EncryptMD5 md5 = new EncryptMD5();
	String HanhDong = "";

	public KHACHHANG_CTR() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HanhDong = request.getParameter("hanhdong");
		// Khách hàng đăng ký tài khoản
		if (HanhDong.equals("Submit")) {
			// khachHangDangkyTaiKhoan = true;
			// Loi = kiemTraThongTinHopLe(request, response);
			/*
			 * if (Loi.equals("")) { themKhachHang(request, response);
			 * response.sendRedirect("index.jsp"); } else {
			 * response.sendRedirect("admin/Loi.jsp?loi=" + Loi); }
			 */
			/*
			 * request.setCharacterEncoding("UTF-8"); themKhachHang(request,
			 * response);
			 */
			// response.sendRedirect("index.jsp");
			// request.setCharacterEncoding("UTF-8");
			// response.setCharacterEncoding("UTF-8");
			themKhachHang(request, response);
		}
	}

	boolean khachHangDangkyTaiKhoan = true;
	boolean khachHangSuakyTaiKhoan = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HanhDong = request.getParameter("hanhdong");

		// byte[] HanDongUT8 = HanhDong.getBytes(StandardCharsets.ISO_8859_1);
		// HanhDong = new String(HanDongUT8, StandardCharsets.UTF_8);
		System.out.println(HanhDong);
		String Loi = "";
		if (HanhDong.equals("phantrang")) {
			phanTrang(request, response);
		}
		if (HanhDong.equals("Tìm")) {
			timKhachHang(request, response);
		}
		if (HanhDong.equals("Tắt tìm kiếm")) {
			tatTimKhachHang(request, response);
		}
		if (HanhDong.equals("Xóa")) {
			xoaKhachHang(request, response);
		}
		// Ä�á»ƒ chuyá»ƒn tá»« trang quáº£n lÃ½ qua trang sá»­a
		if (HanhDong.equals("Sửa")) {
			chuyenQuaTrangSuaKhachHang(request, response);
		}
		// Gá»�i táº¡i trang sá»­a
		if (HanhDong.equals("sua") || HanhDong.equals("Cập nhật")) {
			khachHangDangkyTaiKhoan = false;
			khachHangSuakyTaiKhoan = false;
			suaKhachHang(request, response);
		}
		if (HanhDong.equals("capnhat")) {
			khachHangSuakyTaiKhoan = true;
			suaKhachHang(request, response);
		}
		// Admin thÃªm tÃ i khoáº£n cho khÃ¡ch hÃ ng
		if (HanhDong.equals("Thêm")) {
			khachHangDangkyTaiKhoan = false;
			adminThemKhachHang(request, response);
		}
		/*
		 * // Khách hàng đăng ký tài khoản if (HanhDong.equals("Submit")) { //
		 * khachHangDangkyTaiKhoan = true; // Loi =
		 * kiemTraThongTinHopLe(request, response);
		 * 
		 * if (Loi.equals("")) { themKhachHang(request, response);
		 * response.sendRedirect("index.jsp"); } else {
		 * response.sendRedirect("admin/Loi.jsp?loi=" + Loi); }
		 * 
		 * 
		 * request.setCharacterEncoding("UTF-8"); themKhachHang(request,
		 * response);
		 * 
		 * // response.sendRedirect("index.jsp"); //
		 * request.setCharacterEncoding("UTF-8"); //
		 * response.setCharacterEncoding("UTF-8"); themKhachHang(request,
		 * response); }
		 */
	}

	protected void phanTrang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		System.out.println(page);
		if (page != null) {
			response.sendRedirect("admin/QuanLyKhachHang.jsp?page=" + page);
		}
	}

	protected String kiemTraThongTinHopLe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Loi = "";
		// Khi khÃ¡ch hÃ ng Ä‘Äƒng kÃ½ pháº£i kiá»ƒm tra 2 láº§n nháº­p máº­t
		// kháº©u cÃ³ giá»‘ng nhau khÃ´ng
		if (khachHangDangkyTaiKhoan) {
			String MatKhauKH = request.getParameter("txtMatKhauKH");
			String MatKhauKHNhapLai = request.getParameter("txtMatKhauKHNhapLai");

			if (MatKhauKH.equals(MatKhauKHNhapLai) == false) {
				Loi += "Hai lan nhap mat khau phai giong nhau. ";
			}
		}
		return Loi;
	}

	protected void timKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 response.setCharacterEncoding("UTF-8");
		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html");
		 
		String TuKhoa = request.getParameter("txtTu");

		response.sendRedirect("admin/QuanLyKhachHang.jsp?tukhoa=" +URLEncoder.encode(TuKhoa, "UTF-8")  + "&hanhdong=timkiem");
	}

	protected void tatTimKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("admin/QuanLyKhachHang.jsp");
	}

	protected void xoaKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maKH = request.getParameter("makh");
		System.out.println(maKH);
		if (KHACHANG_MOD.xoaKhachHang(maKH)) {
			response.sendRedirect("admin/QuanLyKhachHang.jsp");
		}
	}

	protected void chuyenQuaTrangSuaKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String MaKH = request.getParameter("makh");
		System.out.println(MaKH);
		response.sendRedirect("admin/SuaKhachHang.jsp?makh=" + MaKH);
	}

	protected void suaKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String MaKH = request.getParameter("txtMaKH");
		System.out.println(MaKH);
		String MaLoaiKH = request.getParameter("optMaLoaiKH");
		String TenKH = request.getParameter("txtTenKH");
		// byte[] bytes = TenKH.getBytes(StandardCharsets.ISO_8859_1);
		// TenKH = new String(bytes, StandardCharsets.UTF_8);
		String GioiTinhKH = "";
		if (request.getParameter("ckGioiTinhKH").equals("male")) {
			GioiTinhKH = "1";
		} else if (request.getParameter("ckGioiTinhKH").equals("female")) {
			GioiTinhKH = "2";
		} else {
			GioiTinhKH = "0";
		}

		String strNgaySinhKH = request.getParameter("date");
		String EmailKH = request.getParameter("txtEmailKH");
		String DiaChiKH = request.getParameter("txtDiaChiKH");
		// byte[] bytes2 = DiaChiKH.getBytes(StandardCharsets.ISO_8859_1);
		// DiaChiKH = new String(bytes2, StandardCharsets.UTF_8);
		String SoDTKH = request.getParameter("txtSoDTKH");
		String MatKhauKH = md5.encryptMD5(request.getParameter("txtMatKhauKH"));
		String ConQuanLy = "";
		if (request.getParameter("ckql") == null) {
			ConQuanLy = "0";
		} else {
			ConQuanLy = "1";
		}
		System.out.println(MaKH + MaLoaiKH + TenKH + GioiTinhKH + DiaChiKH + SoDTKH + MatKhauKH + ConQuanLy);
		KHACHHANG_OBJ obj = new KHACHHANG_OBJ(MaKH, MaLoaiKH, TenKH, GioiTinhKH, DiaChiKH, SoDTKH, TenKH, MatKhauKH,
				ConQuanLy, strNgaySinhKH, EmailKH);
		if (KHACHANG_MOD.suaKhachHang(obj)) {
			if (khachHangSuakyTaiKhoan) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("admin/QuanLyKhachHang.jsp");
			}
		} else {
			response.sendRedirect("admin/QuanLyKhachHang.jsp");
		}
		// System.out.println(strNgaySinhKH);
	}

	protected void themKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * byte[] HanDongUT8 = HanhDong.getBytes(StandardCharsets.ISO_8859_1);
		 * HanhDong = new String(HanDongUT8, StandardCharsets.UTF_8);
		 */
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// String HanhDong = request.getParameter("txtTenKH");
		// System.out.println(HanhDong);

		// String TenKH = request.getParameter("txtTenKH");
		request.setCharacterEncoding("UTF-8");
		String MaKH = request.getParameter("txtMaKH");

		String TenKhach = request.getParameter("txtTenKH");
		// byte[] TenUT8 = TenKhach.getBytes(StandardCharsets.ISO_8859_1);
		// TenKhach = new String(TenUT8, StandardCharsets.UTF_8);

		String MaLoaiKH = request.getParameter("optMaLoaiKH");
		String GioiTinhKH = "";
		if (request.getParameter("ckGioiTinhKH").equals("female")) {
			GioiTinhKH = "Nữ";
		} else {
			GioiTinhKH = "Nam";
		}

		String strNgaySinhKH = request.getParameter("date");
		String EmailKH = request.getParameter("txtEmailKH");

		String DiaChiKH = request.getParameter("txtDiaChiKH");
		// byte[] DiaChiUTF8 = DiaChiKH.getBytes(StandardCharsets.ISO_8859_1);
		// DiaChiKH = new String(DiaChiUTF8, StandardCharsets.UTF_8);

		String SoDTKH = request.getParameter("txtSoDTKH");
		String TenDNKH = request.getParameter("txtTenDNKH");

		///// Ma Hoa Mat Khau MD5
		String MatKhauKH = md5.encryptMD5(request.getParameter("txtMatKhauKH"));

		if (KHACHANG_MOD.kiemTraTrungTenDangNhap(TenDNKH) > 0) {
			request.setAttribute("thongbao", "Đăng ký thất bại, tên đăng nhập đã tồn tại");
			request.getRequestDispatcher("client/DangKy.jsp").forward(request, response);
		} else if (KHACHANG_MOD.kiemTraTrungEmail(EmailKH) > 0) {
			request.setAttribute("thongbao", "Đăng ký thất bại, email đã tồn tại");
			request.getRequestDispatcher("client/DangKy.jsp").forward(request, response);
		} else {
			KHACHHANG_OBJ obj = new KHACHHANG_OBJ(MaKH, MaLoaiKH, TenKhach, GioiTinhKH, DiaChiKH, SoDTKH, TenDNKH,
					MatKhauKH, strNgaySinhKH, EmailKH);
			if (KHACHANG_MOD.themKhachHang(obj)) {
				response.sendRedirect("index.jsp");
				System.out.println("Them thanh cong");
			}

		}
	}
	
	protected void adminThemKhachHang(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * byte[] HanDongUT8 = HanhDong.getBytes(StandardCharsets.ISO_8859_1);
		 * HanhDong = new String(HanDongUT8, StandardCharsets.UTF_8);
		 */
		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// String HanhDong = request.getParameter("txtTenKH");
		// System.out.println(HanhDong);

		// String TenKH = request.getParameter("txtTenKH");
		request.setCharacterEncoding("UTF-8");
		String MaKH = request.getParameter("txtMaKH");

		String TenKhach = request.getParameter("txtTenKH");
		// byte[] TenUT8 = TenKhach.getBytes(StandardCharsets.ISO_8859_1);
		// TenKhach = new String(TenUT8, StandardCharsets.UTF_8);

		String MaLoaiKH = request.getParameter("optMaLoaiKH");
		String GioiTinhKH = "";
		if (request.getParameter("ckGioiTinhKH").equals("female")) {
			GioiTinhKH = "Nữ";
		} else {
			GioiTinhKH = "Nam";
		}

		String strNgaySinhKH = request.getParameter("date");
		String EmailKH = request.getParameter("txtEmailKH");

		String DiaChiKH = request.getParameter("txtDiaChiKH");
		// byte[] DiaChiUTF8 = DiaChiKH.getBytes(StandardCharsets.ISO_8859_1);
		// DiaChiKH = new String(DiaChiUTF8, StandardCharsets.UTF_8);

		String SoDTKH = request.getParameter("txtSoDTKH");
		String TenDNKH = request.getParameter("txtTenDNKH");

		///// Ma Hoa Mat Khau MD5
		String MatKhauKH = md5.encryptMD5(request.getParameter("txtMatKhauKH"));

		if (KHACHANG_MOD.kiemTraTrungTenDangNhap(TenDNKH) > 0) {
			request.setAttribute("thongbao", "Đăng ký thất bại, tên đăng nhập đã tồn tại");
			request.getRequestDispatcher("client/DangKy.jsp").forward(request, response);
		} else if (KHACHANG_MOD.kiemTraTrungEmail(EmailKH) > 0) {
			request.setAttribute("thongbao", "Đăng ký thất bại, email đã tồn tại");
			request.getRequestDispatcher("client/DangKy.jsp").forward(request, response);
		} else {
			KHACHHANG_OBJ obj = new KHACHHANG_OBJ(MaKH, MaLoaiKH, TenKhach, GioiTinhKH, DiaChiKH, SoDTKH, TenDNKH,
					MatKhauKH, strNgaySinhKH, EmailKH);
			if (KHACHANG_MOD.themKhachHang(obj)) {
				response.sendRedirect("/Shopcongnghe/admin/QuanLyKhachHang.jsp");
				System.out.println("Them thanh cong");
			}

		}
	}

}
