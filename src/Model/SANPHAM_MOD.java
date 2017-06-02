package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.SANPHAM_OBJ;

public class SANPHAM_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn=null;
	public SANPHAM_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
	}
	public String TaomaSanpham()//Tạo mới 1 mã sản phẩm
	{
		String masp="";
		ResultSet rs=DanhsachSanpham();
		if(rs!=null)
		{
			try {
				int max=0;
				while(rs.next())
				{
					int maInt=Integer.parseInt(rs.getString(1).substring(2));
					if(maInt>max)
					{
						max=maInt;
					}
				}
				max=max+1000000+1;
				String maStr="";
				maStr=Integer.toString(max);
				maStr=maStr.substring(1);
				masp="SP"+maStr;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			masp="SP000001";
		}
		return masp;
	}
	public int ThemSanPham(SANPHAM_OBJ sanpham_obj)//Thêm mới 1 sản phẩm
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Them_SANPHAM(?,?,?,?,?,?,?,?,?)}");
			cs.setString(1, sanpham_obj.getMaSP());
			cs.setString(2, sanpham_obj.getMaNhomSP());
			cs.setString(3, sanpham_obj.getTenSP());
			cs.setInt(4, sanpham_obj.getGiaSp());
			cs.setString(5,sanpham_obj.getMotaSP());
			cs.setString(6, sanpham_obj.getXuatxu());
			cs.setString(7, sanpham_obj.getDonvitinh());
			cs.setString(8, sanpham_obj.getHinhanh());
			cs.setInt(9, sanpham_obj.getSoluong());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	public int XoaSanPham(String masp)//Xóa 1 sản phẩm
	{
		int count=0;
		try {
			CallableStatement cs =cnn.prepareCall("{ call sp_Xoa_SANPHAM(?)}");
			cs.setString(1,masp);
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return count;
		}
		
		return count;
	}
	public int SuaSanPham(SANPHAM_OBJ sanpham_obj)//Sửa 1 sản phẩm
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Sua_SANPHAM(?,?,?,?,?,?,?,?,?)}");
			cs.setString(1, sanpham_obj.getMaSP());
			cs.setString(2, sanpham_obj.getMaNhomSP());
			cs.setString(3, sanpham_obj.getTenSP());
			cs.setInt(4,sanpham_obj.getGiaSp());
			cs.setString(5,sanpham_obj.getMotaSP());
			cs.setString(6, sanpham_obj.getXuatxu());
			cs.setString(7, sanpham_obj.getDonvitinh());
			cs.setString(8, sanpham_obj.getHinhanh());
			cs.setInt(9, sanpham_obj.getSoluong());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	public ResultSet DanhsachSanpham()//Lấy danh sách sản phẩm
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Danhsach_SANPHAM }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet ThongtinSanpham(String masp)//Lấy thông tin của một sản phẩm
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Thongtin_SANPHAM_MASP(?)}");
			cs.setString(1, masp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet TimSanphamMasp(String masp)//Tìm sản phẩm theo mã
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Timkiem_SANPHAM_MASP(?)}");
			cs.setString(1, masp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet TimSanphamTensp(String Tensp)//Tìm sản phẩm theo tên
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Timkiem_SANPHAM_TENSP(?)}");
			cs.setString(1, Tensp);
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
	public int tinhSotrang(int Sobai_trang)
	{
		int pageCount=0;
		if(getSodong(DanhsachSanpham())%Sobai_trang!=0)
		{
			pageCount=getSodong(DanhsachSanpham())/Sobai_trang+1;
		}
		else
		{
			pageCount=getSodong(DanhsachSanpham())/Sobai_trang;
		}
		return pageCount;
	}
	public ResultSet DanhsachSanpham_Trang(int Tranghientai,int Sobai_trang)//Danh sach san pham theo trang
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_SANPHAM_trang (?,?)}");
			cs.setInt(1,Tranghientai);
			cs.setInt(2, Sobai_trang);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet DanhsachSanphamBanChay()
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_TOP6_SANPHAM_Banchay()}");
			
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public ResultSet DanhsachSanpham_NHOMSP_DONGSP_Trang(int sosp_trang,int trang,String madongsp, String manhomsp)//Danh sach san pham theo DONG SAN PHAM VA NHOM SANPHAM theo trang
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_DanhSach_SANPHAM_DONGSP_NHOMSP_Trang (?,?,?,?)}");
			cs.setInt(1,sosp_trang);
			cs.setInt(2, trang);
			cs.setString(3, madongsp);
			cs.setString(4, manhomsp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet DanhsachSanpham_NHOMSP_DONGSP(String madongsp, String manhomsp)//Danh sach san pham theo DONG SAN PHAM VA NHOM SANPHAM chua phan trang
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_DanhSach_SANPHAM_DONGSP_NHOMSP(?,?)}");
			cs.setString(1, madongsp);
			cs.setString(2, manhomsp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public int tinhsoTrang_NSP(String madongsp,String manhomsp,int sosp_trang)//Tinh so trang theo DONG SAN PHAM VA NHOM SANPHAM
	{
		ResultSet rs=DanhsachSanpham_NHOMSP_DONGSP(madongsp,manhomsp);
		int pageCount=0;
		int sodong=getSodong(rs);
		if(sodong%sosp_trang!=0)
		{
			pageCount=sodong/sosp_trang+1;
		}
		else
		{
			pageCount=sodong/sosp_trang;
		}
		return pageCount;
	}
	public ResultSet DanhsachSanphamcungNhom(String Masp)//Chon ra 4 san pham cung nhom voi san pham nay
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_SANPHAM_Cungnhom (?)}");
			cs.setString(1,Masp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	public ResultSet TOP10SanphamBanchay(int thang,int nam)
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_TOP10_SANPHAM_Banchay (?,?)}");
			cs.setInt(1,thang);
			cs.setInt(2, nam);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet Thongkehangton()
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Thongke_Hangton}");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int Laytrigia()
	{
		int trigia=0;
		ResultSet rs=Thongkehangton();
		if(rs!=null)
		{
			try {
				while(rs.next())
				{
					trigia+=rs.getInt(5);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return trigia;
	}
	public int LaySoluong()
	{
		int soluong=0;
		ResultSet rs=Thongkehangton();
		if(rs!=null)
		{
			try {
				while(rs.next())
				{
					soluong+=rs.getInt(3);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return soluong;
	}
	public ResultSet TimSanphamKhachhang(String tukhoa)
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Timkiem_SANPHAM_KHACHHANG (?)}");
			cs.setString(1,tukhoa);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
