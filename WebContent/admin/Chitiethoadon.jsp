<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.HOADON_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết hóa đơn</title>
<jsp:include page="AdminIndex.jsp" />
<%  
	String Mahd=request.getParameter("mahd");
		HOADON_MOD hoadon_mod=new HOADON_MOD();
	ResultSet ttKH=hoadon_mod.Chitiethoadon(Mahd);
	String tenkh="";
	String tennv="";
	String ngayhd="";
	String sdt="";
	String diachi="";
	String loaikh="";
	int trigia=0;
	if(ttKH.next())
	{
		tenkh=ttKH.getString("TENKH");
		loaikh=ttKH.getString("TENLOAIKH");
		tennv=ttKH.getString("HOTENNV");
		ngayhd=ttKH.getString("DD/MM/YYYY");
		sdt=ttKH.getString("SODTKH");
		diachi=ttKH.getString("DIACHIKH");
		trigia=ttKH.getInt("TONGTIENHD");
	}
%>
<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>1. Thông tin mua hàng</h2>
	<table class="TableView" border="1" id="ttKH">
		<tbody>
			<tr class="trOdd">
				<td class="Text"><b>Họ tên : <%=tenkh %></b></td>
				<td class="Text"><b>Loại khách hàng : <%=loaikh %></b></td>
				<td class="Text"><b>Điện thoại : <%=sdt %></b></td>
			</tr>
			<tr class="trOdd">
				<td class="Text"><b>Nhân viên bán hàng :<%=tennv %></b></td>
				<td class="Text"><b>Ngày hóa đơn :<%=ngayhd %></b></td>
				<td class="Text"><b>Địa chỉ: <%=diachi %></b></td>
			</tr>
		</tbody>
	</table>
	<h2>2. Thông tin hóa đơn</h2>
	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã sản phẩm</th>
				<th class="Text">Tên Sản phẩm</th>
				<th class="Text">Số lượng</th>
				<th class="Text">Đơn giá</th>
				<th class="Text">Thành tiền</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							
            							ResultSet ttHD=null;
            							ttHD=hoadon_mod.Chitiethoadon(Mahd);
            							if(ttHD!=null)
            							{
            								while(ttHD.next())
            								{
            									String masp=ttHD.getString("MASP");
            									String tensp=ttHD.getString("TENSP");
            									int soluong=ttHD.getInt("SOLUONG");
            									int dongia=ttHD.getInt("GIASP");
            									int thanhtien=ttHD.getInt("THANHTIEN");
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=masp %></td>
				<td class="Text"><%=tensp %></td>
				<td class="Text"><%=soluong %></td>
				<td class="Text"><%=dongia %> Vnd</td>
				<td class="Text"><fmt:formatNumber value="<%=thanhtien %>" minFractionDigits="0"/> đ</td>
			</tr>
			<%
		            								}
		            							}
						                    %>
			<tr class="trOdd">
				<td class="Text" colspan="4"><b>Số tiền thanh toán :</b></td>
				<td class="Text"><b><fmt:formatNumber value="<%=trigia %>" minFractionDigits="0"/> đ
				</b></td>
			</tr>
			<tr>
				<td class="Control" colspan="5">
					<ul>

						<li><a class="print"
							href="../Inbaocao.do?mahd=<%=Mahd %>&id=6" title="In Hóa đơn" target="_blank">In
								hóa đơn</a></li>
						<li><a class="uback" href="Quanlyhoadon.jsp" title="Quay lại">Quay
								lại</a></li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	</div> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>
	</body>
</html>

</body>
</html>