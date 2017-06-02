<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="object.NHANVIEN_OBJ"%>
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/admin/AdminStyle.css" />
<title>Trang chủ quản lý</title>
<script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>
</head>
<body>
	<script src="js/jquery.js"></script>
	<div class="main">
		<div id="header">
			<div class="div">
				<table class="table">
					<tr>
						<td colspan="3" class="logo">ADMIN PAGE MANAGER</td>
						
					</tr>

					<tr>
						<%
                         	NHANVIEN_OBJ nhanvien_obj=(NHANVIEN_OBJ)session.getAttribute("Nhanvien");
                         %>
						<td class="left">Chào mừng: <strong><%=nhanvien_obj.gettendnnv() %></strong>|<a
							href="../Dangxuat.do">Thoát</a>
						</td>
						<td class="right">[ <a href="../admin/Quanly.jsp">Trang
								quản trị </a> ] &nbsp; [ <a
							href="../index.jsp"
							target="_blank">Trang chủ</a> ] &nbsp;
						</td>
					</tr>

				</table>


			</div>
		</div>
		<div id="main" class="clearfix">
			<table width="100%" border="0" cellspacing="0">
				<tbody>
					<tr>
						<td id="col_left">

							<table class="tableAd">
								<tbody>
									<tr>
										<td class="left"><img src="/Shopcongnghe/admin/imagesAdmin/blank.gif"></td>
										<td>Quản lý chung</td>
										<td class="image"><img alt="" id="imgdiv1"
											src="/Shopcongnghe/admin/imagesAdmin/closed.gif" onclick="toggleXPMenu('div1');"></td>
									</tr>
								</tbody>
							</table>
							<div id="div1" class="content">
								<ul>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_system.jpg"><a
										href="/Shopcongnghe/admin/QuanLyKhachHang.jsp">Quản lý khách hàng</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_system.jpg"><a
										href="/Shopcongnghe/admin/NhanVienQuanLy.jsp">Quản lý Nhân viên</a></li>
									
								</ul>
							</div>

							<table class="tableAd">
								<tbody>
									<tr>
										<td class="left"><img alt="" src="/Shopcongnghe/admin/imagesAdmin/blank.gif"></td>
										<td>Quản lý Sản phẩm</td>
										<td class="image"><img alt="" id="imgdiv2"
											src="/Shopcongnghe/admin/imagesAdmin/closed.gif" onclick="toggleXPMenu('div2');"></td>
									</tr>
								</tbody>
							</table>
							<div id="div2" class="content">
								<ul>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlysanpham.jsp">Quản lý Sản phẩm</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlydongsanpham.jsp">Quản lý dòng sản phẩm</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlynhomsanpham.jsp">Quản lý nhóm sản phẩm</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlykhuyenmai.jsp">Quản lý Khuyến mãi</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Nhanxetdanhgia.jsp">Đánh giá sản phẩm</a></li>
								</ul>
							</div>



							<table class="tableAd">
								<tbody>
									<tr>
										<td class="left"><img alt="" src="/Shopcongnghe/admin/imagesAdmin/blank.gif"></td>
										<td>Quản lý đơn hàng</td>
										<td class="image"><img alt="" id="imgdiv5"
											src="/Shopcongnghe/admin/imagesAdmin/closed.gif" onclick="toggleXPMenu('div5');"></td>
									</tr>
								</tbody>
							</table>
							<div id="div5" class="content">
								<ul>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlydonhang.jsp">Quản lý đơn hàng</a></li>
								</ul>
							</div>
							<table class="tableAd">
								<tbody>
									<tr>
										<td class="left"><img alt="" src="/Shopcongnghe/admin/imagesAdmin/blank.gif"></td>
										<td>Báo cáo thống kê</td>
										<td class="image"><img alt="" id="imgdiv4"
											src="/Shopcongnghe/admin/imagesAdmin/closed.gif" onclick="toggleXPMenu('div4');"></td>
									</tr>
								</tbody>
							</table>
							<div id="div4" class="content">
								<ul>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Thongkedoanhthutheongay.jsp">Thống kê doanh thu theo
											ngày</a></li>

									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Thongkehangton.jsp">Thống kê hàng tồn</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Thongkesanphambanchay.jsp">Danh sách 10 sản phẩm
											bán chạy</a></li>
									<li><img src="/Shopcongnghe/admin/imagesAdmin/icon_gnews.jpg"><a
										href="/Shopcongnghe/admin/Quanlyhoadon.jsp">Lập hóa đơn</a></li>
								</ul>
							</div>
							<div class="powered_by"> Nhóm thực hiện: <b><br />- Lê Văn Phú <br />- Ngô Sơn Lâm <br />-Nguyễn Minh Trí<br />- Nguyễn Trần Anh Tú <br />- Đàm Minh Vũ
							</div>
						</td>