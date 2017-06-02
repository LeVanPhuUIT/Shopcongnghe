package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.KHACHHANG_OBJ;

/**
 * Servlet implementation class THANHTOAN_CTR
 */
@WebServlet("/THANHTOAN_CTR")
public class THANHTOAN_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public THANHTOAN_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		KHACHHANG_OBJ khachhang_obj=(KHACHHANG_OBJ) session.getAttribute("Khachhang");
		if(khachhang_obj==null)
		{
			response.sendRedirect("client/Dangnhap.jsp");
		}
		else
		{
			response.sendRedirect("thanhtoan.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
