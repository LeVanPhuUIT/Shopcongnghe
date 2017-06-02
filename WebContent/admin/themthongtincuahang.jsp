<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.THONGTINCUAHANG_MOD"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thêm mới Thông tin cửa hàng</title>



<jsp:include page="AdminIndex.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/combodate.js"></script>

<td id="col_right">
	<h2>Thêm mới thông tin cửa hàng</h2>
	<form action="../Thongtincuahang.do" method="post"
		enctype="multipart/form-data">
		<table class="TableUpdate" border="1">
			<tbody>
				<%
        	THONGTINCUAHANG_MOD ttch_mod=new THONGTINCUAHANG_MOD();
        	
        	ResultSet dstt=ttch_mod.TatcaThongtin();
        %>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>ID:</th>
					<td><input class="text" type="text" id="ID" name="ID"
						value="<% out.print(ttch_mod.Taoid()); %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>Tên cửa hàng:</th>
					<td><input class="text" type="text" id="tencuahang"
						name="tencuahang" value="" required="required"></td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td><input class="text" type="tel" id="sdt" name="sdt"
						value="" required="required"></td>
				</tr>
				<tr>
					<th>Địa chỉ:</th>
					<td><input class="text" type="text" id="diachi" name="diachi"
						required="required"></td>
				</tr>
				<tr>

					<th>Email:</th>
					<td><input type="email" id="email" name="email" class="text"
						required="required"></td>
				</tr>

				<td class="Control" colspan="4">
					<ul>
						<li><input type="submit" name="them" value="Thêm mới"
							class="uupdate"></li>
						<li><input type="reset" name="lamlai" value="Làm lại"
							class="vrefresh"></li>

						<li><a class="uback" href="Cauhinhtrangweb.jsp">Quay lại</a></li>
						<input type="hidden" name="key" value="them">
					</ul>
				</td>
				</tr>
			</tbody>
		</table>
	</form> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>

	</body>
</html>