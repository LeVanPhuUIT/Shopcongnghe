package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import object.DANHGIA_OBJ;
import object.THONGTINCUAHANG_OBJ;
import Model.DANHGIA_MOD;
import Model.THONGTINCUAHANG_MOD;

/**
 * Servlet implementation class THONGTINCUAHANG_CTR
 */
@WebServlet("/THONGTINCUAHANG_CTR")
public class THONGTINCUAHANG_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public THONGTINCUAHANG_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MultipartRequest multi =new MultipartRequest(request,".",10*1024*1024,"UTF-8");
		
		String key=multi.getParameter("key");
		THONGTINCUAHANG_MOD thongtin_mod=new THONGTINCUAHANG_MOD();
		THONGTINCUAHANG_OBJ thongtin_obj=new THONGTINCUAHANG_OBJ();
		if(key.equals("them")==true||key.equals("sua"))
		{
			request.setCharacterEncoding("UTF-8");
			String ID=request.getParameter("ID");
			String tencuahang=request.getParameter("tencuahang");
			String sdt=request.getParameter("sdt");
			String diachi=request.getParameter("diachi");
			String email=request.getParameter("email");
			thongtin_obj.setID(ID);
			thongtin_obj.setTenCuahang(tencuahang);
			thongtin_obj.setSodienthoai(sdt);
			thongtin_obj.setDiachi(diachi);
			thongtin_obj.setEmail(email);
				if(thongtin_mod.themthongtin(thongtin_obj)>0)
				{
					
					response.sendRedirect("admin/Cauhinhtrangweb.jsp");
				}
				else
				{
					response.sendError(0);
				}
				
		}
			
			else
			{
				int count=thongtin_mod.SuaThongTin(thongtin_obj);
				if(count>0)
				{
					response.sendRedirect("admin/Cauhinhtrangweb.jsp");
				}
				else
				{
					response.sendError(0);
				}
			}
		
	}

}
