package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;



import object.DONGSANPHAM_OBJ;

public class DONGSANPHAM_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn=null;
	public DONGSANPHAM_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
	}
	public String TaomaDSP()
	{
		String MadongSP="";
		ResultSet rs=null;
		rs=DanhsachdongSanpham();
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
				MadongSP="DSP"+Integer.toString(max).substring(1);
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
			MadongSP="DSP00001";
		}
		
		return MadongSP;
	}
	public ResultSet DanhsachdongSanpham()
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Danhsach_DONGSANPHAM }");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public int ThemDongsanpham(DONGSANPHAM_OBJ dsp)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Them_DONGSANPHAM(?,?,?)}");
			cs.setString(1, dsp.getMadongSP());
			cs.setString(2, dsp.getTendongSP());
			cs.setString(3, dsp.getGhichu());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int SuaDongsanpham(DONGSANPHAM_OBJ dsp)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Sua_DONGSANPHAM(?,?,?)}");
			cs.setString(1, dsp.getMadongSP());
			cs.setString(2, dsp.getTendongSP());
			cs.setString(3, dsp.getGhichu());
			count=cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int XoaDongsanpham(String madongsp)
	{
		int count=0;
		try {
			CallableStatement cs=cnn.prepareCall("{call sp_Xoa_DONGSANPHAM(?)}");
			cs.setString(1, madongsp);
			count =cs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	public ResultSet ThongtinDongsanphamMadongsp(String madongsp)
	{
		ResultSet rs=null;
		CallableStatement cs;
		try {
			cs = cnn.prepareCall("{call sp_Thongtin_DONGSANPHAM_MADONGSP(?) }");
			cs.setString(1, madongsp);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public String layTendongsp(String madongsp)
	{
		String tendongsp="";
		ResultSet tt=ThongtinDongsanphamMadongsp(madongsp);
		try {
			if(tt.next())
			{
				tendongsp=tt.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tendongsp;
	}
}
