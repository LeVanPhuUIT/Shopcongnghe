package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.NHANVIEN_OBJ;
import Model.EncryptMD5;
import Model.NHANVIEN_MOD;

@WebServlet(urlPatterns = { "/NHANVIEN_CTR" })

public class NHANVIEN_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EncryptMD5 md5=new EncryptMD5();
	public NHANVIEN_CTR() {
		super();
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String HanhDong = request.getParameter("hanhdong");
		
		//byte[] HanDongUT8 = HanhDong.getBytes(StandardCharsets.ISO_8859_1);
		//
		//HanhDong = new String(HanDongUT8, StandardCharsets.UTF_8);
		System.out.println(HanhDong);
		if (HanhDong.equals("Tìm")) {
			TimNhanVien(request, response);
		}
		if (HanhDong.equals("Tắt tìm kiếm")) {
			response.sendRedirect("admin/NhanVienQuanLy.jsp");
		}
		if (HanhDong.equals("Xóa")) {
			XoaNhanVien(request, response);
		}
		if (HanhDong.equals("Sửa")) {
			ChuyenQuaTrangSuaNhanVien(request, response);
		}
		/*if (HanhDong.equals("Thêm")) {
			ChuyenNhanVienThemMoi(request, response);
		}*/
		/// sau khi click Chap Nhan
		if (HanhDong.equals("sua")) {
			CapNhatNhanVien(request, response);
		}
		if (HanhDong.equals("Thêm")) {
				ThemNhanVien(request, response);
		}
	}

	protected void TimNhanVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tukhoa = request.getParameter("txttukhoa");
		//byte[] tuKhoaUT8 = tukhoa.getBytes(StandardCharsets.ISO_8859_1);
		//tukhoa = new String(tuKhoaUT8, StandardCharsets.UTF_8);
		System.out.println(tukhoa);
		response.sendRedirect("admin/NhanVienQuanLy.jsp?tukhoa=" +URLEncoder.encode(tukhoa, "UTF-8")+ "&hanhdong=timkiem");
	}

	protected void XoaNhanVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String manv = request.getParameter("manv");
		System.out.println(manv);
		if (NHANVIEN_MOD.XoaNhanVien(manv)) {
			response.sendRedirect("admin/NhanVienQuanLy.jsp");
		}
	}

	protected void ChuyenNhanVienThemMoi(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin/NhanVienThemMoi.jsp");
	}
	
	protected void ChuyenQuaTrangSuaNhanVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String manv = request.getParameter("manv");
		System.out.println(manv);
		response.sendRedirect("admin/NhanVienCapNhat.jsp?manv=" + manv);
	}

	protected void CapNhatNhanVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String manv = request.getParameter("txtmanv");
		System.out.println(manv);
		String hotennv = request.getParameter("txthotennv");
		//byte[] byteshotennv = hotennv.getBytes(StandardCharsets.ISO_8859_1);
		//hotennv = new String(byteshotennv, StandardCharsets.UTF_8);
		String ngaysinhnv = request.getParameter("date");
		String gioitinhnv = "";
		if (request.getParameter("ckGioiTinhNV").equals("male")) {
			gioitinhnv = "1";
		} 
		else if(request.getParameter("ckGioiTinhNV").equals("female")){
			gioitinhnv = "2";
		}
		else{
			gioitinhnv = "0";
		}
		String diachinv = request.getParameter("txtdiachinv");
		//byte[] bytesdiachinv = diachinv.getBytes(StandardCharsets.ISO_8859_1);
		//diachinv = new String(bytesdiachinv, StandardCharsets.UTF_8);
		String sodtnv = request.getParameter("txtsodtnv");
		String tendnnv = request.getParameter("txttendnnv");
		String matkhau = md5.encryptMD5(request.getParameter("txtmatkhau"));
		System.out.println(manv + hotennv + ngaysinhnv + gioitinhnv + diachinv	+ sodtnv + tendnnv + matkhau);
		NHANVIEN_OBJ obj = new NHANVIEN_OBJ(manv,hotennv,ngaysinhnv,gioitinhnv,diachinv,sodtnv,tendnnv,matkhau);
		NHANVIEN_MOD.CapNhatNhanVien(obj);
		response.sendRedirect("admin/NhanVienQuanLy.jsp");
	}

	protected void ThemNhanVien(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String manv = request.getParameter("txtmanv");
		String hotennv = request.getParameter("txthotennv");
		//byte[] byteshotennv = hotennv.getBytes(StandardCharsets.ISO_8859_1);
		//hotennv = new String(byteshotennv, StandardCharsets.UTF_8);
		String ngaysinhnv = request.getParameter("date");
		String gioitinhnv = "";
		if (request.getParameter("chkgioitinhnv") == null) {
			gioitinhnv = "0";
		} else if (request.getParameter("ckGioiTinhNV").equals("male")){
			gioitinhnv = "1";
		}
		else{
			gioitinhnv = "2";
		}
		//byte[] bytesgioitinhnv = gioitinhnv.getBytes(StandardCharsets.ISO_8859_1);
		//gioitinhnv = new String(bytesgioitinhnv, StandardCharsets.UTF_8);
		String diachinv = request.getParameter("txtdiachinv");
		byte[] bytesdiachinv = diachinv.getBytes(StandardCharsets.ISO_8859_1);
		diachinv = new String(bytesdiachinv, StandardCharsets.UTF_8);
		String sodtnv = request.getParameter("txtsodtnv");
		String tendnnv = request.getParameter("txttendnnv");
		String matkhau = md5.encryptMD5(request.getParameter("txtmatkhau"));
		System.out.println(ngaysinhnv);
		System.out.println(manv + hotennv + ngaysinhnv + gioitinhnv + diachinv	+ sodtnv + tendnnv + matkhau);
		NHANVIEN_OBJ obj = new NHANVIEN_OBJ(manv,hotennv,ngaysinhnv,gioitinhnv,diachinv,sodtnv,tendnnv,matkhau);
		System.out.println(ngaysinhnv);
		NHANVIEN_MOD nv_mod=new NHANVIEN_MOD();
		if(nv_mod.kiemTraTrungTenDangNhap(tendnnv)==false)
		{
			response.sendRedirect("admin/NhanVienLoi.jsp?tenloi=Trung ten dang nhap");
		}
		else  {
			NHANVIEN_MOD.ThemNhanVien(obj);
			response.sendRedirect("admin/NhanVienQuanLy.jsp");
		}
	}
}
