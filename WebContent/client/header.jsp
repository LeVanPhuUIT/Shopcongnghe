<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.GIOHANG_MOD"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="object.KHACHHANG_OBJ"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABC Store</title>
<link rel="shortcut icon" href="/Shopcongnghe/Images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/Shopcongnghe/Images/favicon.ico" type="/Shopcongnghe/image/x-icon" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/mystyle.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/product.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/cloudzoom.css" />
<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/jquery-1.7.1.js"></script>
<script src="/Shopcongnghe/js/cloudzoom.js"></script>
<script type="text/javascript">
        CloudZoom.quickStart();
     </script>
<script src="js/jquery.js"></script>
</head>
<body style="background: url(Images/bg_body.jpg)">
	<!-- Header -->
	<div id="main-head">
		<div id="header-wrapper">
			<div class="header section" id="header">
				<div class="widget Header" id="Header1">
					<div id="header-inner">
						<div class="titlewrapper">
							<h2 class="title">
								<a href="/Shopcongnghe/index.jsp" style="font-family: Bradley Hand ITC;">ABC
									Shop</a>
							</h2>
						</div>
						<div class="descriptionwrapper">
							<p class="description">
								<span> </span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- MENU [start] -->
			<div class="menu-secondary-container">
				<ul class="menus menu-secondary">
					<li><a href="/Shopcongnghe/index.jsp">Home</a></li>
					<%
				DONGSANPHAM_MOD dongsanpham_mod =new DONGSANPHAM_MOD();
				NHOMSANPHAM_MOD nhomsanpham_mod =new NHOMSANPHAM_MOD();
				ResultSet dsDSP,dsNSP;
				dsDSP=dongsanpham_mod.DanhsachdongSanpham();
				if(dsDSP!=null)
				{
					while(dsDSP.next())
					{
						String madongsp=dsDSP.getString(1);
						String tendsp=dsDSP.getString(2);
						%>
					<li><a href="/Shopcongnghe/ChitietDongsanpham.jsp?madongsp=<%=madongsp%>"><%=tendsp %></a>
						<ul class="children">
							<%
						dsNSP=nhomsanpham_mod.DanhsachNhomsanpham_DONGSP(madongsp);
						if(dsNSP!=null)
						{
							while(dsNSP.next())
							{
								String manhomsp=dsNSP.getString(1);
								String tennsp=dsNSP.getString(3);
								%>
							<li><a
								href="/Shopcongnghe/Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>"><%=tennsp %></a></li>
							<%
							}
						}
						%>
						</ul></li>
					<%
					}
				}
			%>


					<%
			KHACHHANG_OBJ khachhang_obj=(KHACHHANG_OBJ)session.getAttribute("Khachhang");
			session.setAttribute("urlkh", request.getRequestURI());
		%>
				</ul>
			</div>
			<!-- MENU [end] -->
			<!-- Search [start] -->
			<form _lpchecked="1" action="/Shopcongnghe/Timkiem.jsp" class="search-form"
				id="search_mini_form" method="get">
				<div id="search">
					<div class="search-input form-search">
						<input id="s" name="q"
							onblur="if (this.value == '') {this.value = 'Search the site';}"
							onfocus="if (this.value == 'Search the site') {this.value = '';}"
							value="Search the site" type="text"> <input
							id="buttonsinput" style="vertical-align: top;" value="Search!"
							type="submit">
					</div>
				</div>
			</form>
			<!-- Search [end] -->
			<div
				Style="float: right; margin-right: 220px; margin-top: -25px; width: auto;">
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="/Shopcongnghe/giohang.jsp"> Giỏ Hàng (<%
				GIOHANG_MOD gh_head=(GIOHANG_MOD)session.getAttribute("giohang");
				if(gh_head!=null){ out.print(gh_head.SoluongMonhang());}else{ out.print("0") ;}%>)
				</a>

			</div>
			<div
				Style="float: right; margin-right: 10px; margin-top: -25px; width: auto;">
				<%if(khachhang_obj==null) 
		{%>
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="Dangnhap.jsp">Đăng Nhập</a>
				<%
		}else
		{
			%>
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="#">Xin chào : <%=khachhang_obj.getTenDNKH()%></a> <a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="/Shopcongnghe/Dangxuat.do?kh=true">Thoát</a>
				<%
		}
		%>
			</div>
		</div>
	</div>

	<div style="clear: both;"></div>

	<!--  -->
	<div class='featurehomer section' id='featurehomer1'>
		<div class='widget HTML' id='HTML22'>
			<div class='widget-content'>
				<div class='featureticker-wrap'>
					<div id='featuresticker'>
						<div id='ticker'>
							<ul class='ticker-list'>
								<li>

									<div class='ticker-head1'>
										<marquee onmouseover="this.stop()" onmouseout="this.start()"
											scrollamount="5" direction="right" align="center">
											<h4>
												Chào mừng bạn đến với <strong>ABC Shop</strong> nơi cung
												cấp các sản phẩm công nghệ chất lượng !
											</h4>
											<h4>Chúc bạn một ngày vui vẻ !</h4>
									</div> </marquee>


								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>