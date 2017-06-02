package object;

public class MONHANG_OBJ {
	private String masp;
	private String tensp;
	private int giasp;
	private int soluong;
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public int getGiasp() {
		return giasp;
	}
	public void setGiasp(int giasp) {
		this.giasp = giasp;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public int thanhTien()
	{
		return giasp*soluong;
	}
	
}
