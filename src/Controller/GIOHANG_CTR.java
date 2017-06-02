package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.GIOHANG_MOD;
import object.MONHANG_OBJ;

/**
 * Servlet implementation class GIOHANG_CTR
 */
@WebServlet("/GIOHANG_CTR")
public class GIOHANG_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GIOHANG_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String masp=request.getParameter("masp");
		HttpSession session = ((HttpServletRequest)request).getSession(true);
		GIOHANG_MOD giohang_mod=(GIOHANG_MOD)session.getAttribute("giohang");
		giohang_mod.xoaMonhang(masp);
		session.setAttribute("giohang", giohang_mod);
		response.sendRedirect("giohang.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MONHANG_OBJ monhang_obj=new MONHANG_OBJ();
		GIOHANG_MOD giohang_mod;
		request.setCharacterEncoding("UTF-8");
		String masp=request.getParameter("masp");
		String soluong=request.getParameter("Soluong");
		String tensp=request.getParameter("tensp");
		String giasp=request.getParameter("giasp");
		monhang_obj.setMasp(masp);
		monhang_obj.setTensp(tensp);
		monhang_obj.setGiasp(Integer.parseInt(giasp));
		monhang_obj.setSoluong(Integer.parseInt(soluong));
		HttpSession session=request.getSession(true);
		if((GIOHANG_MOD)session.getAttribute("giohang")==null)
		{
			giohang_mod=new GIOHANG_MOD();
			giohang_mod.themMonhang(monhang_obj);
			session.setAttribute("giohang", giohang_mod);
			response.sendRedirect("giohang.jsp");
		}
		else
		{
			giohang_mod=(GIOHANG_MOD)session.getAttribute("giohang");
			giohang_mod.themMonhang(monhang_obj);
			session.setAttribute("giohang", giohang_mod);
			response.sendRedirect("giohang.jsp");
		}
	}

}
