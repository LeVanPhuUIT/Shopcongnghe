package object;

public class KHACHHANG_OBJ {
	private String MaKH;
	private String MaLoaiKH;
	private String TenKH;
	private String GioiTinhKH;
	private String DiaChiKH;
	private String SoDTKH;
	private String TenDNKH;
	private String MatKhauKH;
	private String TrangThai;
	private int DiemMuaHang;
	private String NgaySinhKH;
	private String EmailKH;
	public String getMaKH() {
		return MaKH;
	}
	public void setMaKH(String maKH) {
		MaKH = maKH;
	}
	public String getMaLoaiKH() {
		return MaLoaiKH;
	}
	public void setMaLoaiKH(String maLoaiKH) {
		MaLoaiKH = maLoaiKH;
	}
	public String getTenKH() {
		return TenKH;
	}
	public void setTenKH(String tenKH) {
		TenKH = tenKH;
	}
	public String getGioiTinhKH() {
		return GioiTinhKH;
	}
	public void setGioiTinhKH(String gioiTinhKH) {
		GioiTinhKH = gioiTinhKH;
	}
	public String getDiaChiKH() {
		return DiaChiKH;
	}
	public void setDiaChiKH(String diaChiKH) {
		DiaChiKH = diaChiKH;
	}
	public String getSoDTKH() {
		return SoDTKH;
	}
	public void setSoDTKH(String soDTKH) {
		SoDTKH = soDTKH;
	}
	public String getTenDNKH() {
		return TenDNKH;
	}
	public void setTenDNKH(String tenDNKH) {
		TenDNKH = tenDNKH;
	}
	public String getMatKhauKH() {
		return MatKhauKH;
	}
	public void setMatKhauKH(String matKhauKH) {
		MatKhauKH = matKhauKH;
	}
	public String getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(String trangThai) {
		TrangThai = trangThai;
	}
	public int getDiemMuaHang() {
		return DiemMuaHang;
	}
	public void setDiemMuaHang(int diemMuaHang) {
		DiemMuaHang = diemMuaHang;
	}
	public String getEmailKH() {
		return EmailKH;
	}
	public void setEmailKH(String emailKH) {
		EmailKH = emailKH;
	}
	
	public String getNgaySinhKH() {
		return NgaySinhKH;
	}
	public void setNgaySinhKH(String ngaySinhKH) {
		NgaySinhKH = ngaySinhKH;
	}
	public KHACHHANG_OBJ()
	{
		super();
	}
	public KHACHHANG_OBJ(String maKH, String maLoaiKH, String tenKH,
			String gioiTinhKH, String diaChiKH, String soDTKH, String tenDNKH,
			String matKhauKH, String ngaySinhKH, String emailKH) {
		super();
		MaKH = maKH;
		MaLoaiKH = maLoaiKH;
		TenKH = tenKH;
		GioiTinhKH = gioiTinhKH;
		DiaChiKH = diaChiKH;
		SoDTKH = soDTKH;
		TenDNKH = tenDNKH;
		MatKhauKH = matKhauKH;
		NgaySinhKH=ngaySinhKH;
		EmailKH=emailKH;
	}
	public KHACHHANG_OBJ(String maKH, String maLoaiKH, String tenKH,
			String gioiTinhKH, String diaChiKH, String soDTKH, String tenDNKH,
			String matKhauKH, String conQuanLy, String ngaySinhKH, String emailKH) {
		super();
		MaKH = maKH;
		MaLoaiKH = maLoaiKH;
		TenKH = tenKH;
		GioiTinhKH = gioiTinhKH;
		DiaChiKH = diaChiKH;
		SoDTKH = soDTKH;
		TenDNKH = tenDNKH;
		MatKhauKH = matKhauKH;
		TrangThai=conQuanLy;
		NgaySinhKH=ngaySinhKH;
		EmailKH=emailKH;
	}
	
}
