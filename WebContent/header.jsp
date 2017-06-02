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
<title>ABC Shop</title>

<link rel="shortcut icon" href="/Shopcongnghe/Images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/Shopcongnghe/Images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/mystyle.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/product.css" />
<link rel="stylesheet" type="text/css" href="/Shopcongnghe/css/cloudzoom.css" />

<script src="/Shopcongnghe/js/jquery.js"></script>
<script src="/Shopcongnghe/js/jquery-1.7.1.js"></script>
<script src="/Shopcongnghe/js/cloudzoom.js"></script>
<script type="text/javascript">
        CloudZoom.quickStart();
        var x = 1;
     </script>
<script src="js/jquery.js"></script>
</head>
<body style="background: url(Images/bg-login.jpg)">
	<!-- Header -->
	<div id="main-head">
		<div id="header-wrapper">
			<div class="header section" id="header">
				<div class="widget Header" id="Header1">
					<div id="header-inner">
						<div class="titlewrapper">
							<h2 class="title">
								<a href="index.jsp" style="font-family: Bradley Hand ITC;">ABC
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
					<li><a href="ChitietDongsanpham.jsp?madongsp=<%=madongsp%>"><%=tendsp %></a>
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
								href="Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>"><%=tennsp %></a></li>
							<%
							}
						}
						%>
						</ul> <%
					}
				}
			%></li>

				</ul>
			</div>
			<!-- MENU [end] -->
			<!-- Search [start] -->
			<%
			KHACHHANG_OBJ khachhang_obj=(KHACHHANG_OBJ)session.getAttribute("Khachhang");
			session.setAttribute("urlkh", request.getRequestURI());
		%>
			<form _lpchecked="1" action="Timkiem.jsp" class="search-form"
				id="search_mini_form" method="get">
				<div id="search">
					<div class="search-input form-search">
						<input id="s" name="q"
							onblur="if (this.value == '') {this.value = 'Nhập tên sản phẩm';}"
							onfocus="if (this.value == 'Nhập tên sản phẩm') {this.value = '';}"
							value="Nhập tên sản phẩm" type="text">
						<input
							id="buttonsinput" style="vertical-align: top;" value="Search!"
							type="submit">
					</div>
				</div>
			</form>
			<!-- Search [end] -->
			<div
				Style="float: right; margin-right: 300px; margin-top: -25px; width: auto;">
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="giohang.jsp"> Giỏ Hàng (<%
				GIOHANG_MOD gh_head=(GIOHANG_MOD)session.getAttribute("giohang");
				if(gh_head!=null){ out.print(gh_head.SoluongMonhang());}else{ out.print("0") ;}%>)
					|
				</a>

			</div>
			<div
				Style="float: right; margin-right: 100px; margin-top: -25px; width: auto;">
				<%if(khachhang_obj==null) 
		{%>
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="client/Dangnhap.jsp">Đăng Nhập</a>
				<%
		}else
		{
			%>
				<a
					style="color: #fff; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="client/QuanLyThongTinCaNhan.jsp">xin chào : <%=khachhang_obj.getTenDNKH()%></a>
				<a
					style="color: #fff; padding: 18px 18px; text-decoration: underline; color: #F34246; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="Dangxuat.do?kh=true">Thoát</a>
				<%
		}
		%>
			</div>

			<div
				Style="float: right; margin-right: 0px; margin-top: -25px; width: auto;">

				<a
					style="color: #fff; padding: 18px 18px; text-decoration: none; text-transform: capitalize; font-family: 'Open Sans', Helvetica, Arial, sans-serif; font-size: 14px;"
					href="client/DangKy.jsp">Đăng Ký</a>

			</div>

		</div>
	</div>
	<div style="clear: both;"></div>