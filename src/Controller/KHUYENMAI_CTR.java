package Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.KHUYENMAI_MOD;
import object.KHUYENMAI_OBJ;

/**
 * Servlet implementation class KHUYENMAI_CTR
 */
@WebServlet("/KHUYENMAI_CTR")
public class KHUYENMAI_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
	KHUYENMAI_MOD khuyenmai_mod ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KHUYENMAI_CTR() {
        super();
        khuyenmai_mod=new KHUYENMAI_MOD();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String makm=request.getParameter("makm");
		if(makm!=null)
		{
			if(khuyenmai_mod.XoaKhuyenmai(makm)!=0)
				response.sendRedirect("admin/Quanlykhuyenmai.jsp");
			else
			{
				response.sendError(1,"Có lỗi xảy ra");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("key");
		if(key!=null)
		{
			KHUYENMAI_OBJ khuyenmai_obj=new KHUYENMAI_OBJ();
			
			String makm=request.getParameter("makm");
			String masp=request.getParameter("masp");
			String ngaybatdau=request.getParameter("ngaybatdau");
			String ngayketthuc=request.getParameter("ngayketthuc");
			int giakm=Integer.parseInt(request.getParameter("giakm"));
			khuyenmai_obj.setMaKh(makm);
			khuyenmai_obj.setMaSp(masp);
			khuyenmai_obj.setNgaybatdau(ngaybatdau);
			khuyenmai_obj.setNgaykethuc(ngayketthuc);
			khuyenmai_obj.setGiaKm(giakm);
			if(key.equals("them"))
			{
				if(khuyenmai_mod.ThemKhuyenmai(khuyenmai_obj)>0)
					response.sendRedirect("admin/Quanlykhuyenmai.jsp");
				else
				{
					response.sendError(1, "Có lỗi xảy ra");
				}
			}
			else
			{
				if(khuyenmai_mod.SuaKhuyenmai(khuyenmai_obj)>0)
					response.sendRedirect("admin/Quanlykhuyenmai.jsp");
				else
				{
					response.sendError(1, "Có lỗi xảy ra");
				}
			}
		}
		
		
		

		
	}

}
