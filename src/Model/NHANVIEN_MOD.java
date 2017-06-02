package Model;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import object.NHANVIEN_OBJ;
import object.SANPHAM_OBJ;

public class NHANVIEN_MOD {
	private Connection cnn=null;
	private KETNOI_MOD c;
	public NHANVIEN_MOD()
	{
		c=new KETNOI_MOD();
		cnn=c.getConnect();
	}
	public static ResultSet ThongTinNhanVien() //Lay thong tin nhan vien
	{
		ResultSet rs=null;
		CallableStatement cs;
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			cs = kn.getConnect().prepareCall("{ call sp_NhanVienThongTin}");
			rs=cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static ResultSet TimNhanVienTheoMaNV(String tukhoa) //Tim kiem nhan vien theo ma nhan vien
	{
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_NhanVienTimKiemMaNV(?)}");
			cs.setString(1, tukhoa);
			rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet TimNhanVienTheoHotenNV(String tukhoa) //Tim kiem nhan vien theo ho ten nhan vien
	{
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_NhanVienTimKiemHoTenNV(?)}");
			cs.setString(1, tukhoa);
			rs = cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static boolean ThemNhanVien(NHANVIEN_OBJ nv) // Them nhan vien
	{
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs=kn.getConnect().prepareCall("{ call sp_NhanVienThemMoi(?,?,?,?,?,?,?,?)}");
			cs.setString(1,nv.getmanv());
			cs.setString(2,nv.gethotennv());
			cs.setString(3,nv.getngaysinhnv());
			cs.setString(4,nv.getgioitinhnv());
			cs.setString(5,nv.getdiachinv());
			cs.setString(6,nv.getsodtnv());
			cs.setString(7,nv.gettendnnv());
			cs.setString(8,nv.getmatkhau());
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	public static boolean XoaNhanVien(String manv) // Xoa nhan vien
	{
		boolean kq = false;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_NhanVienXoa(?)}");
			cs.setString(1, manv);
			cs.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kq;
	}
	public static boolean CapNhatNhanVien(NHANVIEN_OBJ nv_obj) // Cap nhat nhan vien
	{
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			CallableStatement cs = kn.getConnect().prepareCall("{call sp_NhanVienCapNhat(?,?,?,?,?,?,?,?)}");
			cs.setString(1, nv_obj.getmanv());
			cs.setString(2, nv_obj.gethotennv());
			cs.setString(3, nv_obj.getngaysinhnv());
			cs.setString(4, nv_obj.getgioitinhnv());
			cs.setString(5, nv_obj.getdiachinv());
			cs.setString(6, nv_obj.getsodtnv());
			cs.setString(7, nv_obj.gettendnnv());
			cs.setString(8, nv_obj.getmatkhau());
			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	public static String TaomaNV() // Tao ma nhan vien
	{
		ResultSet rs;
		String manv = "";
		KETNOI_MOD kn = new KETNOI_MOD();
		try {
			rs=ThongTinNhanVien();
			if(rs!=null)
			{
					int max=0;
					int matam1=0;
						while(rs.next())
						{
							
							matam1=Integer.parseInt(rs.getString(1).substring(2));
							if(matam1>max)
								max=matam1;
						}
						max=max+100000+1;
						String matam2="";
						matam2=Integer.toString(max);
						matam2=matam2.substring(1);
						manv="NV"+matam2;
			}
			else
			{	
				manv="NV00001";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manv;
	}
	public boolean Kiemtra(String Taikhoan,String Matkhau)//Kiem tra dang nhap
	{
		CallableStatement cs;
		ResultSet rs=null;
		try {
			cs = cnn.prepareCall("{ call sp_KiemtraDangnhap(?,?)}");
			cs.setString(1, Taikhoan);
			cs.setString(2, Matkhau);
			rs=cs.executeQuery();
			if(rs.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public String LayTenNV(String Taikhoan,String Matkhau)//Lay ten nhan vien
	{
		String hoten="";
		CallableStatement cs;
		ResultSet rs=null;
		try {
			cs = cnn.prepareCall("{ call sp_KiemtraDangnhap(?,?)}");
			cs.setString(1, Taikhoan);
			cs.setString(2, Matkhau);
			rs=cs.executeQuery();
			if(rs.next())
				hoten=rs.getString("HOTENNV");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hoten;
		
	}
	public String LayMaNV(String Taikhoan,String Matkhau)//Lay ma nhan vien
	{
		String MaNV="";
		CallableStatement cs;
		ResultSet rs=null;
		try {
			cs = cnn.prepareCall("{ call sp_KiemtraDangnhap(?,?)}");
			cs.setString(1, Taikhoan);
			cs.setString(2, Matkhau);
			rs=cs.executeQuery();
			if(rs.next())
				MaNV=rs.getString("MANV");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MaNV;
		
	}
	public boolean kiemTraTrungTenDangNhap(String tendnnv) {
		boolean check=true;
		ResultSet rs = null;
		KETNOI_MOD kn = new KETNOI_MOD();
		CallableStatement cs;
		try {
			cs = kn.getConnect().prepareCall("{call sp_NhanVienKiemTraTrungTenDangNhap(?)}");
			cs.setString(1, tendnnv);
			rs = cs.executeQuery();
			if (rs.next()) {
				check=false;
			}
			else
				check=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	
	 
	public static void main(String[] args) {
		NHANVIEN_MOD nv=new NHANVIEN_MOD();
		if(nv.kiemTraTrungTenDangNhap("admin")==false)
		{
			System.out.print("Trung");
		}
		else{
			System.out.print("Khong trung");
		}
	}
}
