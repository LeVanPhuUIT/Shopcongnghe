<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
	String tukhoa=request.getParameter("q");
	SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
%>
<div id='body-wrapper'>
	<div id='outer-wrapper'>
		<div id='wrap2'>
			<div id='content-wrapper'>
				<div id='main-wrapper' style="margin-top: 25px;">
					<div class='home_navigation' id="ao">
						<h1 class='our_portfolio'
							style="font-family: Timenewroman; font-size: 34px; color: green;">
							Kết quả tìm kiếm cho:
							<%=tukhoa %></h1>
						<span class='line-home'></span>

					</div>

					<div class="new_products">
						<%
					
               		ResultSet dskq=sanpham_mod.TimSanphamKhachhang(tukhoa);
               		if(dskq!=null)
               		{
               			while(dskq.next())
               			{
               				String masp=dskq.getString("MASP");
               				String tensp=dskq.getString("TENSP");
               				String hinhanh=dskq.getString("HINHANH");
               				int giasp=dskq.getInt("GIASP");
               %>

						<div class="new_prod_box">
							<div class="new_prod_bg">

								<span class="new_icon"><img src="Images/new_icon.gif" />
								</span>

								<div class="new_prod_img">
									<a href="chitietsanpham.jsp?masp=<%=masp%>"><img
										src="hinhanh/<%=hinhanh%>" class="thumb" /></a> <a
										href="chitietsanpham.jsp?masp=<%=masp%>" style="width: 250px;"><%=tensp %></a>
									<a href="chitietsanpham.jsp?masp=<%=masp%>"
										style="width: 250px; color: red; font-size: 20px; font-family: OpenSans-Bold">Giá:<fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>đ</a>
								</div>
							</div>
						</div>

						<%
               			}
               		}
                %>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>