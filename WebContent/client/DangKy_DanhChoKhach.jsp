<%@page import="Model.KHACHANG_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng ký tài khoản cho khách hàng</title>
<script src="jquery.js"></script>
<script src="moment.min.js"></script>
<script src="combodate.js"></script>
<link rel="stylesheet" type="text/css"
	href="CSS_DangKy_DanhChoKhach.css">
</head>
<body>
	<h2>Tạo tài khoản của bạn</h2>
	<form method="get" action="../KHACHHANG_CTR">
		<div class="khungchua">
			<div class="cottrai" style="display: none">Mã khách hàng</div>
			<%	
				String maKH = KHACHANG_MOD.taoMaKhachHang();
			%>
			<div class="cotphai" style="display: none">
				<input id="txtMaKH" class="cotphai_input" type="text" name="txtMaKH"
					value=<%=maKH%> readonly="readonly">
			</div>
			<select id="optMaLoaiKH" class="cotphai_input" name="optMaLoaiKH"
				style="display: none">
				<option value="LKH1"></option>
			</select>
			<div class="cottrai">Họ tên đầy đủ</div>
			<div class="cotphai">
				<input id="txtTenKH" class="cotphai_input" type="text"
					name="txtTenKH">
			</div>
			<div class="cottrai">Giới tính</div>
			<div class="cotphai">
				<input id="ckGioiTinhKH" class="nutcheck" name="ckGioiTinhKH"
					type="checkbox">Nam
			</div>
			<div class="cottrai">Ngày sinh</div>
			<div class="cotphai">
				<input id="date" data-format="DD/MM/YYYY"
					data-template="DD MMM YYYY" name="date" value="22/05/2014"
					type="text" style="border-radius: 15px">
			</div>
			<div class="cottrai">Email</div>
			<div class="cotphai">
				<input id="txtEmailKH" class="cotphai_input" type="text"
					name="txtEmailKH">
			</div>
			<div class="cottrai">Địa chỉ</div>
			<div class="cotphai">
				<input id="txtDiaChiKH" class="cotphai_input" name="txtDiaChiKH"
					type="text">
			</div>
			<div class="cottrai">Số điện thoại</div>
			<div class="cotphai">
				<input id="txtSoDTKH" class="cotphai_input" name="txtSoDTKH"
					type="text" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
			</div>
			<div class="cottrai">Tên đăng nhập</div>
			<div class="cotphai">
				<input id="txtTenDNKH" class="cotphai_input" name="txtTenDNKH"
					type="text">
			</div>
			<div class="cottrai">Mật khẩu</div>
			<div class="cotphai">
				<input id="txtMatKhauKH" class="cotphai_input" name="txtMatKhauKH"
					type="password">
			</div>
			<div class="cottrai">Nhập lại mật khẩu</div>
			<div class="cotphai">
				<input id="txtMatKhauKHNhapLai" class="cotphai_input"
					name="txtMatKhauKHNhapLai" type="password">
			</div>
			<div class="cottrai">
				<a href="QuanLyKhachHang.jsp">Về trang chủ</a>
			</div>
			<div class="cotphai">
				<input type="submit" id="hanhdong" class="nutbam" name="hanhdong"
					value="Submit"> <input type="button" class="nutbam"
					value="Nhập lại" onclick="nhapLai();">
			</div>
		</div>
		<script type="text/javascript">
			function nhapLai() {
				document.getElementById("txtTenKH").value="";
				document.getElementById("txtDiaChiKH").value="";
				document.getElementById("txtSoDTKH").value="";
				document.getElementById("txtTenDNKH").value="";
				document.getElementById("txtMatKhauKH").value="";
			}
		</script>
		<script>
		    $(function(){
		    $('#date').combodate();
		    });
   		 </script>
	</form>
</body>
</html>