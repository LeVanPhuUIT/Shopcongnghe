package object;

import java.util.Date;

public class NHANVIEN_OBJ {

	private String manv;
	private String hotennv;
	private String ngaysinhnv;
	private String gioitinhnv;
	private String diachinv;
	private String sodtnv;
	private String tendnnv;
	private String matkhau;
	public String getmanv()
	{
		return manv;
	}
	public void setmanv(String manv)
	{
		this.manv=manv;
	}
	public String gethotennv()
	{
		return hotennv;
	}
	public void sethotennv(String hotennv)
	{
		this.hotennv=hotennv;
	}
	public String getngaysinhnv()
	{
		return ngaysinhnv;
	}
	public void setngaysinhnv(String ngaysinhnv)
	{
		this.ngaysinhnv=ngaysinhnv;
	}
	public String getgioitinhnv()
	{
		return gioitinhnv;
	}
	public void setgioitinhnv(String gioitinhnv)
	{
		this.gioitinhnv=gioitinhnv;
	}
	public String getdiachinv()
	{
		return diachinv;
	}
	public void setdiachinv(String diachinv)
	{
		this.diachinv=diachinv;
	}
	public String getsodtnv()
	{
		return sodtnv;
	}
	public void setsodtnv(String sodtnv)
	{
		this.sodtnv=sodtnv;
	}
	public String gettendnnv()
	{
		return tendnnv;
	}
	public void settendnnv(String tendnnv)
	{
		this.tendnnv=tendnnv;
	}
	public String getmatkhau()
	{
		return matkhau;
	}
	public void setmatkhaunv(String matkhau)
	{
		this.matkhau=matkhau;
	}
	public NHANVIEN_OBJ()
	{
		super();
	}
	public NHANVIEN_OBJ(String manv,String hotennv,String ngaysinhnv,String gioitinhnv,String diachinv,String sodtnv,String tendnnv,String matkhau)
	{
		this.manv=manv;
		this.hotennv=hotennv;
		this.ngaysinhnv=ngaysinhnv;
		this.gioitinhnv=gioitinhnv;
		this.diachinv=diachinv;
		this.sodtnv=sodtnv;
		this.tendnnv=tendnnv;
		this.matkhau=matkhau;
	}
}
