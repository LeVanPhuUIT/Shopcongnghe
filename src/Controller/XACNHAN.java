package Controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.NHANVIEN_OBJ;

/**
 * Servlet Filter implementation class XACNHAN
 */
@WebFilter("/XACNHAN")
public class XACNHAN implements Filter {

    /**
     * Default constructor. 
     */
    public XACNHAN() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session=((HttpServletRequest)request).getSession(true);
		NHANVIEN_OBJ nhanvien_obj=(NHANVIEN_OBJ) session.getAttribute("Nhanvien");
		String URL=((HttpServletRequest)request).getRequestURI();
		session.setAttribute("url",URL);
		if(nhanvien_obj==null)
		{
			request.getRequestDispatcher("../Loitruycap.jsp").forward(request, response);
		}
		else
		{
			
			if(XacnhanQuyenQuantri(nhanvien_obj,URL))
			{
				/// Cho phép request được đi tiếp. (Vượt qua Filter này).
				chain.doFilter(request, response);
			}
			else
			{
				if(URL.contains("NhanVien"))
				{
					session.setAttribute("url","admin/Quanlysanpham.jsp");
					request.setAttribute("canhbao", "Bạn đang đăng nhập với tài khoản nhân viên nên không thể truy cập vào đường dẫn này, để quay lại trang quản trị nhấn vào <a href='Quanly.jsp'>Đây</a>");
					request.getRequestDispatcher("../Loitruycap.jsp").forward(request, response);;
				}
				else
				{
					chain.doFilter(request, response);
				}
			}
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	public boolean XacnhanQuyenQuantri(NHANVIEN_OBJ nhanvien_obj,String URL)
	{
		if(nhanvien_obj.gettendnnv().equals("admin"))
		{
			return true;
		}
		
		return false;
	}
	public boolean XacnhanQuyenNhanvien(NHANVIEN_OBJ nhanvien_obj,String URL)
	{
		if(nhanvien_obj!=null)
		{
			return true;
		}
		return false;
	}

}
