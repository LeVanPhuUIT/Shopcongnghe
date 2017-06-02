package Model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import object.THONGTINNGUOINHAN_OBJ;

public class THONGTINNGUOINHAN_MOD {
	private KETNOI_MOD ketnoi;
	private Connection cnn;
	public THONGTINNGUOINHAN_MOD()
	{
		ketnoi=new KETNOI_MOD();
		cnn=ketnoi.getConnect();
	}
	public void ThemThongtinNguoinhan(THONGTINNGUOINHAN_OBJ thongtin)
	{
		try {
			CallableStatement cs=cnn.prepareCall("{ call sp_Them_THONGTINNGUOINHAN(?,?,?,?,?,?,?)}");
			cs.setString(1, thongtin.getMaDH());
			cs.setString(2, thongtin.getHoten());
			cs.setString(3, thongtin.getDiachi());
			cs.setString(4, thongtin.getDienthoai());
			cs.setString(5, thongtin.getPthucnhanhang());
			cs.setString(6, thongtin.getHthucthanhtoan());
			cs.setString(7, thongtin.getYeucaukhac());
			cs.executeUpdate();
			if(cs!=null)
			{
				cs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
