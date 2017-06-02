package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DANGXUAT
 */
@WebServlet("/DANGXUAT_CTR")
public class DANGXUAT_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DANGXUAT_CTR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("kh");
		if(key==null)
		{
			request.getSession(true).invalidate();
			response.sendRedirect("Dangnhap.jsp");
		}else
		{
			request.getSession(true).invalidate();
			response.sendRedirect("index.jsp");
		}
	}

}
