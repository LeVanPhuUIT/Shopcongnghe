<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.NHANVIEN_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Cập nhật nhân viên</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<script src="js/jquery.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/combodate.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmcapnhat").validate(
            {
                rules:
                    {
                        txthotennv: {required:true},
                        dtmngaysinhnv: {required:true},
                        txtdiachinv: {required:true},
                        txtsodtnv: {required:true, digits:true, minlength:7, maxlength:11},
                        txttendnnv: {required:true},
                        txtmatkhau: {required:true},
                    },
                    messages:
                        {
                            txthotennv:{required:"Bạn chưa nhập họ tên nhân viên!"},
                            dtmngaysinhnv:{required:"Bạn chưa nhập ngày sinh nhân viên!"},
                            txtsodtnv:{required:"Bạn chưa nhập số điện thoại!", digits:"Vui lòng nhập số", minlength:"Tối thiểu 7 số", maxlength:"Tối đa 11 số"},
                            txtdiachinv:{required:"Bạn chưa nhập địa chỉ nhân viên!"},
                            txttendnnv:{required:"Bạn chưa nhập tên đăng nhập!"},
                            txtmatkhau:{required:"Bạn chưa nhập mật khẩu!"},
                        },
                        submitHandler: function(form){
                            if(confirm("Dữ liệu đã hợp lệ. Bạn có muốn lưu lại không?"))
                                {
                                    form.submit();
                                }
                        }
            });
        });
        </script>
<body onload="kiemTraCheckBoxGioiTinh()">
	<jsp:include page="AdminIndex.jsp"></jsp:include>
	<td id="col_right">
		<h2>Cập nhật nhân viên</h2>
		<form method="get" action="../NHANVIEN_CTR" id="frmcapnhat">
			<%
				NHANVIEN_MOD nv_mod = new NHANVIEN_MOD();
				String manv = request.getParameter("manv");
				String GioiTinhNV = "";
				ResultSet rs = nv_mod.TimNhanVienTheoMaNV(manv);
				if (rs.next()) {
			%>
			<%
				GioiTinhNV = rs.getString("gioitinhnv");
			%>
			<input id="hanhdong" name="hanhdong" type="text" value="sua"
				style="display: none">
			<table class="TableUpdate" border="1">
				<tbody>
					<tr>
						<th>Mã nhân viên:</th>
						<td><input id="txtmanv" class="text" name="txtmanv"
							type="text" value="<%=rs.getString("manv")%>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>Tên nhân viên:</th>
						<td><input id="txthotennv" class="text" name="txthotennv"
							type="text" value="<%=rs.getString("hotennv")%>"></td>
					</tr>
					<tr>
						<th>Ngày sinh:</th>
						<td><input id="date" data-format="YYYY-MM-DD"
							data-template="DD MM YYYY" name="date"
							value="<%=rs.getString("ngaysinhnv")%>" type="text"></td>
					</tr>
					<tr>
						<th>Giới tính:</th>
						<td><input id="male" name="ckGioiTinhNV"
							type="radio" value="male">Nam
							<input id="female" name="ckGioiTinhNV"
							type="radio" value="female">Nữ
						</td>
					</tr>
					<tr>
						<th>Địa chỉ:</th>
						<td><input id="txtdiachinv" class="text" name="txtdiachinv"
							type="text" value="<%=rs.getString("diachinv")%>"></td>
					</tr>
					<tr>
						<th>Số điện thoại:</th>
						<td><input id="txtsodtnv" class="text" name="txtsodtnv"
							type="text" value="<%=rs.getString("sodtnv")%>"
							onkeyup="this.value=this.value.replace(/[^\d]/,'')"></td>
					</tr>
					<tr>
						<th>Tên đăng nhập:</th>
						<td><input id="txttendnnv" class="text" name="txttendnnv"
							type="text" value="<%=rs.getString("tendnnv")%>" style="background-color:rgb(250, 255, 189)"></td>
					</tr>
					<tr>
						<th>Mật khẩu:</th>
						<td><input id="txtmatkhau" class="text" name="txtmatkhau"
							type="password" value="<%=rs.getString("matkhaunv")%>" style="background-color:rgb(250, 255, 189)"></td>
					</tr>
					<tr>
						<td class="Control" colspan="3">
							<ul>
								<li><input type="submit" class="uupdate" value="Chấp nhận"></li>
								<li><input type="reset" class="vrefresh" value="Nhập lại"></li>
								<li><a class="uback" href="NhanVienQuanLy.jsp">Quay lại</a></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<%
				}
			%>
		</form>
	</td>
	<script type="text/javascript">
		function nhapLai() {
			document.getElementById("txthotennv").value="";
			document.getElementById("dtmngaysinhnv").value="";
			document.getElementById("txtdiachinv").value="";
			document.getElementById("txtsodtnv").value="";
			document.getElementById("txttendnnv").value="";
			document.getElementById("txtmatkhau").value="";
		}
	</script>
	<script>
	    $(function(){
	    $('#date').combodate();
	    });
 	</script>
	<script>
			function kiemTraCheckBoxGioiTinh() {
				var s="<%=GioiTinhNV%>"; 
				if(s=="1" || s=="male"){
					document.getElementById("male").checked=true;
				}
				else if(s=="2" || s=="female"){
					document.getElementById("female").checked=true;
				}
			}
		</script> 
</body>
</html>