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

import object.SANPHAM_OBJ;
import Model.SANPHAM_MOD;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SANPHAM_CTR
 */
@WebServlet("/SANPHAM_CTR")
public class SANPHAM_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SANPHAM_MOD sanpham_mod;
    private SANPHAM_OBJ sanpham_obj;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SANPHAM_CTR() {
        super();
        sanpham_mod=new SANPHAM_MOD();
        sanpham_obj=new SANPHAM_OBJ();
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page=request.getParameter("page");
		String masp=request.getParameter("masp");
		SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
		if(page!=null)
		{
			response.sendRedirect("admin/Quanlysanpham.jsp?page="+page);
		}
		if(masp!=null)
		{
			if(sanpham_mod.XoaSanPham(masp)!=0)
			{
				response.sendRedirect("admin/Quanlysanpham.jsp");
			}
			else
			{
				//response.sendError(0);
				//response.sendRedirect("admin/Loi.jsp");
				request.setAttribute("thongbaoxoasanpham", "Không thể xóa sản phẩm này vì sản phẩm còn nằm trong đơn hàng");
				request.getRequestDispatcher("admin/Quanly.jsp").forward(request, response);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchkey=request.getParameter("search");//Dùng để kiểm tra xem người dùng yêu cầu tìm kiếm theo mã hay theo tên
		String searchby=request.getParameter("searchby");
		String key1=request.getParameter("key");
		if(searchkey==null)
		{
				MultipartRequest multi =new MultipartRequest(request,".",10*1024*1024,"UTF-8");
				String key=multi.getParameter("key");//Dùng để kiểm tra xem hành động vừa gửi đến là thêm hay sửa
				if(key.equals("them")==true||key.equals("sua"))
				{
					sanpham_obj.setMaSP(multi.getParameter("masp"));
					sanpham_obj.setMaNhomSP(multi.getParameter("nhomsp"));
					sanpham_obj.setTenSP(multi.getParameter("tensp"));
					sanpham_obj.setGiaSp(Integer.parseInt(multi.getParameter("giasp")));
					sanpham_obj.setMotaSP(multi.getParameter("motasp"));
					sanpham_obj.setXuatxu(multi.getParameter("xuatxusp"));
					sanpham_obj.setDonvitinh(multi.getParameter("donvitinhsp"));
					sanpham_obj.setSoluong(Integer.parseInt(multi.getParameter("soluong")));
					String hinhanh="";
					File file=multi.getFile("hinhanh");
					if(file!=null)
					{
						String thumuc=getServletContext().getRealPath("hinhanh");
						file.renameTo(new File(thumuc,file.getName()));
						hinhanh=file.getName();
					}
					else
					{
						ResultSet rs=sanpham_mod.TimSanphamMasp(sanpham_obj.getMaSP());
						try {
							if(rs.next())
							{
								hinhanh=rs.getString("HINHANH");
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					sanpham_obj.setHinhanh(hinhanh);
					if(key.equals("them"))
					{
						int count=sanpham_mod.ThemSanPham(sanpham_obj);
						if(count>0)
						{
							response.sendRedirect("admin/Quanlysanpham.jsp");
						}
						else
						{
							response.sendError(0);
						}
					}
					else
					{
						int count=sanpham_mod.SuaSanPham(sanpham_obj);
						if(count>0)
						{
							response.sendRedirect("admin/Quanlysanpham.jsp");
						}
						else
						{
							response.sendError(0);
						}
					}
				}
				else
				{
					response.getWriter().print(key1);
				}
			}
		else
		{
			response.setCharacterEncoding("UTF-8");
			searchkey=searchkey.replaceAll(" ","+");
			if(searchby.equals("tensp"))
			{
				response.sendRedirect(response.encodeRedirectURL("admin/Timkiemsanpham.jsp?searchby=tensp&searchkey="+searchkey));
			}
			else
			{
				response.sendRedirect(response.encodeRedirectURL("admin/Timkiemsanpham.jsp?searchby=masp&searchkey="+searchkey));
			}
		}
	}
	
}
