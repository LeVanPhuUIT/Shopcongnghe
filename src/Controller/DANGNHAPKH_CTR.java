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

import object.KHACHHANG_OBJ;
import Model.EncryptMD5;
import Model.KHACHANG_MOD;

/**
 * Servlet implementation class DANGNHAPKH_CTR
 */
@WebServlet("/DANGNHAPKH_CTR")
public class DANGNHAPKH_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EncryptMD5 md5=new EncryptMD5();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DANGNHAPKH_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KHACHHANG_OBJ khachhang_obj=new KHACHHANG_OBJ();
		KHACHANG_MOD khachhang_mod=new KHACHANG_MOD();
		String Taikhoan =request.getParameter("Taikhoan");
		String Matkhau=md5.encryptMD5(request.getParameter("Matkhau"));
		String ghinho=request.getParameter("ghinho");
		HttpSession session = request.getSession();
		if(khachhang_mod.Kiemtradangnhap(Taikhoan, Matkhau))
		{
			String url=(String) request.getSession(true).getAttribute("urlkh");
			ResultSet ttKH=khachhang_mod.ThongtinKhachhangTENDN(Taikhoan);
			khachhang_obj.setTenDNKH(Taikhoan);
			khachhang_obj.setMatKhauKH(Matkhau);
			try {
				if(ttKH.next())
				{
					khachhang_obj.setMaKH(ttKH.getString("MAKH"));
					khachhang_obj.setTenKH(ttKH.getString("TENKH"));
					khachhang_obj.setDiaChiKH(ttKH.getString("DIACHIKH"));
					khachhang_obj.setSoDTKH(ttKH.getString("SODTKH"));
					khachhang_obj.setEmailKH(ttKH.getString("EMAILKH"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Cookie ckeTaikhoan=new Cookie("Taikhoan",Taikhoan);
			Cookie ckeMatkhau=new Cookie("Matkhau",Matkhau);
			ckeTaikhoan.setMaxAge(7*24*60*60);
			ckeMatkhau.setMaxAge(7*24*60*60);
			/*HttpSession session=request.getSession();*/
			session.setAttribute("Khachhang",khachhang_obj);
			if(ghinho==null)
			{
				ckeTaikhoan.setMaxAge(0);
				ckeMatkhau.setMaxAge(0);
			}
			if(url!=null)
			{
				if(url.contains("thanhtoan"))
				{
					response.sendRedirect(url);
				}
				else
				{
					response.sendRedirect("index.jsp");
				}
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
		}
		else
		{
			session.setAttribute("thongbao", "Đăng nhập thất bại, Tài khoản hoặc Mật khẩu sai");
			/*request.setAttribute("thongbao", "Đăng nhập thất bại, Tài khoản hoặc Mật khẩu sai");*/
			response.sendRedirect("client/Dangnhap.jsp");
		}
	}

}
