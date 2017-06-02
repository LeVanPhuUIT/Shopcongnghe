package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.NHOMSANPHAM_OBJ;
import object.THONGTINCUAHANG_OBJ;

public class THONGTINCUAHANG_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn;
	public THONGTINCUAHANG_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
		
	}
	public String Taoid()
	{
		String ID="";
		ResultSet rs=TatcaThongtin();
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
				ID="TT"+maStr;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			ID="TT000001";
		}
		return ID;
	}
	public int SuaThongTin(THONGTINCUAHANG_OBJ tt)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Sua_ThongTin(?,?,?,?)}");
			cs.setString(1, tt.getID());
			cs.setString(2, tt.getTenCuahang());
			cs.setString(3, tt.getDiachi());
			cs.setString(4, tt.getSodienthoai());
			cs.setString(5, tt.getEmail());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int themthongtin(THONGTINCUAHANG_OBJ thongtin)
	{
		int count=0;
		try {
				CallableStatement cs=cnn.prepareCall("{ call sp_thongtincuahang(?,?,?,?)}");
				cs.setString(1, thongtin.getID());
				cs.setString(2,thongtin.getTenCuahang());
				cs.setString(3, thongtin.getDiachi());
				cs.setString(4, thongtin.getSodienthoai());
				
				cs.setString(5,thongtin.getEmail());
				count=cs.executeUpdate();
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return count;
	}
	public int Xoathongtin(String ID)
	{
		int count=0;
		try {
			CallableStatement cs =cnn.prepareCall("{ call sp_Xoa_tt(?)}");
			cs.setString(1,ID);
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	public ResultSet Thongtincuahang(String ID)
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs=cnn.prepareCall("{ call sp_ThongTin_cuahang(?)}");
			cs.setString(1, ID);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet TatcaThongtin()
	{
		ResultSet rs=null;
		CallableStatement cs=null;
		try {
			cs = cnn.prepareCall("{call sp_Tatca_Thongtin }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

}
