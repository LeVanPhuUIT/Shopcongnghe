<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.LOAIKHACHHANG_MOD"%>
<%@page import="Model.KHACHANG_MOD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="Model.KETNOI_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sửa khách hàng</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/QuanLyKhachHang_Them+Sua.css"> -->
<script src="js/jquery.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/combodate.js"></script>
<!-- <script src="js/jquery-1.7.min.js" type="text/javascript"></script> -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmSua").validate(
            {
                rules:
                    {
                        txtTenKH: {required:true},
                        txtDiaChiKH: {required:true},
                        txtSoDTKH: {required:true},
                        txtMatKhauKH: {required:true},
                        txtKiemTraNS: {required:true},
                    },
                    messages:
                        {
                    		txtTenKH:{required:"Bạn chưa nhập tên khách hàng!"},
                    		txtDiaChiKH:{required:"Bạn chưa nhập địa chỉ!"},
                    		txtSoDTKH:{required:"Bạn chưa nhập số điện thoại!"},
                    		txtMatKhauKH:{required:"Bạn chưa nhập mật khẩu!"},
                    		txtKiemTraNS:{required:"Ngày sinh chưa hợp lệ!"},
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
<body onload="kiemTraCheckBoxGioiTinh();kiemTraCheckBoxConQuanLy()">
	<jsp:include page="AdminIndex.jsp" />
	<td id="col_right">
		<form method="get" action="../KHACHHANG_CTR" id="frmSua">
			<h2>Sửa khách hàng</h2>
			<%
			 	String maKH = request.getParameter("makh");
			 	ResultSet rs = KHACHANG_MOD.layKhachHang_TheoMa(maKH);
			 	String GioiTinhKH = "";
			 	String ConQuanLy = "";
			 	ResultSet dsLKH = LOAIKHACHHANG_MOD.layDanhSachLoaiKH();
			 	ArrayList rowValues = new ArrayList();
			 	try {
			 		while (dsLKH.next()) {
			 			rowValues.add(dsLKH.getString(1));
			 		}
			 	} catch (SQLException e) {
			 		e.printStackTrace();
			 	}
			 	String[] arrdsLKH = (String[]) rowValues.toArray(new String[rowValues.size()]);
			 	String tam = "";
			 	for (int i = 0; i < arrdsLKH.length; i++) {
			 		tam += arrdsLKH[i] + " ";
			 	}
	 			tam = tam.trim();
	 			while (rs.next()) {
	 				GioiTinhKH = rs.getString("GioiTinhKH");
	 				ConQuanLy = rs.getString("TrangThai");
	 		%>
			<input id="handhong" name="hanhdong" type="text" value="sua"
				style="display: none">
			<table class="TableUpdate" border="1">
				<tbody>
					<tr>
						<th>Mã khách hàng:</th>
						<td><input id="txtMaKH" class="text" name="txtMaKH"
							type="text" value="<%=rs.getString("MaKH")%>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>Mã loại khách hàng:</th>
						<td><select id="optMaLoaiKH" class="text" name="optMaLoaiKH"
							onfocus="loadDSLKH();">
								<option><%=rs.getString("MaLoaiKH")%></option>
						</select></td>
					</tr>
					<tr>
						<th>Tên khách hàng:</th>
						<td><input id="txtTenKH" class="text" name="txtTenKH"
							type="text" value="<%=rs.getString("TenKH")%>"></td>
					</tr>
					<tr>
						<th>Giới tính:</th>
						<td><input id="male" name="ckGioiTinhKH"
							type="radio" value="male">Nam
							<input id="female" name="ckGioiTinhKH"
							type="radio" value="female">Nữ
						</td>
					</tr>
					<tr>
						<th>Ngày sinh:</th>
						<td><input id="date" data-format="YYYY-MM-DD"
							data-template="DD MM YYYY" name="date"
							value="<%=rs.getString("NgaySinhKH")%>" type="text"
							onchange="kiemTrangaySinh()"> <input id="txtKiemTraNS"
							class="text" name="txtKiemTraNS" type="text"
							style="border: none; width: 260px" readonly="readonly"></td>
					</tr>
					<tr>
						<th>Email:</th>
						<td><input id="txtEmailKH" class="text" type="text"
							name="txtEmailKH" value="<%=rs.getString("EmailKH")%>">
						</td>
					</tr>
					<tr>
						<th>Địa chỉ:</th>
						<td><input id="txtDiaChiKH" class="text" name="txtDiaChiKH"
							type="text" value="<%=rs.getString("DiaChiKH")%>"></td>
					</tr>
					<tr>
						<th>Số điện thoại:</th>
						<td><input id="txtSoDTKH" class="text" name="txtSoDTKH"
							type="text" value="<%=rs.getString("SODTKH")%>"
							onkeyup="this.value=this.value.replace(/[^\d]/,'')"></td>
					</tr>
					<tr>
						<th>Tên đăng nhập:</th>
						<td><input id="txtTenDNKH" class="text" name="txtTenDNKH"
							type="text" value="<%=rs.getString("TenDNKH")%>" readonly style="background-color:#bfbfbf;" ></td>
					</tr>
					<tr>
						<th>Mật khẩu:</th>
						<td><input id="txtMatKhauKH" class="text" name="txtMatKhauKH"
							type="password" value="<%=rs.getString("MatKhauKH")%>" style="background-color:rgb(250, 255, 189);"></td>
					</tr>
					<tr>
						<th>Điểm mua hàng:</th>
						<td><input id="txtDiemMuaHang" class="text" type="text"
							value="<%=rs.getString("DiemMuaHang")%>"></td>
					</tr>
					<tr>
						<th>Trạng thái:</th>
						<td><input id="ckql" class="nutcheck" name="ckql"
							type="checkbox">Còn quản lý</td>
					</tr>
					<tr>
						<td class="Control" colspan="3">
							<ul>
								<li><input type="submit" class="uupdate" value="Chấp nhận"></li>
								<li><input type="reset" class="vrefresh" value="Nhập lại""></li>
								<li><a class="uback" href="QuanLyKhachHang.jsp">Quay
										lại</a></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<%
	 			}
	 		%>

		</form> 
		<script>
			function kiemTraCheckBoxGioiTinh() {
				var s="<%=GioiTinhKH%>"; 
				if(s=="1" || s=="male"){
					document.getElementById("male").checked=true;
				}
				else if(s=="2" || s=="female"){
					document.getElementById("female").checked=true;
				}
			}
		</script> 
		<script>
			function kiemTraCheckBoxConQuanLy() {
				var s="<%=ConQuanLy%>";
				if (s == "1") {
					document.getElementById("ckql").checked = true;
				}
			}
		</script> 
		<script type="text/javascript">
			function loadDSLKH(){
				var select = document.getElementById("optMaLoaiKH");
				var ii;
			    for(ii=select.options.length-1;ii>=0;ii--)
			    {
			        select.remove(ii);
			    }
				
				var chuoiLKH="<%=tam%>";
				var mangLKH=chuoiLKH.split(" ");
				
				for(var i = 0; i < mangLKH.length; i++) {
			        var option = document.createElement('option');
			        var tam=mangLKH[i];
			        option.text = option.value = tam;
			        select.add(option, 0);
			    }
			}	
			function nhapLai() {
				document.getElementById("txtTenKH").value="";
				document.getElementById("txtDiaChiKH").value="";
				document.getElementById("txtSoDTKH").value="";
				document.getElementById("txtMatKhauKH").value="";
				document.getElementById("txtEmailKH").value="";
			}
		</script> <script>
			function kiemTrangaySinh(){
				var elementNgaySinh=document.getElementById("date").value;
				if(!elementNgaySinh.match(/\S/)){
					document.getElementById("txtKiemTraNS").value="";
				}
				else{
					document.getElementById("txtKiemTraNS").value=".";
				}
			}
		</script> <script>
			    $(function(){
			    $('#date').combodate();
			    });
	 	</script>

	</td>
</body>
</html>