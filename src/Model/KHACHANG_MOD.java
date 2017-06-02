package Model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import object.KHACHHANG_OBJ;

public class KHACHANG_MOD {
	public static String taoMaKhachHang() {
		String MaKH = "";
		KETNOI_MOD kn = new KETNOI_MOD();
		ResultSet rs;
		try {
			rs = kn.getConnect().prepareCall("{call sp_TruyVan_KhachHang}")
					.executeQuery();
			// ResultSet rs=DanhsachSanpham();
			if (rs != null) {
				try {
					int max = 0;
					while (rs.next()) {
						int maInt = Integer.parseInt(rs.getString(1).substring(
								2));
						if (maInt > max) {
							max = maInt;
						}
					}
					max = max + 1000000 + 1;
					String maStr = "";
					maStr = Integer.toString(max);
					maStr = maStr.substring(1);
					MaKH = "KH" + maStr;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				MaKH = "KH000001";
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return MaKH;

	}

	public static boolean themKhachHang(KHACHHANG_OBJ obj) {
		
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			CallableStatement cs = kn.getConnect().prepareCall(
					"{call sp_Them_KhachHang(?, ?, ?, ?, ? ,?, ?, ?,?,?)}");
			cs.setString(1, obj.getMaKH());
			cs.setString(2, obj.getMaLoaiKH());
			cs.setString(3, obj.getTenKH());
			cs.setString(4, obj.getGioiTinhKH());
			cs.setString(5, obj.getDiaChiKH());
			cs.setString(6, obj.getSoDTKH());
			cs.setString(7, obj.getTenDNKH());
			cs.setString(8, obj.getMatKhauKH());
			cs.setString(9, obj.getNgaySinhKH().toString());
			cs.setString(10, obj.getEmailKH());
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/*try {
			Statement st=kn.getConnect().createStatement();
			String strSQL="insert into KHACHHANG(MAKH,MALOAIKH,TENKH) values('KH100','LKH1','Thừa Thị Huế')";
			st.executeUpdate(strSQL);
			System.out.println("Insert OK");
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		return true;
	}

	public static boolean xoaKhachHang(String maKH) {
		boolean kq = false;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_Xoa_KhachHang(?)}");
			cs.setString(1, maKH);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kq;
	}

	public static ResultSet timKhachHang(String TuKhoa) {
		ResultSet rs = null;
		System.out.println(TuKhoa);
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_Tim_KhachHang(?)}");
			cs.setString(1, TuKhoa);
			rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int kiemTraTrungTenDangNhap(String TenDNKH) {
		int soDong = 0;
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_KiemTraTrungTenDangNhap_KhachHang(?)}",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			cs.setString(1, TenDNKH);
			rs = cs.executeQuery();
			if (rs.last()) {
				soDong = rs.getRow();
				rs.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return soDong;
	}
	
	public static int kiemTraTrungEmail(String EmailKH) {
		int soDong = 0;
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_KiemTraTrungEmail_KhachHang(?)}",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			cs.setString(1, EmailKH);
			rs = cs.executeQuery();
			if (rs.last()) {
				soDong = rs.getRow();
				rs.beforeFirst();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return soDong;
	}
	public static ResultSet layToanBoDanhSachKhachHang() {
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_TruyVan_KhachHang}");
			rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/*try {
			Statement st=kn.getConnect().createStatement();
			rs=st.executeQuery("Select * from KhachHang");
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		return rs;
	}

	public static ResultSet layKhachHang_TheoMa(String MaKH) {
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall(
					"{call sp_TruyVan_KhachHang_TheoMa(?)}");
			cs.setString(1, MaKH);
			rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static boolean suaKhachHang(KHACHHANG_OBJ obj) {
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			CallableStatement cs = kn.getConnect().prepareCall(
					"{call sp_Sua_KhachHang(?, ?, ?, ?, ? ,?, ?, ?,?,?)}");
			cs.setString(1, obj.getMaKH());
			cs.setString(2, obj.getMaLoaiKH());
			cs.setString(3, obj.getTenKH());
			cs.setString(4, obj.getGioiTinhKH());
			cs.setString(5, obj.getDiaChiKH());
			cs.setString(6, obj.getSoDTKH());
			cs.setString(7, obj.getMatKhauKH());
			cs.setString(8, obj.getTrangThai());
			cs.setString(9, obj.getNgaySinhKH());
			cs.setString(10, obj.getEmailKH());
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	public static boolean Kiemtradangnhap(String taikhoan,String matkhau)
	{
		KETNOI_MOD kn = new KETNOI_MOD();
		ResultSet tt=null;
		try {
			CallableStatement cs = kn.getConnect().prepareCall(
					"{call sp_Kiemtra_Dangnhap_KHACHHANG(?, ?)}");
			cs.setString(1, taikhoan);
			cs.setString(2, matkhau);
			tt=cs.executeQuery();
			if(tt.next())
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}
	public static ResultSet ThongtinKhachhangTENDN(String tendn)
	{
		KETNOI_MOD kn = new KETNOI_MOD();
		ResultSet tt=null;
		try {
			CallableStatement cs = kn.getConnect().prepareCall(
					"{call Tim_KHACHHANG_TENDN(?)}");
			cs.setString(1, tendn);
			tt=cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tt;
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
		if(getSodong(KHACHANG_MOD.layToanBoDanhSachKhachHang())%Sobai_trang!=0)
		{
			pageCount=getSodong(KHACHANG_MOD.layToanBoDanhSachKhachHang())/Sobai_trang+1;
		}
		else
		{
			pageCount=getSodong(KHACHANG_MOD.layToanBoDanhSachKhachHang())/Sobai_trang;
		}
		return pageCount;
	}
	public static ResultSet layDanhSachTheoTrang(int Tranghientai,int Sobai_trang)//Danh sach san pham theo trang
	{
		ResultSet rs=null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_PhanTrang_KhachHang(?,?)}");
			cs.setInt(1,Tranghientai);
			cs.setInt(2, Sobai_trang);
			rs=cs.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}

	public String encryptMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) {
		KHACHANG_MOD test=new KHACHANG_MOD();
		//System.out.println(test.getSodong(KHACHANG_MOD.layToanBoDanhSachKhachHang()));
		ResultSet rs=KHACHANG_MOD.layDanhSachTheoTrang(1, 5);
		try {
			while(rs.next()){
				System.out.print(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}	
