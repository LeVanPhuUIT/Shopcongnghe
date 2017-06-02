package Model;

import java.awt.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LOAIKHACHHANG_MOD {
	public static ResultSet layDanhSachLoaiKH() {
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			rs = kn.getConnect().prepareCall("{call sp_TruyVan_LoaiKhachHang}")
					.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static void main(String[] args) {
		ResultSet dsLKH = layDanhSachLoaiKH();
		ArrayList rowValues = new ArrayList();
		try {
			while (dsLKH.next()) {
			    rowValues.add(dsLKH.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}   
		String[] arrdsLKH = (String[]) rowValues.toArray(new String[rowValues.size()]);
		String tam="";
		for (int i = 0; i < arrdsLKH.length; i++) {
			tam+=arrdsLKH[i]+",";
		}
		System.out.println(tam);
	}
}
