<%@page import="Model.THONGTINCUAHANG_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Chỉnh sửa thông tin cửa hàng</title>

<jsp:include page="AdminIndex.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>

<td id="col_right">
	<h2>Chỉnh sửa thông tin sản phẩm</h2>
	<form action="../Thongtincuahang.do" method="post"
		enctype="multipart/form-data">
		<table class="TableUpdate" border="1">
			<tbody>
				<%
	    	String tencuahang="";
	    	String diachi="";
	    	String email="";
	        String sdt="";
	        	String ID=request.getParameter("ID");
        	THONGTINCUAHANG_MOD tt_mod=new THONGTINCUAHANG_MOD();
        	ResultSet tt=tt_mod.Thongtincuahang(sdt);
        	if(tt.next())
        		
        	{
				 sdt=tt.getString("sdt");
	        	tencuahang=tt.getString("tencuahang");
	        	diachi=tt.getString("diachi");
	        	email=tt.getString("email");
        	}
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
						value="<%=ID %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Tên cửa hàng:</th>
					<td><input class="text" type="text" id="tencuahang"
						name="tencuahang" value="<%=tencuahang %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td><input class="text" type="tel" id="sdt" name="sdt"
						value="<%=sdt %>" required="required"></td>
				</tr>
				<tr>
					<th>Địa chỉ:</th>
					<td><input class="text" type="text" id="email" name="diachi"
						value="<%=diachi%>"></td>
				</tr>
				<tr>
					<th>Email:</th>
					<td><input class="text" type="text" id="email" name="email"
						value="<%=email%>"></td>


				</tr>
				<tr>
					<td class="Control" colspan="2">
						<ul>
							<li><input type="submit" name="capnhat" value="Lưu lại"
								class="uupdate"></li>
							<li><a class="uback" href="Cauhinhtrangweb.jsp">Quay lại</a></li>
							<input type="hidden" name="key" value="sua">
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form>






	</body>
</html>