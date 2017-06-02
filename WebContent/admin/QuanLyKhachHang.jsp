<%@page import="Model.KHACHANG_MOD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="Model.KETNOI_MOD"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quản lý khách hàng</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<script src="js/jquery.js"></script>
<style type="text/css">
.phantrang {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="AdminIndex.jsp" />
	<td id="col_right">
		<h2>Quản lý khách hàng</h2>
		<form action="../KHACHHANG_CTR" method="get" novalidate="novalidate">
			<div class="TopSearch">
				<lable for="srch" class="lablesearch"> Tìm kiếm</lable>
				<ul>
					<li><input id="txtTu" name="txtTu"
						style="width: 200px; height: 20px; border-radius: 3px"
						placeholder="Nhập tên hoặc mã khách hàng"></li>
				</ul>
				<input type="submit" value="Tìm" id="hanhdong" name="hanhdong"
					style="background-color: #dccee8; border-radius: 8px; height: 20px">
				<input type="submit" value="Tắt tìm kiếm" id="hanhdong"
					name="hanhdong"
					style="background-color: #dccee8; border-radius: 8px; height: 20px">
				<div class="clearfix"></div>
			</div>
		</form>
		<form action="" method="post" novalidate="novalidate">
			<div class="clearfix"></div>
			<div class="Control">
				<ul>
					<li><a class="vadd" href="ThemKhachHang.jsp">Thêm</a></li>
					<li><a class="vrefresh" href="QuanLyKhachHang.jsp">Refesh</a></li>
				</ul>
			</div>
		</form>
		<table class="TableView" border="1" id="myTable">
			<tbody>
				<tr class="trHeader">
					<th class="CheckBoxsmall">Mã khách hàng</th>
					<th class="CheckBoxsmall">Loại khách hàng</th>
					<th class="Image">Tên khách hàng</th>
					<th class="Image">Giới tính</th>
					<th class="CheckBoxsmall">Ngày sinh</th>
					<th class="Image">Email</th>
					<th class="CheckBoxsmall">Địa chỉ</th>
					<th class="Image">Số điện thoại</th>
					<th class="Image">Tên đăng nhập</th>
<!-- 					<th class="Image">Mật khẩu</th>
 -->					<th class="Image">Điểm mua hàng</th>
					<th class="Image">Trạng thái</th>
					<th class="Function">Chức năng</th>
				</tr>
			</tbody>
			<tbody>
				<%
						ResultSet rs = null;
					
						if (request.getParameter("hanhdong") != null
								&& request.getParameter("hanhdong").equals("timkiem")) {
							request.setCharacterEncoding("UTF-8");
							rs = KHACHANG_MOD.timKhachHang(request.getParameter("tukhoa"));
						} else {
							String pageNum =request.getParameter("page");
						  	int Page=1;
						  	if(pageNum!=null)
						  	{
						  		Page=Integer.parseInt(pageNum);
						  	}
						  	rs=KHACHANG_MOD.layDanhSachTheoTrang(Page, 5);
						}
						while (rs.next()) {
					%>
				<tr class="trOdd">
					<td class="CheckBoxsmall"><%=rs.getString("MaKH")%></td>
					<td class="Image"><%=rs.getString("MaLoaiKH")%></td>
					<td class="Text"><%=rs.getString("TenKH")%></td>
					<td class="Image"><%=rs.getString("GioiTinhKH").equals("1") ? "Nam" : "Nữ"%></td>
					<td class="CheckBoxsmall"><%=rs.getString("NgaySinhKH")%></td>
					<td class="CheckBoxsmall"><%=rs.getString("EmailKH")%></td>
					<td class="Text"><%=rs.getString("DiaChiKH")%></td>
					<td class="CheckBoxsmall"><%=rs.getString("SoDTKH")%></td>
					<td class="CheckBoxsmall"><%=rs.getString("TenDNKH")%></td>
<%-- 					<td class="CheckBoxsmall"><%=rs.getString("MatKhauKH")%></td>
 --%>					<td class="CheckBoxsmall"><%=rs.getInt("DiemMuaHang")%></td>
					<td class="Text"><%=rs.getString("TrangThai").equals("0") ? "Không còn quản lý"
						: "Còn quản lý"%></td>
					<td class="Function"><strong> <%String makh=rs.getString("MaKH");%>
							<a class="vedit" href="SuaKhachHang.jsp?makh=<%=makh %>"
							title="Chỉnh sửa"></a> <input type="hidden" value="xoa"
							name="key"> <a class="vdelete"
							href="../KHACHHANG_CTR?hanhdong=Xóa&makh=<%=makh %>" title="Xóa"
							onclick="return DeleteConfirm();"></a>
					</strong></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div class="pagingContainer">
			<b color="white">Trang : </b>
			<%
	                int pageCurent=0;
	                if(request.getParameter("page")==null){
	                	pageCurent=1;
	                }
	                else{
	                	pageCurent=Integer.parseInt(request.getParameter("page"));
	                }
                	KHACHANG_MOD kh=new KHACHANG_MOD();
	                int n=kh.tinhSotrang(5);
	                for(int i=1;i<=n;i++)
	                {
	                	if(i==pageCurent)
	                	{
		                	%>
			<a href="../KHACHHANG_CTR?page=<%=i %>&hanhdong=phantrang"><b
				class="phantrang"><%=i %></b></a>
			<%
	                	}
	                	else{
	                		%>
			<a href="../KHACHHANG_CTR?page=<%=i %>&hanhdong=phantrang"><b><%=i %></b></a>
			<%
	                	}
	                }
                %>
		</div>
	</td>
	<script type="text/javascript">
				    function DeleteConfirm() {
				
				        return (confirm("Bạn có chắc chắn muốn xóa?"));
				    }

    </script>
</body>
</html>