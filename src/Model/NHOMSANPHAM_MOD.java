package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.NHOMSANPHAM_OBJ;

public class NHOMSANPHAM_MOD {
	private KETNOI_MOD ketnoi=null;
	private Connection cnn=null;
	public NHOMSANPHAM_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
	}
	public ResultSet DanhsachNhomSanPham() // Lấy danh sách các nhóm sản phẩm
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{ call sp_Danhsach_NHOMSANPHAM }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public String TaomaNhomSP() //tạo mã nhóm sản phẩm
	{
		String manhomsp="";
		ResultSet rs=null;
		rs=DanhsachNhomSanPham();
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
				max=max+100001;
				manhomsp="NSP"+Integer.toString(max).substring(1);
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
			manhomsp="NSP00001";
		}
		return manhomsp;
	}
	public int ThemNhomsanpham(NHOMSANPHAM_OBJ nhomsp) // thêm nhóm sản phẩm
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Them_NHOMSANPHAM(?,?,?,?)}");
			cs.setString(1, nhomsp.getManhomSp());
			cs.setString(2, nhomsp.getMadongSp());
			cs.setString(3, nhomsp.getTennhomSp());
			cs.setString(4, nhomsp.getGhichuSp());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int SuaNhomsanpham(NHOMSANPHAM_OBJ nhomsp)//sửa thông tin nhóm sản phẩm
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Sua_NHOMSANPHAM(?,?,?,?)}");
			cs.setString(1, nhomsp.getManhomSp());
			cs.setString(2, nhomsp.getMadongSp());
			cs.setString(3, nhomsp.getTennhomSp());
			cs.setString(4, nhomsp.getGhichuSp());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int XoaNhomsanpham(String manhomsp) //XÓA nhóm sản phẩm 
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{call sp_Xoa_NHOMSANPHAM(?)}");
			cs.setString(1, manhomsp);
			count =cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	public ResultSet ThongtinNhomsanphamManhomsp(String manhomsp) // lấy thông tin nhóm sản phẩm theo mã nhóm sản phẩm
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{ call sp_Thongtin_NHOMSANPHAM_MANHOMSP(?) }");
			cs.setString(1,manhomsp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet DanhsachNhomsanpham_DONGSP(String madongsp)//Danh sach Nhom san pham theo DONG SP
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{ call sp_Danhsach_NHOMSANPHAM_DONGSP(?) }");
			cs.setString(1,madongsp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public String layTennhomsp(String manhomsp)
	{
		String tennhomsp="";
		ResultSet tt=ThongtinNhomsanphamManhomsp(manhomsp);
		try {
			if(tt.next())
			{
				tennhomsp=tt.getString(3);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tennhomsp;
	}
}
