<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.MONHANG_OBJ"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="object.KHACHHANG_OBJ"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"></jsp:include>
<style>
label.error {
 display: inline-block;
 color:red;
 width: 200px;
 }

</style>
<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="/Shopcongnghe/js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmDatHang").validate(
            {
                rules:
                    {
                		hoten: {required:true},
                        diachi: {required:true},
                        dienthoai: {required:true,
                        			maxlength: 11},
                    },
                    messages:
                        {
                    		hoten:{required:"Bạn chưa nhập tên!"},
                    		diachi:{required:"Bạn chưa nhập địa chỉ!"},
                    		dienthoai:{required:"Bạn chưa nhập số điện thoại!",
                    			maxlength: "SĐT không quá 11 số"},
                    		
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
<%
GIOHANG_MOD giohang_mod=(GIOHANG_MOD)session.getAttribute("giohang");
%>
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
																src="Images/icon-home.png" style="vertical-align: -1px;"></a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a href="giohang.jsp">Giỏ hàng</a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a class="current">Thông tin thanh toán</a></li>
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
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">Thông
					tin thanh toán</h1>
				<div class="proc-rela">
					<div class="feat_prod_box_details">
						<table class="cart_table">
							<tr class="cart_title">

								<td style="text-align: center">Tên sản phẩm</td>
								<td>Số lượng</td>
								<td>Đơn giá</td>
								<td>Thành tiền</td>
								<td>Xóa</td>
							</tr>
							<%
								                	if(giohang_mod!=null)
								                	{
								                	for(int i=0;i<giohang_mod.SoluongMonhang();i++)
								                	{
								                		MONHANG_OBJ monhang_obj=giohang_mod.getGiohang().get(i);
								                		
								                	%>


							<tr>

								<td><%=monhang_obj.getTensp() %></td>
								<td><%=monhang_obj.getSoluong() %></td>
								<td><fmt:formatNumber value="<%=monhang_obj.getGiasp() %>" minFractionDigits="0"/>đ</td>
								<td><fmt:formatNumber value="<%=monhang_obj.thanhTien() %>" minFractionDigits="0"/>đ</td>
								<td style="text-decoration: underline; color: #00F"><a
									href="Giohang.do?masp=<%=monhang_obj.getMasp()%>">Xóa</a></td>
							</tr>
							<% 
								                	}
								                	}
								              %>
						</table>
						<%
								  		int tongtien=0;
								  		if(giohang_mod!=null)
								  		{
								  			tongtien=giohang_mod.Tongtien();
								  		}
								  	%>
						<div class="cart_form_vien">
							<div class="cart_form_subtitle">Total</div>
							<a style="font-size: 18px; color: #20C8EC">Tổng cộng: <b
								style="color: red; font-size: 18px"><fmt:formatNumber value="<%=tongtien %>" minFractionDigits="0"/>đ<sup>
										</sup></b></a>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>
				<% 
									KHACHHANG_OBJ khachhang_obj=(KHACHHANG_OBJ)session.getAttribute("Khachhang");
								%>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">Thông
					tin người đặt hàng</h1>
				<div class="proc-rela">
					<table class="detail_table">
						<tr>
							<td class="left"><strong>Họ tên</strong></td>
							<td class="right"><%=khachhang_obj.getTenKH() %></td>

						</tr>
						<tr>
							<td class="left"><strong>Địa chỉ</strong></td>
							<td class="right"><%=khachhang_obj.getDiaChiKH() %></td>
						</tr>
						<tr>
							<td class="left"><strong>Điện thoại</strong></td>
							<td class="right"><%=khachhang_obj.getSoDTKH() %></td>
						</tr>
						<tr>
							<td class="left1"><strong>Email</strong></td>
							<td class="right1"><%=khachhang_obj.getEmailKH() %></td>
						</tr>
					</table>

				</div>
				<div style="clear: both;"></div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">Thông
					tin người nhận hàng</h1>
				<div class="proc-rela">
					<form action="Dathang.do" method="post" id="frmDatHang">
						<table class="detail_table">
							<tr>
								<td><strong>Họ tên</strong></td>
								<td><input type="text" name="hoten"
									value="<%=khachhang_obj.getTenKH() %>" class="input-review"></td>

							</tr>
							<tr>
								<td><strong>Địa chỉ</strong></td>
								<td><input type="text" name="diachi"
									value="<%=khachhang_obj.getDiaChiKH() %>" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Điện thoại</strong></td>
								<td><input type="text" name="dienthoai"
									value="<%=khachhang_obj.getSoDTKH() %>" class="input-review"></td>
							</tr>
							<tr>
								<td><strong>Phương thức giao hàng</strong></td>
								<td><select name="phuongthucgiaohang" size="1"
									class="input-review">
										<option value="Vận chuyển trực tiếp">Vận chuyển trực
											tiếp</option>
										<option value="Qua bưu điện">Qua bưu điện</option>

								</select></td>
							</tr>
							<tr>
								<td><strong>Hình thức thanh toán</strong></td>
								<td><select name="hinhthucthanhtoan" size="1"
									class="input-review">
										<option value="Trả tiền trực tiếp">Trả tiền trực tiếp</option>

										<option value="Chuyển khoản ngân hàng">Chuyển khoản
											ngân hàng</option>
								</select></td>
							</tr>
							<tr>
								<td><strong>Yêu cầu khác</strong></td>
								<td><textarea id="txtYcaukhac" name="yeucaukhac"
										style="width: 750px; height: 80px; border: 1px solid #20C8EC; border-radius: 3px;"></textarea></td>
							</tr>
						</table>
						<div style="margin-top: 20px;">
							<a href="giohang.jsp" class="continue"
								style="color: #fff; text-decoration: none;">Quay về</a>
							<%
								            if(giohang_mod!=null)
								            {
								            	
								            %>
							<input type="submit" class="checkout"
								style="color: #fff; text-decoration: none;" value="Hoàn tất">
						</div>
						<%
           									 }
           									%>
					</form>
				</div>


				<div style="clear: both;"></div>

			</div>
		</div>
	</div>
</div>

<br />
<jsp:include page="footer.jsp"></jsp:include>