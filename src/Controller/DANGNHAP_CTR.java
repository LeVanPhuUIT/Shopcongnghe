package Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.EncryptMD5;
import Model.KHACHANG_MOD;
import Model.NHANVIEN_MOD;
import object.KHACHHANG_OBJ;
import object.NHANVIEN_OBJ;

/**
 * Servlet implementation class DANGNHAP_CTR
 */
@WebServlet("/DANGNHAP_CTR")
public class DANGNHAP_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EncryptMD5 md5=new EncryptMD5();
	Cookie ckeTaikhoan;
	Cookie ckeMatkhau;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DANGNHAP_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			NHANVIEN_OBJ nhanvien_obj=new NHANVIEN_OBJ();
			NHANVIEN_MOD nhanvien_mod=new NHANVIEN_MOD();
			String Taikhoan="";
			String Matkhau="";
			Taikhoan =request.getParameter("Taikhoan");
			Matkhau=md5.encryptMD5(request.getParameter("Matkhau"));
			String ghinho=request.getParameter("ghinho");
			
			if(nhanvien_mod.Kiemtra(Taikhoan, Matkhau) ||(ckeTaikhoan!=null && ckeMatkhau!=null && nhanvien_mod.Kiemtra(ckeTaikhoan.getValue(), ckeMatkhau.getValue())))
			{
				String url=(String) request.getSession(true).getAttribute("url");
				nhanvien_obj.settendnnv(Taikhoan);
				nhanvien_obj.setmatkhaunv(Matkhau);
				nhanvien_obj.sethotennv(nhanvien_mod.LayTenNV(Taikhoan, Matkhau));
				nhanvien_obj.setmanv(nhanvien_mod.LayMaNV(Taikhoan, Matkhau));
				ckeTaikhoan=new Cookie("Taikhoan",Taikhoan);
				ckeMatkhau=new Cookie("Matkhau",Matkhau);
				response.addCookie(ckeTaikhoan);
				response.addCookie(ckeMatkhau);
				ckeTaikhoan.setMaxAge(7*24*60*60);
				ckeMatkhau.setMaxAge(7*24*60*60);
				HttpSession session=request.getSession();
				session.setAttribute("Nhanvien",nhanvien_obj);
				if(ghinho==null)
				{
					ckeTaikhoan.setMaxAge(0);
					ckeMatkhau.setMaxAge(0);
				}
				if(url!=null)
				{
					response.sendRedirect(url);
				}
				else
				{
					response.sendRedirect("admin/Quanly.jsp");
				}
			}
			else
			{
				request.setAttribute("thongbao", "Đăng nhập thất bại, Tài khoản hoặc Mật khẩu sai");
				request.getRequestDispatcher("Dangnhap.jsp").forward(request, response);
			}
			
		}

}
