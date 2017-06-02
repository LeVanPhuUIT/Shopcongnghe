package Model;

import java.util.ArrayList;

import object.MONHANG_OBJ;

public class GIOHANG_MOD {
	private ArrayList<MONHANG_OBJ> giohang;
	public GIOHANG_MOD()
	{
		giohang=new ArrayList();
	}
	public void themMonhang(MONHANG_OBJ monhang)
	{
		MONHANG_OBJ monhang_obj=timMonhang(monhang.getMasp());
		if(monhang_obj!=null)
		{
			monhang_obj.setSoluong(monhang_obj.getSoluong()+monhang.getSoluong());
		}
		else
		{
			giohang.add(monhang);
		}
		
	}
	public void xoaMonhang(String masp)
	{
		MONHANG_OBJ monhang=timMonhang(masp);
		if(monhang!=null)
		{
			giohang.remove(monhang);
		}
	}
	public int Tongtien()
	{
		int Tongtien=0;
		for(int i=0;i<giohang.size();i++)
		{
			Tongtien+=giohang.get(i).thanhTien();
		}
		return Tongtien;
	}
	public int SoluongMonhang()
	{
		return giohang.size();
	}
	public ArrayList<MONHANG_OBJ> getGiohang()
	{
		return giohang;
	}
	public MONHANG_OBJ timMonhang(String masp)
	{
		for(int i=0;i<giohang.size();i++)
		{
			if(giohang.get(i).getMasp().equals(masp))
				return giohang.get(i);
		}
		return null;
	}
}
