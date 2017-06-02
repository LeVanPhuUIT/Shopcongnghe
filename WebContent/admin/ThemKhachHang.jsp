<%@page import="Model.LOAIKHACHHANG_MOD"%>
<%@page import="Model.KHACHANG_MOD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="Model.KETNOI_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thêm khách hàng</title>
<script src="js/jquery.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/combodate.js"></script>
<!-- <script src="js/jquery-1.7.min.js" type="text/javascript"></script> -->
<script src="js/jquery.validate.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
</head>
<script type="text/javascript">
        $(document).ready(function(){
        	$("#txtTenDNKH").val("");
            $("#frmThem").validate(
            {
                rules:
                    {
                        txtTenKH: {required:true},
                        txtEmailKH: {required:true},
                        txtDiaChiKH: {required:true},
                        txtSoDTKH: {required:true},
                        txtTenDNKH: {required:true},
                        txtMatKhauKH: {required:true},
                        txtKiemTraNS: {required:true},
                    },
                    messages:
                        {
                    		txtTenKH:{required:"Bạn chưa nhập tên khách hàng!"},
                    		txtEmailKH:{required:"Bạn chưa nhập email!"},
                    		txtDiaChiKH:{required:"Bạn chưa nhập địa chỉ!"},
                    		txtSoDTKH:{required:"Bạn chưa nhập số điện thoại!"},
                    		txtTenDNKH:{required:"Bạn chưa nhập tên đăng nhập!"},
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
<script>
	function kiemTraTrungTenDangNhap(){
		var tenDN=document.getElementById("txtTenDNKH").value;
		xmlHttp=GetXmlHttpObject();
	    var url="KhachHangLoi.jsp";
	    url=url+"?TenDNKH="+tenDN+"&hanhdong=kiemtratendangnhap";
	    xmlHttp.onreadystatechange=Loi;
	    xmlHttp.open("GET",url,true);
	    xmlHttp.send(null);
	}
	function kiemTraTrungEmail(){
		var EmailKH=document.getElementById("txtEmailKH").value;
		xmlHttp=GetXmlHttpObject();
	    var url="KhachHangLoi.jsp";
	    url=url+"?EmailKH="+EmailKH+"&hanhdong=kiemtraemail";
	    xmlHttp.onreadystatechange=Loi;
	    xmlHttp.open("GET",url,true);
	    xmlHttp.send(null);
	}
	function Loi() 
    { 
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        {
            var kqtv = xmlHttp.responseText;
            var elementThongBao=document.getElementById('ThongBaoSai');
            elementThongBao.value=kqtv;
            var loi=elementThongBao.value;
            if(loi=="Tên đăng nhập đã tồn tại!"){
           		alert(kqtv+"bạn hãy nhập lại trường này!");
           	 	document.getElementById("txtTenDNKH").value="";
            }
            if(loi=="Email đã tồn tại!"){
            	alert(kqtv+"bạn hãy nhập lại trường này!");
           	 	document.getElementById("txtEmailKH").value="";
           }
        } 
    }
	function GetXmlHttpObject()
	{
	    var xmlHttp=null;
	    try
	    {
	        xmlHttp=new XMLHttpRequest();
	    }
	    catch (e)
	    {
	         try
	         {
	            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	         }
	        catch (e)
	        { 
	            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	        }
	    }
	    return xmlHttp;
	}
</script>
<jsp:include page="AdminIndex.jsp" />
<td id="col_right">
	<h2>Thêm khách hàng</h2>
	<form method="get" action="../KHACHHANG_CTR" id="frmThem">
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<th>Mã khách hàng:</th>
					<td>
						<%
							String maKH = KHACHANG_MOD.taoMaKhachHang();
						%> <input id="txtMaKH" class="text" type="text" name="txtMaKH"
						value=<%=maKH%> readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>Mã loại khách hàng:</th>
					<td>
						<%
							ResultSet rs = LOAIKHACHHANG_MOD.layDanhSachLoaiKH();
						%> <select id="optMaLoaiKH" class="text" name="optMaLoaiKH">
							<%
								while (rs.next()) {
							%>
							<option value=<%=rs.getString("MaLoaiKH") %>><%=rs.getString("TenLoaiKH")%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<th>Tên khách hàng:</th>
					<td><input id="txtTenKH" class="text" type="text"
						name="txtTenKH"></td>
				</tr>
				<tr>
					<th>Giới tính:</th>
					<<td>
							<input id="male" name="ckGioiTinhKH" type="radio" value="male">Nam
							<input id="female" name="ckGioiTinhKH" type="radio" value="female">Nữ
					</td>
				</tr>
				<tr>
					<th>Ngày sinh:</th>
					<td><input id="date" data-format="DD/MM/YYYY"
						data-template="DD MMM YYYY" name="date" value="01/01/1995"
						type="text" onchange="kiemTrangaySinh();"> <input
						id="txtKiemTraNS" class="text" name="txtKiemTraNS" type="text"
						style="border: none; width: 260px" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Email:</th>
					<td><input id="txtEmailKH" class="text" type="text"
						name="txtEmailKH" onchange="kiemTraTrungEmail()"></td>
				</tr>
				<tr>
					<th>Địa chỉ:</th>
					<td><input id="txtDiaChiKH" class="text" name="txtDiaChiKH"
						type="text"></td>
				</tr>
				<tr>
					<th>Số điện thoại:</th>
					<td><input id="txtSoDTKH" class="text" name="txtSoDTKH"
						type="text" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
					</td>
				</tr>
				<tr>
					<th>Tên đăng nhập:</th>
					<td><input id="txtTenDNKH" class="text" name="txtTenDNKH"
						type="text" onchange="kiemTraTrungTenDangNhap();"></td>
				</tr>
				<tr>
					<th>Mật khẩu:</th>
					<td><input id="txtMatKhauKH" class="text" name="txtMatKhauKH"
						type="password"></td>
				</tr>
				<tr style="display: none">
					<th>Thông báo:</th>
					<td><input id="ThongBaoSai" class="text" name="ThongBaoSai"
						type="text"></td>
				</tr>
				<tr>
					<td class="Control" colspan="3">
						<ul>
							<li><input type="submit" id="hanhdong" class="uupdate"
								name="hanhdong" value="Thêm"></li>
							<li><input type="reset" class="vrefresh" value="Nhập lại"></li>
							<li><a class="uback" href="QuanLyKhachHang.jsp">Quay lại</a></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form> <script type="text/javascript">
		function nhapLai() {
			document.getElementById("txtTenKH").value="";
			document.getElementById("txtDiaChiKH").value="";
			document.getElementById("txtSoDTKH").value="";
			document.getElementById("txtTenDNKH").value="";
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