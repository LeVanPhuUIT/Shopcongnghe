package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.KHUYENMAI_OBJ;

public class KHUYENMAI_MOD {
	private KETNOI_MOD c;
	private Connection cnn;
	public KHUYENMAI_MOD()
	{
		c=new KETNOI_MOD();
		cnn=c.getConnect();
	}
	public String TaomaKhuyenmai()//Tạo mới 1 mã sản phẩm
	{
		String makm="";
		ResultSet rs=DanhsachKhuyenmai();
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
				makm="KM"+maStr;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			makm="SP000001";
		}
		return makm;
	}
	public ResultSet DanhsachKhuyenmai()
	{
		CallableStatement cs=null;
		ResultSet rs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Danhsach_KHUYENMAI }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int ThemKhuyenmai(KHUYENMAI_OBJ khuyenmai_obj)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Them_KHUYENMAI(?,?,?,?,?)}");
			cs.setString(1,khuyenmai_obj.getMaKh());
			cs.setString(2, khuyenmai_obj.getMaSp());
			cs.setString(3, khuyenmai_obj.getNgaybatdau());
			cs.setString(4, khuyenmai_obj.getNgaykethuc());
			cs.setInt(5, khuyenmai_obj.getGiaKm());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
	public int SuaKhuyenmai(KHUYENMAI_OBJ khuyenmai_obj)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Sua_KHUYENMAI(?,?,?,?,?)}");
			cs.setString(1,khuyenmai_obj.getMaKh());
			cs.setString(2, khuyenmai_obj.getMaSp());
			cs.setString(3, khuyenmai_obj.getNgaybatdau());
			cs.setString(4, khuyenmai_obj.getNgaykethuc());
			cs.setInt(5, khuyenmai_obj.getGiaKm());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
	public int XoaKhuyenmai(String makm)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Xoa_KHUYENMAI(?)}");
			cs.setString(1,makm);
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
	public ResultSet ThongtinKhuyenmai()
	{
		CallableStatement cs=null;
		ResultSet rs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Thongtin_KHUYENMAI }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet ThongtinKhuyenmaiMakm(String makm)
	{
		CallableStatement cs=null;
		ResultSet rs=null;
		try {
			cs=cnn.prepareCall("{ call sp_Thongtin_KHUYENMAI_MAKM(?) }");
			cs.setString(1, makm);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int LaygiaKhuyenmai(String masp)
	{
		int giakm=0;
		CallableStatement cs=null;
		ResultSet rs=null;
		try {
			cs=cnn.prepareCall("{ call sp_LayGia_KHUYENMAI(?) }");
			cs.setString(1, masp);
			rs=cs.executeQuery();
			if(rs.next())
			{
				giakm=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return giakm;
	}
}
