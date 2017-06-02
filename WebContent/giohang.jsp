<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.MONHANG_OBJ"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- phần đường khoảng trắng dưới menu  -->
<jsp:include page="header.jsp"></jsp:include>
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
														<li><a href="index.jsp"><img
																src="Images/icon-home.png" style="vertical-align: -1px;"></a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a href="#">Giỏ hàng</a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a class="current">Chọn sản phẩm</a></li>
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
				<%
								    	int soluong=0;
								    	if(giohang_mod!=null)
								    	{
								    		soluong=giohang_mod.SoluongMonhang();
								    	} 
								    %>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">
					Giỏ hàng của bạn (<%=soluong %>)
				</h1>
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

						<div class="cart_form_vien">
							<div class="cart_form_subtitle">Total</div>
							<%
								    	int tongtien=0;
								    	if(giohang_mod!=null)
								    	{
								    		tongtien=giohang_mod.Tongtien();
								    	} 
								    %>
							<a style="font-size: 18px; color: #20C8EC">Tổng cộng: <b
								style="color: red; font-size: 18px"><fmt:formatNumber value="<%=tongtien %>" minFractionDigits="0"/>đ<sup>
										</sup></b></a>
						</div>


						<a href="index.jsp" class="continue"
							style="color: #fff; text-decoration: none;">Mua Tiếp</a> <a
							href="Thanhtoan.do" class="checkout"
							style="color: #fff; text-decoration: none;">Thanh toán</a>


					</div>
				</div>
				<div style="clear: both;"></div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 20px;">Hướng
					dẫn mua hàng</h1>
				<div class="proc-rela">
					<a style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
						1: Tạo tài khoản và đăng nhập</a> <br /> <a
						style="color: black; font-size: 17px">- Nếu bạn chưa có tài
						khoản trên website, hãy thực hiện thao tác <a href="#"
						style="font-size: 17px">tạo tài khoản</a>
					</a> <br /> <br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic;">Bước
						2: Chọn sách</a> <br /> <a style="color: black; font-size: 17px">-
						Sử dụng công cụ tìm kiếm để tìm sản phẩm mà bạn cần</a><br /> <a
						style="color: black; font-size: 17px">- Click chuột vào nút
						Mua ngay để mua sách</a><br /> <a
						style="color: black; font-size: 17px">- Chọn số lượng sản
						phẩm cần mua</a><br /> <a style="color: black; font-size: 17px">-
						Click chuột vào nút Mua tiếp nếu muốn mua tiếp</a><br /> <a
						style="color: black; font-size: 17px">- Click chuột vào nút
						Thanh toán để mua sản phẩm đã chọn</a><br /> <br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
						3: Nhập thông tin về địa chỉ giao hàng</a><br /> <a
						style="color: black; font-size: 17px">- Bạn cần nhập vào các
						thông tin về địa chỉ giao hàng (nhận hàng) như Họ và tên người
						nhận, địa chỉ nhận sách, Email người nhận, Số đt…</a><br /> <br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
						4: Chọn phương thức giao hàng</a><br /> <a
						style="color: black; font-size: 17px">Bạn chọn phương thức
						giao hàng bao gồm 2 phương thức chính:</a><br /> <a
						style="color: black; font-size: 17px">1. Vận chuyển trực tiếp
						trong vòng 24h kể từ khi đặt hàng đối với khách hàng trong TP.HCM</a><br />
					<a style="color: black; font-size: 17px">- Phí vận chuyển:
						15.000đ đối với tất cả các đơn hàng.Nhân viên giao hàng và thu
						phía tại địa chỉ nhận hàng.</a><br /> <a
						style="color: black; font-size: 17px">2. Vận chuyển qua đường
						bưu điện</a><br /> <a style="color: black; font-size: 17px">- Phí
						vận chuyển: 10.000đ đối với tất cả các đơn hàng</a><br /> <br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
						5: Chọn phương thức thanh toán</a><br /> <a
						style="color: black; font-size: 17px">Bạn chọn phương thức
						thanh toán bao gồm 2 phương thức chính:</a><br /> <a
						style="color: black; font-size: 17px">1. Trả tiền trực tiếp
						khi giao hàng</a><br /> <a style="color: black; font-size: 17px">-
						Nhân viên giao hàng sẽ giao hàng và thu tiền tại địa chỉ nhận
						hàng.</a><br /> <a style="color: black; font-size: 17px">2.
						Chuyển khoản qua ngân hàng</a><br /> <a
						style="color: black; font-size: 17px">- Bạn thực hiện chuyển
						khoản tổng giá trị của đơn hàng tại ngân hàng, máy ATM hoặc sử
						dụng dịch vụ Internet Banking (tiền được chuyển bao gồm cả phí vận
						chuyển) vào tài khoản được thông báo sau khi thực hiện đặt hàng.
						Nội dung chuyển khoản đề nghĩ ghi rõ Thanh toán cho đơn đặt hàng
						số…</a><br /> <a style="color: black; font-size: 17px">- Sau khi
						chuyển tiền vui lòng gọi điện về số 0982 44 7171 để xác nhận.</a><br />
					<br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic">Bước
						6: Hoàn tất mua hàng</a><br /> <a
						style="color: black; font-size: 17px">- Kiểm tra lại các thông
						tin, thực hiện các thay đổi nếu có</a><br /> <a
						style="color: black; font-size: 17px">- Click vào nút Xác nhận
						để hoàn tất quá trình đặt hàng.</a><br /> <a
						style="color: black; font-size: 17px">- Chúng tôi sẽ gọi điện
						lại cho bạn trước khi giao hàng.</a><br /> <br /> <a
						style="color: #0f7af2; font-weight: bold; font-style: italic">Nếu
						có bất cứ khó khăn nào hãy gọi: 0982 44 7171</a><br />
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
