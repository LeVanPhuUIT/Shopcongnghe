package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HOADON_MOD {
		private KETNOI_MOD ketnoi;
		private Connection cnn=null;
		public HOADON_MOD()
		{
			ketnoi=new KETNOI_MOD();
			cnn=ketnoi.getConnect();
		}
		public ResultSet DanhsachNgayHD()//Liet ke danh sach ngay HD
		{
			ResultSet rs=null;
			CallableStatement cs;
			try {
				cs = cnn.prepareCall("{call sp_DanhsachNgay_HOADON}");
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		public ResultSet ThongkedoanhthutheoNgay(String tungay,String denngay)//Thong ke doanh thu tu ngay... den ngay....
		{
			ResultSet rs=null;
			CallableStatement cs;
			try {
				cs = cnn.prepareCall("{call sp_ThongKeDoanhthu_Theongay(?,?)}");
				cs.setString(1, tungay);
				cs.setString(2, denngay);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		public ResultSet ThongkedoanhthutheoThang(int thang,int nam)//Thong ke doanh thu tu ngay... den ngay....
		{
			ResultSet rs=null;
			CallableStatement cs;
			try {
				cs = cnn.prepareCall("{call sp_ThongKeDoanhthu_Thang(?,?)}");
				cs.setInt(1, thang);
				cs.setInt(2, nam);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		public int TinhtongDoanhthu(String tungay,String denngay)//Tinh tong doanh thu theo ngay
		{
			ResultSet rs=ThongkedoanhthutheoNgay(tungay,denngay);
			int tong=0;
			if(rs!=null)
			{
				try {
					while(rs.next())
					{
						tong+=rs.getInt("DOANHTHU");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return tong;
		}
		public int TinhtongdoanhthuThang(int thang,int nam)//Tinh tong doanh thu theo thang
		{
			ResultSet rs=ThongkedoanhthutheoThang(thang,nam);
			int tong=0;
			if(rs!=null)
			{
				try {
					while(rs.next())
					{
						tong+=rs.getInt("DOANHTHU");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return tong;
		}
		public ResultSet Danhsachhoadon_Trang(int sobai_trang,int trang)//Liệt kê tất cả các hóa đơn
		{
			ResultSet rs=null;
			CallableStatement cs;
			try {
				cs = cnn.prepareCall("{call sp_Danhsach_HOADON_Trang(?,?)}");
				cs.setInt(1, sobai_trang);
				cs.setInt(2, trang);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		public ResultSet DanhsachHoadon()
		{
			ResultSet rs=null;
			CallableStatement cs;
			try {
				cs = cnn.prepareCall("{call sp_Danhsach_HOADON}");
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}
		public int getSodong(ResultSet rs)
		{
			int rowCount=0;
			try {
				while(rs.next())
				{
					rowCount++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rowCount;
		}
		public int tinhSotrang(int Sobai_trang) throws SQLException
		{
			int pageCount=0;
			ResultSet rs=DanhsachHoadon();
			if(getSodong(rs)%Sobai_trang!=0)
			{
				pageCount=getSodong(rs)/Sobai_trang+1;
			}
			else
			{
				pageCount=getSodong(rs)/Sobai_trang;
			}
			return pageCount;
		}
		public ResultSet TimHoadonMahd(String mahd)//Tìm don hang theo mã
		{
			ResultSet rs=null;
			CallableStatement cs=null;
			try {
				cs=cnn.prepareCall("{ call sp_TimHoadon_MAHD(?)}");
				cs.setString(1, mahd);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
		}
		public ResultSet TimHoadonTenKh(String Tenkh)//Tìm don hang theo tên KH
		{
			ResultSet rs=null;
			CallableStatement cs=null;
			try {
				cs=cnn.prepareCall("{ call sp_TimHoadon_Tenkh(?)}");
				cs.setString(1, Tenkh);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
		}
		public ResultSet Chitiethoadon(String Mahd)
		{
			ResultSet rs=null;
			CallableStatement cs=null;
			try {
				cs=cnn.prepareCall("{ call sp_Chitiet_HOADON(?)}");
				cs.setString(1, Mahd);
				rs=cs.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return rs;
		}
}
