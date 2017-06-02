<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<%
String madongsp=request.getParameter("madongsp");
String manhomsp=request.getParameter("manhomsp");
NHOMSANPHAM_MOD nhomsanpham_mod=new NHOMSANPHAM_MOD();
DONGSANPHAM_MOD dongsanpham_mod=new DONGSANPHAM_MOD();
SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
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
														<li><a
															href="ChitietDongsanpham.jsp?madongsp=<%=madongsp %>"><%=dongsanpham_mod.layTendongsp(madongsp)%></a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a class="current"
															href="Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>"><%=nhomsanpham_mod.layTennhomsp(manhomsp) %></a></li>
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
				<div id='body-wrapper'>
					<%	
		
			String getpage=request.getParameter("p");
			int p=1;
			if(getpage!=null)
			{
				p=Integer.parseInt(getpage);
			}
			
			%>
					<div id='outer-wrapper'>
						<div id='wrap2'>
							<div id='content-wrapper'>
								<div id='main-wrapper' style="margin-top: 25px;">
									<div class='home_navigation' id="">
										<h1 class='our_portfolio'
											style="font-family: Timenewroman; font-size: 34px; color: green;"><%=nhomsanpham_mod.layTennhomsp(manhomsp) %></h1>
										<span class='line-home'></span>

									</div>

									<div class="new_products">
										<%
		               		ResultSet dsSp=sanpham_mod.DanhsachSanpham_NHOMSP_DONGSP_Trang(6, p, madongsp, manhomsp);
		               		if(dsSp!=null)
		               		{
		               			while(dsSp.next())
		               			{
		               				String masp=dsSp.getString("MASP");
		               				String tensp=dsSp.getString("TENSP");
		               				String hinhanh=dsSp.getString("HINHANH");
		               				int giasp=dsSp.getInt("GIASP");
		              	 %>
										<div class="new_prod_box">
											<div class="new_prod_bg">

												<span class="new_icon"><img src="Images/new_icon.gif" />
												</span>

												<div class="new_prod_img">
													<a href="chitietsanpham.jsp?masp=<%=masp%>"><img
														src="hinhanh/<%=hinhanh%>" class="thumb"
														style="width: 300px; height: 300px;" /></a> <a
														href="chitietsanpham.jsp?masp=<%=masp%>"
														style="width: 250px;"><%=tensp %></a> <a
														href="chitietsanpham.jsp?masp=<%=masp%>"
														style="width: 250px; color: red; font-size: 20px; font-family: OpenSans-Bold">Giá:<fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>đ</a>
												</div>
											</div>
										</div>

										<%
		               			}
		               		}
		               				               		
		               		if(p>=2 && p==sanpham_mod.tinhsoTrang_NSP(madongsp, manhomsp, 6)){
		               			%>
		               			<a
											href="Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>&p=<%=p-1%>"
											class="continue" style="color: #fff; text-decoration: none;">
											Lùi<<</a>
										
		               			<%
		               		}
		               		
		               		if(sanpham_mod.tinhsoTrang_NSP(madongsp, manhomsp, 6)>p)
		               		{
		               	%>
										<a
											href="Chitietnhomsanpham.jsp?madongsp=<%=madongsp%>&manhomsp=<%=manhomsp%>&p=<%=p+1%>"
											class="continue" style="color: #fff; text-decoration: none;">>>
											Xem thêm</a>
											
										<%
		               		} 
		               	%>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>