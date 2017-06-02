<%@page import="Model.NHANVIEN_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Quản lý nhân viên</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<script src="js/jquery.js"></script>
</head>
<body>
	<jsp:include page="AdminIndex.jsp" />
	<td id="col_right">
		<h2>Quản lý nhân viên</h2>
		<form action="../NHANVIEN_CTR" method="get">
			<div class="TopSearch">
				<lable for="srch" class="lablesearch"> Tìm kiếm</lable>
				<ul>
					<li><input id="txttukhoa" name="txttukhoa"
						style="width: 200px; height: 20px; border-radius: 3px"
						placeholder="Nhập tên hoặc mã nhân viên"></li>
				</ul>
				<!-- value=1: Tìm -->
				<input type="submit" value="Tìm" id="hanhdong" name="hanhdong"
					style="background-color: #a1c4fa; border-radius: 8px; height: 20px">
				<!-- value=2: Tắt tìm kiếm -->
				<input type="submit" value="Tắt tìm kiếm" id="hanhdong"
					name="hanhdong"
					style="background-color: #a1c4fa; border-radius: 8px; height: 20px">
				<div class="clearfix"></div>
			</div>
		</form>
		<form action="" method="post" novalidate="novalidate">
			<div class="clearfix"></div>
			<div class="Control">
				<ul>
					<li><a class="vadd" href="NhanVienThemMoi.jsp">Thêm</a></li>
					<li><a class="vrefresh" href="NhanVienQuanLy.jsp">Refesh</a></li>
				</ul>
			</div>
		</form> <%-- <table class="demo">
			<tbody>
				<tr>
					<th>Mã nhân viên</th>
					<th>Họ tên</th>
					<th>Ngày sinh</th>
					<th>Giới tính</th>
					<th>Địa chỉ</th>
					<th>Số điện thoại</th>
					<th>Tên đăng nhập</th>
					<th>Mật khẩu</th>
					<th>Chức năng</th>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<%
						ResultSet rs = null;
						if (request.getParameter("hanhdong") != null
								&& request.getParameter("hanhdong").equals("timkiem")) {
							rs = NHANVIEN_MOD.TimNhanVienTheoMaNV(request.getParameter("tukhoa"));
						} else {
							rs = NHANVIEN_MOD.ThongTinNhanVien();
						}
						while (rs.next()) {
					%>
					<td><%=rs.getString("manv")%></td>
					<td><%=rs.getString("hotennv")%></td>
					<td><%=rs.getString("ngaysinhnv")%></td>
					<td><%=rs.getString("gioitinhnv").equals("1") ? "Nam" : "Nữ"%></td>
					<td><%=rs.getString("diachinv")%></td>
					<td><%=rs.getString("sodtnv")%></td>
					<td><%=rs.getString("tendnnv")%></td>
					<td><%=rs.getString("matkhaunv")%></td>
					<td>
						<form action="../NHANVIEN_CTR" method="get">
							<input type="text" id="manv" name="manv" value=<%=rs.getString("manv")%> style="display:none">
							<input
								type="submit" value="Sua" id="hanhdong" name="hanhdong"
								style="background-color: #a1c4fa; border-radius: 8px; height: 20px">
							<input
								type="submit" value="Xoa" id="hanhdong" name="hanhdong"
								style="background-color: #a1c4fa; border-radius: 8px; height: 20px">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table> --%>
		<table class="TableView" border="1" id="myTable">
			<tbody>
				<tr class="trHeader">
					<th class="CheckBoxsmall">Mã nhân viên</th>
					<th class="CheckBoxsmall">Họ tên</th>
					<th class="Image">Ngày sinh</th>
					<th class="Image">Giới tính</th>
					<th class="Image">Địa chỉ</th>
					<th class="Image">Số điện thoại</th>
					<th class="Image">Tên đăng nhập</th>
					<!-- <th class="Image">Mật khẩu</th> -->
					<th class="Function">Lựa chọn Thao tác</th>
				</tr>
			</tbody>
			<tbody>
				<%
						ResultSet rs = null;
						if (request.getParameter("hanhdong") != null
								&& request.getParameter("hanhdong").equals("timkiem")) {
							rs = NHANVIEN_MOD.TimNhanVienTheoMaNV(request.getParameter("tukhoa"));
						} else {
							rs = NHANVIEN_MOD.ThongTinNhanVien();
						}
						if(rs!=null)
						while (rs.next()) {
					%>
				<tr class="trOdd">
					<td class="CheckBoxsmall"><%=rs.getString(1)%></td>
					<td class="Text"><%=rs.getString(2)%></td>
					<td class="CheckBoxsmall"><%=rs.getString(3)%></td>
					<td class="CheckBoxsmall"><%=rs.getString(4).equals("1") ? "Nam" : "Nữ"%></td>
					<td class="Text"><%=rs.getString(5)%></td>
					<td class="CheckBoxsmall"><%=rs.getString(6)%></td>
					<td class="CheckBoxsmall"><%=rs.getString(7)%></td>
					<%-- <td class="CheckBoxsmall"><%=rs.getString(8)%></td> --%>
					<td class="Text">
						<form action="../NHANVIEN_CTR" method="get">
							<input type="text" id="manv" name="manv"
								value=<%=rs.getString(1)%> style="display: none">
							<!-- value=3: Sửa -->
							<input type="submit" value="Sửa" id="hanhdong" name="hanhdong"
								class="vedit" title="Chỉnh sửa" style ="color:blue">
							<!-- value=4: Xóa -->
							<input style ="color:red" type="submit" value="Xóa" id="hanhdong" name="hanhdong"
								class="vdelete" title="Xóa" onclick="return DeleteConfirm();">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</td>
	<script type="text/javascript">
				    function DeleteConfirm() {
				
				        return (confirm("Bạn có chắc chắn muốn xóa?"));
				    }

    </script>
</body>
</html>