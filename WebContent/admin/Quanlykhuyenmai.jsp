<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.KHUYENMAI_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý khuyến mãi</title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Quản lý khuyến mãi</h2>

	<form action="" method="post" novalidate="novalidate">
		<div class="clearfix"></div>
		<div class="Control">
			<ul>
				<li><a class="vadd" href="Themkhuyenmai.jsp">Thêm</a></li>
				<li><a class="vrefresh" href="Quanlykhuyenmai.jsp">Refesh</a></li>
			</ul>
		</div>
	</form>

	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã khuyến mãi</th>
				<th class="Text">Tên Sản phẩm</th>
				<th class="Text">Ngày bắt đầu</th>
				<th class="Text">Ngày kết thúc</th>
				<th class="Text">Giá khuyến mãi</th>
				<th class="Function">Chức năng</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							KHUYENMAI_MOD khuyenmai_mod=new KHUYENMAI_MOD();
            							ResultSet ttKm=khuyenmai_mod.ThongtinKhuyenmai();
            							if(ttKm!=null)
            							{
            								while(ttKm.next())
            								{
            									String makm=ttKm.getString(1);
            									String tensp=ttKm.getString(2);
            									String ngaybatdau=ttKm.getString(3);
            									String ngayketthuc=ttKm.getString(4);
            									int giakm=ttKm.getInt(5);
            									%>


			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=makm %></td>
				<td class="Text"><%=tensp %></td>
				<td class="DateTimesmal"><%=ngaybatdau %></td>
				<td class="DateTimesmal"><%=ngayketthuc %></td>
				<td class="Text"><fmt:formatNumber value="<%=giakm %>" minFractionDigits="0"/>đ</td>
				
				<td class="Function"><strong> 
				<a class="vedit"
						href="Suakhuyenmai.jsp?makm=<%=makm %>"
						title="Chỉnh sửa">
				</a> 
				<a href="Suakhuyenmai.jsp?makm=<%=makm %>" style="color:blue;">Sửa</a>
						<input type="hidden" value="xoa" name="key">
				<a class="vdelete"
						href="../Khuyenmai.do?makm=<%=makm %>" title="Xóa"
						onclick="DeleteConfirm()"></a>
				<a href="../Khuyenmai.do?makm=<%=makm %>" style="color:red;" onclick="DeleteConfirm()">Xóa</a>						
				</strong></td>
			</tr>
			<%
            								}
            							}
            						%>
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