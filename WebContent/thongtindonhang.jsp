<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.MONHANG_OBJ"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="object.KHACHHANG_OBJ"%>
<%@ page import="object.THONGTINNGUOINHAN_OBJ"%>
<%@ page import="Model.DONDATHANG_MOD"%>
<jsp:include page="header.jsp"></jsp:include>
<%
GIOHANG_MOD giohang_mod=(GIOHANG_MOD)session.getAttribute("giohang");
THONGTINNGUOINHAN_OBJ thongtin=(THONGTINNGUOINHAN_OBJ)session.getAttribute("Thongtinnguoinhan");
DONDATHANG_MOD dondathang=new DONDATHANG_MOD();
%>
<div id="breadcrumb_background"></div>
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
														<li><a class="current">Thông tin đơn hàng</a></li>
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
					tin đơn hàng</h1>
				<div class="proc-rela">
					<p class="details" style="text-align: center;">
						<strong><span class="blue">Bạn đã mua hàng thành
								công .Cảm ơn bạn đã lựa chọn chúng tôi !</span></strong> <strong><span
							class="blue"><a href="index.jsp"><u>Quay về trang
										chủ</u></a></span></strong>
					</p>
					<table class="detail_table">
						<tr>
							<td class="left"><strong>Họ tên</strong></td>
							<td class="right"><%=thongtin.getHoten() %></td>

						</tr>
						<tr>
							<td class="left"><strong>Địa chỉ</strong></td>
							<td class="right"><%=thongtin.getDiachi() %></td>
						</tr>
						<tr>
							<td class="left"><strong>Điện thoại</strong></td>
							<td class="right"><%=thongtin.getDienthoai() %></td>
						</tr>
					</table>


					<div class="feat_prod_box_details" style="margin-top: 20px;">
						<table class="cart_table">
							<tr class="cart_title">

								<td style="text-align: center">Tên sản phẩm</td>
								<td>Số lượng</td>
								<td>Đơn giá</td>
								<td>Thành tiền</td>
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
								<td><%=monhang_obj.getGiasp() %></td>
								<td><%=monhang_obj.thanhTien() %></td>
							</tr>
							<% 
								                	}
								                	}
								              %>
						</table>

						<div class="cart_form_vien">
							<div class="cart_form_subtitle">Total</div>
							<a style="font-size: 18px; color: #20C8EC">Tổng cộng: <b
								style="color: red; font-size: 18px"><%=giohang_mod.Tongtien() %><sup>
										Vnđ</sup></b></a><br />
							<% String MaDH=(String)session.getAttribute("MaDH"); %>
							<a style="font-size: 18px; color: #20C8EC">Số tiền phải thanh
								toán: <b style="color: red; font-size: 18px">
									<% if(MaDH!=null){ out.print(dondathang.tienDonhang(MaDH));} %><sup>
										Vnđ</sup>
							</b>
							</a>
						</div>
						<%
								        	session.setAttribute("MaDH", null);
								        	session.setAttribute("giohang", null);
								        	session.setAttribute("Thongtinnguoinhan", null);
								        %>
					</div>

				</div>
			</div>
			<div style="clear: both;"></div>

		</div>
	</div>
</div>

<br />
<jsp:include page="footer.jsp"></jsp:include>