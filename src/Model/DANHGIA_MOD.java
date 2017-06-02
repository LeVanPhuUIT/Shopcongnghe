package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.DANHGIA_OBJ;
import object.DONGSANPHAM_OBJ;

public class DANHGIA_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn;
	public DANHGIA_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
		
	}
	public int themDanhgia(DANHGIA_OBJ danhgia)
	{
		int count=0;
		try {
				CallableStatement cs=cnn.prepareCall("{ call sp_Danhgia_Khachhang(?,?,?)}");
				cs.setString(1,danhgia.getTieude());
				cs.setString(2, danhgia.getNoidung());
				cs.setString(3, danhgia.getMasp());
				count=cs.executeUpdate();
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return count;
	}
	public void xoaDanhgia(String madg)
	{
		try {
				CallableStatement cs=cnn.prepareCall("{ call sp_Xoa_Danhgia(?)}");
				cs.setString(1,madg);
				cs.executeUpdate();
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
	public ResultSet DanhsachDanhgia(int trang,int sobai_trang)
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_Danhgia(?,?) }");
			cs.setInt(1, trang);
			cs.setInt(2, sobai_trang);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet TatcaDanhgia()
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{call sp_Tatca_Danhgia }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
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
		if(getSodong(TatcaDanhgia())%Sobai_trang!=0)
		{
			pageCount=getSodong(TatcaDanhgia())/Sobai_trang+1;
		}
		else
		{
			pageCount=getSodong(TatcaDanhgia())/Sobai_trang;
		}
		return pageCount;
	}
	
}
