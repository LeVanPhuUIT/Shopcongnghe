package Controller;

import Model.DONDATHANG_MOD;
import Model.KETNOI_MOD;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import object.NHANVIEN_OBJ;

/**
 * Servlet implementation class INBAOCAO_CTR
 */
@WebServlet("/INBAOCAO_CTR")
public class INBAOCAO_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public INBAOCAO_CTR() {
        super();
        
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		NHANVIEN_OBJ nv= (NHANVIEN_OBJ) request.getSession(true).getAttribute("Nhanvien");//Lay thong tin nhan vien luu trong SESSION
		response.setContentType("application/pdf");
		response.setCharacterEncoding("UTF-8");
		KETNOI_MOD k=new KETNOI_MOD();
		if(id!=null)
		{
			int key=Integer.parseInt(id);
			switch (key)
			{
			case 1:
				DONDATHANG_MOD dondathang_mod=new DONDATHANG_MOD();
				String MaDH=request.getParameter("madh");//Lay ma don hang
				if(MaDH!=null)//Neu ma DH khac NULL co nghia la nguoi dung da nhan in don hang
				{
					dondathang_mod.XulyDonhang(MaDH,nv.getmanv());
					Indondathang(MaDH,response,request,k.getConnect(),nv);//Goi ham in don hang
				}
				else
				{
					response.sendRedirect("admin/Quanlydonhang.jsp");
				}
				break;
			case 2:
				String thang=request.getParameter("thang");
				String nam=request.getParameter("nam");
				if(thang!=null&&nam!=null)
				{
					InTOP10SP(thang,nam,response,request,k.getConnect(),nv);
				}
				else
				{
					response.sendRedirect("admin/Thongkesanphambanchay.jsp");
				}
				break;
			case 3:
				String tungay=request.getParameter("tungay");
				String denngay=request.getParameter("denngay");
				if(tungay!=null&&denngay!=null)
				{
					ThongkedoanhthutheoNgay(tungay,denngay,response,request,k.getConnect(),nv);
				}
				else
				{
					response.sendRedirect("admin/Thongkedoanhthutheongay.jsp");
				}
				break;
			case 4:
				String th=request.getParameter("thang");
				String na=request.getParameter("nam");
				if(th!=null&&na!=null)
				{
					ThongkedoanhthutheoThang(th,na,response,request,k.getConnect(),nv);
				}
				else
				{
					response.sendRedirect("admin/Thongkedoanhthuthang.jsp");
				}
				break;
			case 5:
				Thongkehangton(response,request,k.getConnect(),nv);
				break;
			
			case 6:
				String mahd=request.getParameter("mahd");
				if(mahd!=null)
				{
					Laphoadon(mahd,response,request,k.getConnect(),nv);
				}
				else
				{
					response.sendRedirect("admin/Quanlyhoadon.jsp");
				}
				break;
			case 7:
				Thongkeloaikhachhang(response,request,k.getConnect());
				break;
			}	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		response.setContentType("application/pdf");
		response.setCharacterEncoding("UTF-8");
		KETNOI_MOD k=new KETNOI_MOD();
		if(id!=null)
		{
			Thongkeloaikhachhang(response,request,k.getConnect());
		}
	}
	//HAM IN DON HANG
	public void Indondathang(String MaDH,HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		HashMap params=new HashMap();
		params.put("MADH",MaDH);
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Dondathang.jrxml"));
		System.out.println(file.getPath());
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	//HAM IN THONG KE 10 SANPHAM BAN CHAY
	public void InTOP10SP(String thang,String nam,HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		int t=Integer.parseInt(thang);
		int n=Integer.parseInt(nam);
		HashMap params=new HashMap();
		params.put("thang",t);
		params.put("nam", n);
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Danhsachbanchay.jrxml"));
		
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	public void ThongkedoanhthutheoNgay(String tungay,String denngay,HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		HashMap params=new HashMap();
		params.put("tungay",tungay);
		params.put("denngay",denngay);
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Baocaodoanhthutheongay.jrxml"));
		
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	public void ThongkedoanhthutheoThang(String thang,String nam,HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		int t=Integer.parseInt(thang);
		int n=Integer.parseInt(nam);
		HashMap params=new HashMap();
		params.put("thang",t);
		params.put("nam",n);
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Baocaodoanhthuthang.jrxml"));
		
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	public void Thongkehangton(HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		HashMap params=new HashMap();
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Thongkehangton.jrxml"));
		
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	public void Laphoadon(String MaHD,HttpServletResponse response,HttpServletRequest request,Connection cnn,NHANVIEN_OBJ nv) throws IOException
	{
		HashMap params=new HashMap();
		params.put("MAHD", MaHD);
		params.put("Nguoilap",nv.gethotennv());
		
		File file=new File(getServletContext().getRealPath("admin/reports/Laphoadon.jrxml"));
		
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr, params,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}
	
	public void Thongkeloaikhachhang(HttpServletResponse response,HttpServletRequest request,Connection cnn) throws IOException
	{
		File file=new File(getServletContext().getRealPath("admin/reports/ThongKeCacLoaiKhachHang.jrxml"));
		byte[] bytes = null;
		try {
			JasperReport Jr=JasperCompileManager.compileReport(file.getPath());
			bytes = JasperRunManager.runReportToPdf(Jr,null,cnn);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentLength(bytes.length);
		ServletOutputStream outputs=response.getOutputStream();
		outputs.write(bytes, 0, bytes.length);
	}

}
