<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách hàng tồn kho</title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Danh sách hàng tồn kho</h2>
	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã sản phẩm</th>
				<th class="Text">Tên Sản phẩm</th>
				<th class="Text">Số lượng tồn</th>
				<th class="Text">Giá (VND)</th>
				<th class="Text">Thành tiền (VND)</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							ResultSet dsSP=null;
            							SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
            							dsSP=sanpham_mod.Thongkehangton();
            							if(dsSP!=null)
            							{
            								while(dsSP.next())
            								{
            									String masp=dsSP.getString("MASP");
            									String tensp=dsSP.getString("TENSP");
            									int gia=dsSP.getInt("GIASP");
            									long thanhtien=dsSP.getLong("THANHTIEN");
            									int Soluongton=dsSP.getInt("SOLUONG");
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=masp %></td>
				<td class="Text"><%=tensp %></td>
				<td class="Text"><%=Soluongton %></td>
				<td class="Text"><fmt:formatNumber value="<%=gia %>" minFractionDigits="0"/> đ</td>
				<td class="Text"><fmt:formatNumber value="<%=thanhtien %>" minFractionDigits="0"/> đ</td>

			</tr>
			<%
		            								}
		            							}
						                    %>
			<tr>
			<tr class="trOdd">
				<td class="Text"><b>Tổng</b></td>
				<td class="Text"><b>Tổng số lượng</b></td>
				<td class="Text"><b><fmt:formatNumber value="<%=sanpham_mod.LaySoluong() %>" minFractionDigits="0"/></b></td>
				<td class="Text"><b>Tổng trị giá</b></td>
				<td class="Text"><b><fmt:formatNumber value="<%=sanpham_mod.Laytrigia() %>" minFractionDigits="0"/> đ</b></td>
			</tr>
			<td class="Control" colspan="3">
				<ul>
					<li><b> Chức năng :</b></li>
					<li><a class="print" href="../Inbaocao.do?&id=5"
						title="In Thống kê" target="_blank"></a>In thống kê</li>
					<li><a class="uback" href="Thongkehangton.jsp"
						title="Quay lại"></a>Quay lại</li>
				</ul>
			</td>
			</tr>
		</tbody>
		</td>
		</tr>
	</table>
	</div>
	</div> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script> <script type="text/javascript">
    function DeleteConfirm() {

        if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?"))
            return true;
        else
            return false;
    }

    </script>
	</body>
</html>

</body>
</html>