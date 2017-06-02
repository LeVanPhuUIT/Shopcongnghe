<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.NHANVIEN_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thêm mới nhân viên</title>
<!-- <script src="js/jquery.js"></script> -->
<script src="js/moment.min.js"></script>
<script src="js/combodate.js"></script>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
</head>

<script>
    $(function(){
    $('#date').combodate();
    });
</script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmThem").validate(
            {
                rules:
                    {
                        txthotennv: {required:true},
                        dtmngaysinhnv: {required:true},
                        txtdiachinv: {required:true},
                        txtsodtnv: {required:true, digits:true, minlength:3, maxlength:11},
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
<jsp:include page="AdminIndex.jsp"></jsp:include>
<td id="col_right">
	<h2>Thêm mới nhân viên</h2>
	<form method="get" action="../NHANVIEN_CTR" id="frmThem">
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<th>Mã nhân viên:</th>
					<td>
						<%
		                	String manv = NHANVIEN_MOD.TaomaNV();
						%> <input id="txtmanv" class="text" type="text" name="txtmanv"
						value=<%=manv%> readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>Tên Nhân viên:</th>
					<td><input id="txthotennv" class="text" type="text"
						name="txthotennv"></td>
				</tr>
				<tr>
					<th>Ngày sinh:</th>
					<td><input id="date" data-format="DD/MM/YYYY"
						data-template="DD MMM YYYY" name="date" value="01/01/2014"
						type="text"></td>
				</tr>
				<tr>
					<th>Giới tính:</th>
					<td>
							<input id="male" name="ckGioiTinhKH" type="radio" value="male">Nam
							<input id="female" name="ckGioiTinhKH" type="radio" value="female">Nữ
					</td>
				</tr>
				<tr>
					<th>Địa chỉ:</th>
					<td><input id="txtdiachinv" class="text" name="txtdiachinv"
						type="text"></td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td><input id="txtsodtnv" class="text" name="txtsodtnv"
						type="text" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
					</td>
				</tr>
				<tr>
					<th>Tên đăng nhập:</th>
					<td><input id="txttendnnv" class="text" name="txttendnnv"
						type="text"></td>
				</tr>
				<tr>
					<th>Mật khẩu:</th>
					<td><input id="txtmatkhau" class="text" name="txtmatkhau"
						type="password"></td>
				</tr>
				<tr>
					<td class="Control" colspan="3">
						<ul>
							<li><input type="submit" id="hanhdong" class="uupdate"
								name="hanhdong" value="Thêm"></li>
							</li>
							<input type="reset" class="vrefresh" value="Nhập lại"
								onclick="nhapLai();">
							</li>
							<li><a class="uback" href="NhanVienQuanLy.jsp">Quay Lại</a></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form> <script type="text/javascript">
			function nhapLai() {
				document.getElementById("txthotennv").value="";
				document.getElementById("txtdiachinv").value="";
				document.getElementById("txtsodtnv").value="";
				document.getElementById("txttendnnv").value="";
				document.getElementById("txtmatkhau").value="";
			}
	</script>
</td>
</html>