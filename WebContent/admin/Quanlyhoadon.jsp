<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.HOADON_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Quản lý Hóa đơn</title>

<script src="js/jquery.js"></script>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Quản lý Hóa đơn</h2>
	<form action="../Hoadon.do" method="post" novalidate="novalidate">
		<div class="TopSearch">
			<form action="../Hoadon.do" method="post">
				<lable for="srch" class="lablesearch"> Tìm kiếm</lable>
				<ul>
					<li><div class="inputbutton">
							<input checked="checked" id="searchby" class="radio"
								name="searchby" type="radio" value="tenkh"> Tên khách
							hàng
						</div></li>
					<li>
						<div class="inputbutton">
							<input id="searchby" class="radio" name="searchby" type="radio"
								value="mahd" /> Mã hóa đơn
						</div>
					</li>
					<li><input id="srch" name="search" placeholder="Searching"></li>
					<input type="submit" value="Tìm kiếm" />
				</ul>
				<div class="clearfix"></div>
			</form>

			<form action="" method="post" novalidate="novalidate">
				<div class="clearfix"></div>
				<div class="Control">
					<ul>
						<li><a class="vrefresh" href="Quanlyhoadon.jsp">Refesh</a></li>
					</ul>
				</div>
			</form>

			<table class="TableView" border="1" id="myTable">
				<tbody>
					<tr class="trHeader">
						<th class="CheckBoxsmall">Mã Hóa đơn</th>
						<th class="Text">Tên Nhân viên</th>
						<th class="Text">Tên Khách hàng</th>
						<th class="Text">Ngày đặt hàng</th>
						<th class="Text">Trị giá</th>
						<th class="Function">Chức năng</th>
					</tr>
				</tbody>
				<tbody>
					<%
            							request.setCharacterEncoding("UTF-8");
									  	String getpage =request.getParameter("p");
									  	String searchby=request.getParameter("searchby");
									  	String keyword=request.getParameter("search");
									  	int p=1;
									  	if(getpage!=null)
									  	{
									  		p=Integer.parseInt(getpage);
									  	}
            							HOADON_MOD hoadon_mod=new HOADON_MOD();
            							ResultSet dsHD=null;
            							if(searchby!=null)
            							{
            								if(searchby.equals("mahd"))
            								{
            									dsHD=hoadon_mod.TimHoadonMahd(keyword);
            								}
            								else
            								{
            									dsHD=hoadon_mod.TimHoadonTenKh(keyword);
            								}
            							}
            							else
            							{
            								dsHD=hoadon_mod.Danhsachhoadon_Trang(10,p);
            							}
									  	if(dsHD!=null)
									  	{
									  		while(dsHD.next())
									  		{
									  			String mahd=dsHD.getString(1);
									  			String tenkh=dsHD.getString(5);
									  			String tennv=dsHD.getString(2);
									  			String ngayhd=dsHD.getString(3);
									  			int trigia=dsHD.getInt(4);
            						%>
					<tr class="trOdd">

						<td class="CheckBoxsmall"><%= mahd %></td>
						<td class="Text"><%=tennv %></td>

						<td class="Text"><%=tenkh %></td>
						<td class="Text"><%= ngayhd %></td>
						<td class="Text"><fmt:formatNumber value="<%=trigia %>" minFractionDigits="0"/> đ</td>
						<td class="Function"><strong> <a class="views"
								href="Chitiethoadon.jsp?mahd=<%=mahd %>"
								title="Xem chi tiết đơn hàng"></a>

						</strong></td>
					</tr>
					<%
									  				}
									  			}
						                   %>
				</tbody>
				</td>
				</tr>
			</table>
			<!--Code phân trang-->
			<div class="pagingContainer">
				<b color="white">Trang : </b>
				<%
                int n=hoadon_mod.tinhSotrang(10);
                for(int i=1;i<=n;i++)
                {
                	%>
				<a href="Quanlyhoadon.jsp?p=<%=i %>"><b><%=i %></b></a>
				<%
                }
                %>
			</div>
			<!-- cod phân trang -->
		</div>
		</div>

		<script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>
		<script type="text/javascript">
    function DeleteConfirm() {

        if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?"))
            return true;
        else
            return false;
    }

    </script>
		</body>
</html>