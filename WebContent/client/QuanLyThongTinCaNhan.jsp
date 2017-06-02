<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="object.KHACHHANG_OBJ"%>
<%@page import="Model.KHACHANG_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/moment.min.js"></script>
<script src="/Shopcongnghe/js/combodate.js"></script>

<script src="/Shopcongnghe/js/jquery.validate.js" type="text/javascript"></script>
<script>
	    $(function(){
	    $('#date').combodate();
	    });
 	</script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmSua").validate(
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
                    		txtTenKH:{required:"Bạn chưa nhập tên!"},
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
<!-- onload="kiemTraCheckBoxGioiTinh()" -->
<div id="breadcrumb_background"></div>
<div id="body-wrapper" >
	<div id="outer-wrapper">
		<div id="wrap2">
			<div id="content-wrapper">
				<div id="main-wrapper">
					<div class="main section" id="main">
						<div class="widget Blog" id="Blog1">
							<div class="blog-posts hfeed">
								<div class="date-outer">
									<div class="date-posts">
										<div class="post-outer">
											<div class="wrapfullpost">
												<div class="post hentry">
													<ul id="breadcrumbs-mbl">
														<li><a href="index.html"><img
																src="/Shopcongnghe/Images/icon-home.png"
																style="vertical-align: -1px;"></a></li>
														<div class="seperator">
															<img src="/Shopcongnghe/Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a href="#">Khách hàng</a></li>
														<div class="seperator">
															<img src="/Shopcongnghe/Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a class="current">Đăng ký thành viên</a></li>
													</ul>



												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">Đăng
					ký thành viên</h1>
				<div class="proc-rela">
					<form method="get" action="/Shopcongnghe/KHACHHANG_CTR" id="frmSua">
						<%	
							KHACHHANG_OBJ obj;
							obj = (KHACHHANG_OBJ)session.getAttribute("Khachhang");
							String maKH=obj.getMaKH();
							ResultSet rskh=KHACHANG_MOD.layKhachHang_TheoMa(maKH);
							String GioiTinhKH = "";
							if(rskh.next()){
								GioiTinhKH = rskh.getString("GioiTinhKH");
						%>
						<table class="detail_table"
							style="width: 650px; margin: 10px 5px 20px 150px; padding-bottom: 20px">
							<input id="txtMaKH" class="cotphai_input" type="text"
								name="txtMaKH" value=<%=maKH%> style="display: none"
								readonly="readonly">
							<tr>
								<td><strong>Họ tên đầy đủ</strong></td>
								<td><input id="txtTenKH" type="text" name="txtTenKH"
									value="<%=rskh.getString("tenKH")%>" class="input-review"></td>
							</tr>
							<select id="optMaLoaiKH" name="optMaLoaiKH" style="display: none">
								<option value="LKH01"></option>
							</select>
							<tr>
								<td><strong>Giới tính</strong></td>
								<td>
									<input id="male" name="ckGioiTinhKH" type="radio" value="male">Nam
									<input id="female" name="ckGioiTinhKH" type="radio" value="female">Nữ
								</td>
							</tr>
							<tr>
								<td><strong>Ngày sinh</strong></td>
								<!-- <input id="date" data-format="DD/MM/YYYY" data-template="DD MMM YYYY" name="date" value="01/01/2014" type="text" onchange="kiemTrangaySinh();"> -->
								<td><input id="date" data-format="DD/MM/YYYY"
									data-template="DD MMM YYYY" type="text" name="date"
									value="<%=rskh.getString("NgaySinhKH")%>" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Email</strong></td>
								<td><input id="txtEmailKH" type="text" name="txtEmailKH"
									value="<%=rskh.getString("EmailKH")%>" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Địa chỉ</strong></td>
								<td><input id="txtDiaChiKH" type="text" name="txtDiaChiKH"
									value="<%=rskh.getString("DiaChiKH")%>" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Số điện thoại</strong></td>
								<td><input id="txtSoDTKH" type="text" name="txtSoDTKH"
									value="<%=rskh.getString("SoDTKH")%>" class="input-review"
									onkeyup="this.value=this.value.replace(/[^\d]/,'')"></td>
							</tr>

						</table>
						<table class="detail_table"
							style="width: 650px; margin: 10px 5px 20px 150px; padding-bottom: 20px">
							<tr>

								<td><strong>Tên đăng nhập</strong></td>
								<td><input id="txtTenDNKH" type="text" name="txtTenDNKH"
									value="<%=rskh.getString("TenDNKH")%>" class="input-review" disabled></td>
							</tr>
							<tr>
								<td><strong>Mật khẩu</strong></td>
								<td><input id="txtMatKhauKH" type="password"
									name="txtMatKhauKH" value="<%=rskh.getString("MATKHAUKH") %>"
									class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Nhập lại mật khẩu</strong></td>
								<td><input id="txtMatKhauKHNhapLai" type="password"
									name="nhaplaimatkhau" value="<%=rskh.getString("MATKHAUKH") %>"
									class="input-review"></td>
							</tr>

							<%}%>
						</table>

						<!-- <div style="margin-top: 20px;"> -->
						<!-- <a href="#" class="checkout" style="color:#fff;text-decoration: none;margin-right:171px">Hoàn tất</a> -->
						<!-- <a href="#" class="continue" style="color:#fff;text-decoration: none;">Reset</a> -->
						<!-- <input type="submit" id="hanhdong" class="checkout" style="color:#fff;text-decoration: none;margin-right:171px" name="hanhdong" value="Submit"> -->
						<input id="hanhdong" name="hanhdong" type="hidden" value="capnhat">
						<input type="submit" class="checkout"
							style="color: #fff; text-decoration: none; margin-right: 171px"
							id="hanhdong" name="hanhdonga" value="Cập nhật"> <input
							type="button" class="continue"
							style="color: #fff; text-decoration: none;" onclick="nhapLai();"
							value="Nhập lại" />

						<!-- </div> -->
						<div style="clear: both;"></div>
					</form>
				</div>
				<script type="text/javascript">
									function nhapLai() {
										document.getElementById("txtTenKH").value="";
										document.getElementById("txtDiaChiKH").value="";
										document.getElementById("txtEmailKH").value="";
										document.getElementById("txtSoDTKH").value="";
										document.getElementById("txtTenDNKH").value="";										
										document.getElementById("txtMatKhauKH").value="";
										document.getElementById("txtMatKhauKHNhapLai").value="";
									}
				</script>
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
			</div>
		</div>
	</div>
</div>
<br />
<jsp:include page="footer.jsp"></jsp:include>