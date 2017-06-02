<%@page import="Model.KHACHANG_MOD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/moment.min.js"></script>
<script src="/Shopcongnghejs/combodate.js"></script>
<script src="/Shopcongnghe/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="/Shopcongnghe/js/jquery.validate.js" type="text/javascript"></script>
<style type="text/css">
label.error {
 display: inline-block;
 color:red;
 width: 200px;
 }

 </style>

<script>
	    $(function(){
	    $('#date').combodate();
	    });
 	</script>
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
                        txtMatKhauKH: {
                        	required:true,
                        	minlength: 5
                        },
                        
                        txtMatKhauKHNhapLai: {
                        	required:true,
                        	minlength: 5,
                        	equalTo: "#txtMatKhauKH"
                        },
                        txtKiemTraNS: {required:true},
                    },
                    messages:
                        {
                    		txtTenKH:{required:"Bạn chưa nhập tên!"},
                    		txtEmailKH:{required:"Bạn chưa nhập email!"},
                    		txtDiaChiKH:{required:"Bạn chưa nhập địa chỉ!"},
                    		txtSoDTKH:{required:"Bạn chưa nhập số điện thoại!"},
                    		txtTenDNKH:{required:"Bạn chưa nhập tên đăng nhập!"},
                    		txtMatKhauKH:{
                    			required:"Vui lòng nhập mật khẩu!",
                    			minlength: "Vui lòng nhập ít nhất 5 kí tự!"
                    		},
                    		txtMatKhauKHNhapLai:{
                    			required:"Vui lòng nhập mật khẩu!",
                    			minlength: "Vui lòng nhập ít nhất 5 kí tự!",
                    			equalTo: "Mật khẩu không trùng khớp!",
                    		},
                    		
                    		txtKiemTraNS:{required:"Ngày sinh chưa hợp lệ!"},
                        },
                        submitHandler: function(form){
                        	form.submit();
                            /* if(confirm("Dữ liệu đã hợp lệ. Bạn có muốn lưu lại không?"))
                                {
                                	form.submit();
                               	} */
                        }
            });
        });
</script>

<div id="breadcrumb_background"></div>
<div id="body-wrapper">
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
					<form method="post" action="/Shopcongnghe/KHACHHANG_CTR" id="frmThem">
						<%	
							String maKH = KHACHANG_MOD.taoMaKhachHang();
						%>
						<table class="detail_table"
							style="width: 650px; margin: 10px 5px 20px 150px; padding-bottom: 20px">
							<input id="txtMaKH" class="cotphai_input" type="text"
								name="txtMaKH" value=<%=maKH%> style="display: none"
								readonly="readonly">
							<tr>
								<td><strong>Họ tên đầy đủ</strong></td>
								<td><input id="txtTenKH" type="text" name="txtTenKH"
									value="" class="input-review"></td>
							</tr>
							<select id="optMaLoaiKH" name="optMaLoaiKH" style="display: none">
								<option value="LKH01"></option>
							</select>
							<tr>
								<td><strong>Giới tính</strong></td>
								<td><input id="ckGioiTinhKH" type="radio"
									name="ckGioiTinhKH" value="male">Nam
									<input id="ckGioiTinhKH" type="radio"
									name="ckGioiTinhKH" value="female">Nữ
								</td>
								
							</tr>
							<tr>
								<td><strong>Ngày sinh</strong></td>
								<!-- <input id="date" data-format="DD/MM/YYYY" data-template="DD MMM YYYY" name="date" value="01/01/2014" type="text" onchange="kiemTrangaySinh();"> -->
								<td><input id="date" data-format="DD/MM/YYYY"
									data-template="DD MMM YYYY" type="text" name="date"
									value="01/01/1995" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Email</strong></td>
								<td><input id="txtEmailKH" type="text" name="txtEmailKH"
									value="" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Địa chỉ</strong></td>
								<td><input id="txtDiaChiKH" type="text" name="txtDiaChiKH"
									value="" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Số điện thoại</strong></td>
								<td><input id="txtSoDTKH" type="text" name="txtSoDTKH"
									value="" class="input-review"
									onkeyup="this.value=this.value.replace(/[^\d]/,'')"></td>
							</tr>

						</table>
						<table class="detail_table"
							style="width: 650px; margin: 10px 5px 20px 150px; padding-bottom: 20px">
							<tr>

								<td><strong>Tên đăng nhập</strong></td>
								<td><input id="txtTenDNKH" type="text" name="txtTenDNKH"
									value="" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Mật khẩu</strong></td>
								<td><input id="txtMatKhauKH" type="password"
									name="txtMatKhauKH" value="" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Nhập lại mật khẩu</strong></td>
								<td><input id="txtMatKhauKHNhapLai" type="password"
									name="txtMatKhauKHNhapLai" value="" class="input-review"></td>
							</tr>


						</table>
						<input type="hidden" name="url"
						value="<%=request.getRequestURI().toString()%>">
						<p style="color: red">
							<%if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao")); %>
						</p>
						<!-- <div style="margin-top: 20px;"> -->
						<!-- <a href="#" class="checkout" style="color:#fff;text-decoration: none;margin-right:171px">Hoàn tất</a> -->
						<!-- <a href="#" class="continue" style="color:#fff;text-decoration: none;">Reset</a> -->
						<!-- <input type="submit" id="hanhdong" class="checkout" style="color:#fff;text-decoration: none;margin-right:171px" name="hanhdong" value="Submit"> -->
						<input type="submit" class="checkout"
							style="color: #fff; text-decoration: none; margin-right: 171px"
							id="hanhdong" name="hanhdong" value="Submit"> <input
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
				<script type="text/javascript">
            		function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
				</script> <script type="text/javascript">
			</div>
		</div>
	</div>
</div>
<br />
<jsp:include page="footer.jsp"></jsp:include>