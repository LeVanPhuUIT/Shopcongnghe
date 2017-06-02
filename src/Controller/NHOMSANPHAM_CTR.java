package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.NHOMSANPHAM_OBJ;
import Model.NHOMSANPHAM_MOD;

/**
 * Servlet implementation class NHOMSANPHAM_CTR
 */
@WebServlet("/NHOMSANPHAM_CTR")
public class NHOMSANPHAM_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NHOMSANPHAM_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NHOMSANPHAM_MOD nhomsanpham_mod=new NHOMSANPHAM_MOD();
		String manhomsp=request.getParameter("manhomsp");
		if(manhomsp!=null)
		{
			if(nhomsanpham_mod.XoaNhomsanpham(manhomsp)!=0)
			{
				response.sendRedirect("admin/Quanlynhomsanpham.jsp");
			}
			else{//
				request.setAttribute("thongbao", "Không thể xóa nhóm sản phẩm này vì trong nhóm có sản phẩm còn nằm trong đơn hàng");
				request.getRequestDispatcher("admin/Quanly.jsp").forward(request, response);
				
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NHOMSANPHAM_MOD nhomsanpham_mod=new NHOMSANPHAM_MOD();
		NHOMSANPHAM_OBJ nhomsp=new NHOMSANPHAM_OBJ();
		request.setCharacterEncoding("UTF-8");
		String key=request.getParameter("key");
		if(key!=null)
		{
			nhomsp.setManhomSp(request.getParameter("manhomsp"));
			nhomsp.setMadongSp(request.getParameter("madongsp"));
			nhomsp.setTennhomSp(request.getParameter("tennhomsp"));
			nhomsp.setGhichuSp(request.getParameter("ghichunhomsp"));
			if(key.equals("them"))
			{
				if(nhomsanpham_mod.ThemNhomsanpham(nhomsp)>0)
					response.sendRedirect("admin/Quanlynhomsanpham.jsp");
				else
					response.sendError(0);
	
				
			}
			if(key.equals("sua"))
			{
				if(nhomsanpham_mod.SuaNhomsanpham(nhomsp)>0)
					response.sendRedirect("admin/Quanlynhomsanpham.jsp");
				else
					response.sendError(0);
			}
		}
	}

}
