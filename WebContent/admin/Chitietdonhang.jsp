<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.DONDATHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết đơn hàng</title>
<jsp:include page="AdminIndex.jsp" />
<%  
	String Madh=request.getParameter("madh");
	DONDATHANG_MOD dondathang_mod=new DONDATHANG_MOD();
	ResultSet ttKH=dondathang_mod.Chitietdonhang(Madh);
	String hoten="";
	String ngaydat="";
	String sdt="";
	String diachi="";
	if(ttKH.next())
	{
		hoten=ttKH.getString("HOTEN");
		ngaydat=ttKH.getString("DD/MM/YYYY");
		sdt=ttKH.getString("DIENTHOAI");
		diachi=ttKH.getString("DIACHI");
	}
%>
<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>1. Thông tin người mua hàng</h2>
	<table class="TableView" border="1" id="ttKH">
		<tbody>
			<tr class="trOdd">
				<td class="Text"><b>Họ tên : <%=hoten %></b></td>
				<td class="Text"><b>Điện thoại : <%=sdt %></b></td>
			</tr>
			<tr class="trOdd">
				<td class="Text"><b>Ngày đặt hàng :<%=ngaydat %></b></td>
				<td class="Text"><b>Địa chỉ: <%=diachi %></b></td>
			</tr>
		</tbody>
	</table>
	<h2>2. Thông tin đơn hàng</h2>
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
            							
            							ResultSet ttDH=null;
            							dondathang_mod=new DONDATHANG_MOD();
            							ttDH=dondathang_mod.Chitietdonhang(Madh);
            							int trigia=0;
            							if(ttDH!=null)
            							{
            								while(ttDH.next())
            								{
            									String masp=ttDH.getString("MASP");
            									String tensp=ttDH.getString("TENSP");
            									int soluong=ttDH.getInt("SOLUONG");
            									int dongia=ttDH.getInt("GIASP");
            									int thanhtien=ttDH.getInt("THANHTIEN");
            									trigia=ttDH.getInt("TONGTIEN");
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=masp %></td>
				<td class="Text"><%=tensp %></td>
				<td class="Text"><%=soluong %></td>
				<td class="Text"><%=dongia %> Vnd</td>
				<td class="Text"><%=thanhtien %> Vnd</td>
			</tr>
			<%
		            								}
		            							}
						                    %>
			<tr class="trOdd">
				<td class="Text" colspan="4"><b>Số tiền thanh toán :</b></td>
				<td class="Text"><b> <%=trigia %> Vnd
				</b></td>
			</tr>
			<tr>
				<td class="Control" colspan="5">
					<ul>

						<li><a class="print" target="_blank"
							href="../Inbaocao.do?madh=<%=Madh %>&id=1" title="In đơn hàng">In đơn hàng</a></li>
						<li><a class="uback" href="Quanlydonhang.jsp"
							title="Quay lại">Quay lại</a></li>
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