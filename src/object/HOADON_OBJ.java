package object;

import java.sql.Date;

public class HOADON_OBJ {
	private String MaHD;
	private String MaNv;
	private Date NgayHd;
	private float TongtienHd;
	public String getMaHD() {
		return MaHD;
	}
	public void setMaHD(String maHD) {
		MaHD = maHD;
	}
	public String getMaNv() {
		return MaNv;
	}
	public void setMaNv(String maNv) {
		MaNv = maNv;
	}
	public Date getNgayHd() {
		return NgayHd;
	}
	public void setNgayHd(Date ngayHd) {
		NgayHd = ngayHd;
	}
	public Float getTongtienHd() {
		return TongtienHd;
	}
	public void setTongtienHd(Float tongtienHd) {
		TongtienHd = tongtienHd;
	}
	
}
