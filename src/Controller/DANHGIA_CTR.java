package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.DANHGIA_OBJ;
import Model.DANHGIA_MOD;

/**
 * Servlet implementation class DANHGIA_CTR
 */
@WebServlet("/DANHGIA_CTR")
public class DANHGIA_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DANHGIA_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DANHGIA_MOD danhgia_mod=new DANHGIA_MOD();
		String madg=request.getParameter("madg");
		if(madg!=null)
		{
			danhgia_mod.xoaDanhgia(madg);
			response.sendRedirect("admin/Nhanxetdanhgia.jsp");
		}
		else
		{
			response.sendError(0);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DANHGIA_MOD danhgia_mod=new DANHGIA_MOD();
		DANHGIA_OBJ danhgia_obj=new DANHGIA_OBJ();
		request.setCharacterEncoding("UTF-8");
		String tieude=request.getParameter("tieude");
		String noidung=request.getParameter("noidung");
		String masp=request.getParameter("masp");
		danhgia_obj.setTieude(tieude);
		danhgia_obj.setNoidung(noidung);
		danhgia_obj.setMasp(masp);
		if(danhgia_mod.themDanhgia(danhgia_obj)>0)
		{
			request.setAttribute("msg", "Cảm ơn bạn đã gửi nhận xét đánh giá, chúng tôi sẽ tiếp nhận ý kiến đóng góp của bạn !");
			request.getRequestDispatcher("chitietsanpham.jsp?masp="+masp).forward(request, response);
		}
		else
		{
			response.sendError(1);
		}
	}

}
