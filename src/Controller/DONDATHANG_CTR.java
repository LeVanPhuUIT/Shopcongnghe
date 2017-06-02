package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DONDATHANG_MOD;
import Model.GIOHANG_MOD;
import Model.THONGTINNGUOINHAN_MOD;
import object.CTDONDATHANG_OBJ;
import object.DONDATHANG_OBJ;
import object.KHACHHANG_OBJ;
import object.MONHANG_OBJ;
import object.THONGTINNGUOINHAN_OBJ;

/**
 * Servlet implementation class DONDATHANG
 */
@WebServlet("/DONDATHANG_CTR")
public class DONDATHANG_CTR extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DONDATHANG_CTR() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DONDATHANG_MOD dondathang_mod = new DONDATHANG_MOD();
		String MaDH = request.getParameter("madh");
		if (MaDH != null) {
			dondathang_mod.HuyDonhang(MaDH);
			response.sendRedirect("admin/Quanlydonhang.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchby = request.getParameter("searchby");
		String keyword = request.getParameter("search");

		if (searchby != null) {
			response.sendRedirect("admin/Quanlydonhang.jsp?searchby=" + searchby + "&search=" + keyword);
		} else {
			final THONGTINNGUOINHAN_OBJ thongtin = new THONGTINNGUOINHAN_OBJ();// Dung  de luu thong tin nguoi nhan
			DONDATHANG_MOD dondathang_mod = new DONDATHANG_MOD();
			HttpSession session = request.getSession(true);
			final KHACHHANG_OBJ khachhang = (KHACHHANG_OBJ) session.getAttribute("Khachhang");// Lay
																								// thong
																								// tin
																								// khach
																								// hang
			final GIOHANG_MOD giohang = (GIOHANG_MOD) session.getAttribute("giohang");// Lay
																						// thong
																						// tin
																						// gio
																						// hang
			// Thiet lap thong tin nguoi nhan
			// String MaDH=dondathang_mod.TaomaDONHANG();//Tao ma don hang
			// thongtin.setMaDH(MaDH);
			thongtin.setHoten(request.getParameter("hoten"));
			thongtin.setDiachi(request.getParameter("diachi"));
			thongtin.setDienthoai(request.getParameter("dienthoai"));
			thongtin.setPthucnhanhang(request.getParameter("phuongthucgiaohang"));
			thongtin.setHthucthanhtoan(request.getParameter("hinhthucthanhtoan"));
			thongtin.setYeucaukhac(request.getParameter("yeucaukhac"));
			session.setAttribute("Thongtinnguoinhan", thongtin);// Luu thong tin
																// nguoi nhan vo
																// session
			/*String MaDH = "";

			ThreadDemo T1 = new ThreadDemo("Thread - 1 ", dondathang_mod, giohang, khachhang, thongtin);
			T1.start();

			// wait for threads to end
			try {
				T1.join();
			} catch (Exception e) {
				System.out.println("Interrupted");
			}
			
			try {
				TimeUnit.SECONDS.sleep(16);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MaDH=T1.getMaDH();
			session.setAttribute("MaDH", MaDH);// Lua ma don hang vua tao vo
			response.sendRedirect("thongtindonhang.jsp");*/
			String MaDH="";
			try {
				MaDH = dondathang_mod.ThemDonhang(giohang, khachhang, thongtin);//Thêm đơn hàng đồng thời lấy mã đơn hàng vừa thêm
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}//Gọi hàm thêm đơn hàng
			session.setAttribute("MaDH", MaDH);//Lua ma don hang vua tao vo session
			response.sendRedirect("thongtindonhang.jsp");
		}
	}

}

//////////////////////////////////////
class ThemDonHang {
	/*
	 * GIOHANG_MOD gioHang; KHACHHANG_OBJ khachHang; THONGTINNGUOINHAN_OBJ
	 * thongTin;
	 * 
	 * public ThemDonHang(GIOHANG_MOD gioHang, KHACHHANG_OBJ khachHang,
	 * THONGTINNGUOINHAN_OBJ thongTin) { super(); this.gioHang = gioHang;
	 * this.khachHang = khachHang; this.thongTin = thongTin; }
	 */

	public String maDonHang(GIOHANG_MOD gioHang, KHACHHANG_OBJ khachHang, THONGTINNGUOINHAN_OBJ thongTin) {
		DONDATHANG_MOD dondathang_mod = new DONDATHANG_MOD();
		try {
			System.out.print("chạy vô dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin)");
			String mdh = dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin);
			return mdh;
		} catch (SQLException e) {
			System.out.print("k chạy dc dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin)");
			e.printStackTrace();
		}
		return "";
	}
}

//////////////////////////////////////////
class ThreadThemDonHang extends Thread {
	private Thread t;
	private GIOHANG_MOD gioHang;
	private KHACHHANG_OBJ khachHang;
	private THONGTINNGUOINHAN_OBJ thongTin;
	private ThemDonHang themDonHang;

	private String maDH = "";

	ThreadThemDonHang(GIOHANG_MOD gh, KHACHHANG_OBJ kh, THONGTINNGUOINHAN_OBJ tt) {
		gioHang = gh;
		khachHang = kh;
		thongTin = tt;
	}

	public synchronized boolean themDonHangSyn(GIOHANG_MOD gioHang, KHACHHANG_OBJ khachHang,
			THONGTINNGUOINHAN_OBJ thongTin) {
		DONDATHANG_MOD dondathang_mod = new DONDATHANG_MOD();

		try {
			System.out.print("chạy vô dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin)");
			this.maDH = dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin);
			return true;
		} catch (SQLException e) {
			System.out.print("k chạy dc dondathang_mod.ThemDonhang(gioHang, khachHang, thongTin)");
			e.printStackTrace();
		}
		return false;
	}

	public String getMaDH() {
		return this.maDH;
	}
}

class ThreadDemo extends Thread {
	private Thread t;
	private String threadName;
	DONDATHANG_MOD donDatHang_MOD;
	private GIOHANG_MOD gioHang;
	private KHACHHANG_OBJ khachHang;
	private THONGTINNGUOINHAN_OBJ thongTin;
	private String MaDH;
	ThreadDemo(String name, DONDATHANG_MOD donDatHang_MOD, GIOHANG_MOD gh, KHACHHANG_OBJ kh, THONGTINNGUOINHAN_OBJ tt) {
		threadName = name;
		this.donDatHang_MOD = donDatHang_MOD;
		gioHang = gh;
		khachHang = kh;
		thongTin = tt;
	}

	public void run() {
		synchronized (donDatHang_MOD) {
			try {
				System.out.println("Thread " + threadName + " into Funtion ThemDonhang()");
				this.MaDH=donDatHang_MOD.ThemDonhang(gioHang, khachHang, thongTin);
				System.out.println("Thread " + threadName + " out Funtion ThemDonhang()");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Thread " + threadName + " exiting.");
	}

	public void start() {
		System.out.println("Starting " + threadName);
		if (t == null) {
			t = new Thread(this, threadName);
			t.start();
		}
	}
	
	public String getMaDH(){
		return this.MaDH;
	}
}
