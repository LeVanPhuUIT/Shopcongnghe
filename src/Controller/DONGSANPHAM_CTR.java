package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.DONGSANPHAM_OBJ;
import Model.DONGSANPHAM_MOD;

/**
 * Servlet implementation class DONGSANPHAM_CTR
 */
@WebServlet("/DONGSANPHAM_CTR")
public class DONGSANPHAM_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DONGSANPHAM_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DONGSANPHAM_MOD dongsanpham_mod=new DONGSANPHAM_MOD();
		String madongsp=request.getParameter("madongsp");
		if(madongsp!=null)
		{
			if(dongsanpham_mod.XoaDongsanpham(madongsp)!=0)
				response.sendRedirect("admin/Quanlydongsanpham.jsp");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DONGSANPHAM_MOD dongsanpham_mod=new DONGSANPHAM_MOD();
		DONGSANPHAM_OBJ dongsanpham_obj=new DONGSANPHAM_OBJ();
		request.setCharacterEncoding("UTF-8");
		String key=request.getParameter("key");
		if(key!=null)
		{
			dongsanpham_obj.setMadongSP(request.getParameter("madongsp"));
			dongsanpham_obj.setTendongSP(request.getParameter("tendongsp"));
			dongsanpham_obj.setGhichu(request.getParameter("ghichudongsp"));
			if(key.equals("them"))
			{
				if(dongsanpham_mod.ThemDongsanpham(dongsanpham_obj)>0)
				{
					response.sendRedirect("admin/Quanlydongsanpham.jsp");
				}
			}
			if(key.equals("sua"))
			{
				if(dongsanpham_mod.SuaDongsanpham(dongsanpham_obj)>0)
				{
					response.sendRedirect("admin/Quanlydongsanpham.jsp");
				}
			}
				
		}
	}

}
