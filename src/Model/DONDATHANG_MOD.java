package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.CTDONDATHANG_OBJ;
import object.DONDATHANG_OBJ;
import object.KHACHHANG_OBJ;
import object.MONHANG_OBJ;
import object.THONGTINNGUOINHAN_OBJ;

public class DONDATHANG_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn;
	public DONDATHANG_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
		
	}
	public String ThemDonhang(GIOHANG_MOD giohang,KHACHHANG_OBJ khachhang, THONGTINNGUOINHAN_OBJ thongtin) throws SQLException
	{
		String MaDH="";
		CallableStatement cs=null;
		SANPHAM_MOD sanPham=new SANPHAM_MOD();
		

		try {

				//Tắt chế độ auto-commit, bắt đầu giao tác trong JDBC
				cnn.setAutoCommit(false);
				//Gọi hàm Tạo mã đơn hàng
				MaDH=TaomaDONHANG();
				// vì đối tượng Thongtin truyền vào còn thiếu thuộc tính MaDh
				thongtin.setMaDH(MaDH);
				//Thêm thông tin đơn hàng và Chi tiết đơn hàng
				cs=cnn.prepareCall("{ call sp_themDonhang(?,?,?)}");
				cs.setString(1, MaDH);
				cs.setString(2, khachhang.getMaKH());
				cs.setInt(3, giohang.Tongtien());
				cs.executeUpdate();
				cs=null;
				//Thêm chi tiết đơn hàng
				for(int i=0;i<giohang.SoluongMonhang();i++)
				{
					cs=cnn.prepareCall("{call sp_Them_CTDH(?,?,?,?) }");
					cs.setString(1, MaDH);
					cs.setString(2, giohang.getGiohang().get(i).getMasp());
					cs.setInt(3, giohang.getGiohang().get(i).getSoluong());
					cs.setInt(4,giohang.getGiohang().get(i).thanhTien());
					cs.executeUpdate();
				}
				cs=null;
				///Thêm thông tin người nhận
				cs=cnn.prepareCall("{ call sp_Them_THONGTINNGUOINHAN(?,?,?,?,?,?,?)}");
				cs.setString(1, thongtin.getMaDH());
				cs.setString(2, thongtin.getHoten());
				cs.setString(3, thongtin.getDiachi());
				cs.setString(4, thongtin.getDienthoai());
				cs.setString(5, thongtin.getPthucnhanhang());
				cs.setString(6, thongtin.getHthucthanhtoan());
				cs.setString(7, thongtin.getYeucaukhac());
				cs.executeUpdate();
				//Nếu không xảy ra lỗi thì tiến hành commit dữ liệu, kết thúc giao tác
				cnn.commit();
				
		} catch (SQLException e1) {
			e1.printStackTrace();
			//Nếu phát sinh lỗi thì xóa bỏ đơn hàng và thực hiện rollback
			//Xóa bỏ đơn hàng vừa thêm trong trường hợp đã thêm  đơn hàng thành công nhưng các bước sau đó bị lỗi
			HuyDonhang(MaDH);
			if(cnn!=null)
				cnn.rollback();
		}
		finally
		{
			//Thiết lập lại chế độ mặc định
			cnn.setAutoCommit(true);
		}
		
		
		//Trả về mã đơn hàng vừa thêm
		return MaDH;
	}
	public String TaomaDONHANG()
	{
		String MaDH="";
		ResultSet rs=null;
		rs=DanhsachDonhang();
		if(rs!=null)
		{
			int max=0;
			try {
				while(rs.next())
				{
					int matam=Integer.parseInt(rs.getString(1).substring(3));
					if(matam>max)
						max=matam;
				}
				max=max+1000001;
				MaDH="DH"+Integer.toString(max).substring(1);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			MaDH="DH000001";
		}
		return MaDH;
	}
	public ResultSet DanhsachDonhang()
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_DONHANG }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int tienDonhang(String MaDH)//Lay tien don hang
	{
		int Tongtien=0;
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Tien_DONHANG(?) }");
			cs.setString(1, MaDH);
			rs=cs.executeQuery();
			if(rs.next())
				Tongtien=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Tongtien;
	}
	public ResultSet Danhsachdonhang_Trang(int sodonhang_trang,int trang)//dANH SACH DON HANG DA PHAN TRANG
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_DONHANG_Trang(?,?) }");
			cs.setInt(1, sodonhang_trang);
			cs.setInt(2, trang);
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
		ResultSet rs=DanhsachDonhang();
		if(getSodong(DanhsachDonhang())%Sobai_trang!=0)
		{
			pageCount=getSodong(DanhsachDonhang())/Sobai_trang+1;
		}
		else
		{
			pageCount=getSodong(DanhsachDonhang())/Sobai_trang;
		}
		return pageCount;
	}
	public ResultSet TimDonhangMadh(String madh)//Tìm don hang theo mã
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Tim_DONHANG_MADH(?)}");
			cs.setString(1, madh);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet TimDonhangTenKh(String Tenkh)//Tìm don hang theo tên KH
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Tim_DONHANG_TENKH(?)}");
			cs.setString(1, Tenkh);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet Chitietdonhang(String MaDH)
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Chitiet_DONHANG(?)}");
			cs.setString(1, MaDH);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public void XulyDonhang(String MaDH,String MaNV)
	{
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Xuly_DONHANG(?,?)}");
			//Truyền tham số cho Giao tác
			cs.setString(1, MaDH);
			cs.setString(2, MaNV);
			cs.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	public void HuyDonhang(String MaDH)
	{
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Huy_DONHANG(?)}");
			//Truyền tham số cho giao tác
			cs.setString(1, MaDH);
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
