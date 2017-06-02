<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.DONDATHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Quản lý Đơn hàng</title>

<script src="js/jquery.js"></script>
<style type="text/css">
.phantrang {
	color: red;
}
</style>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Quản lý Đơn hàng</h2>
	<form action="../Dathang.do" method="post" novalidate="novalidate">
		<div class="TopSearch">
			<form action="../Dathang.do" method="post">
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
								value="madh" /> Mã đơn hàng
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
						<li><a class="vrefresh" href="Quanlydonhang.jsp">Refesh</a></li>
					</ul>
				</div>
			</form>

			<table class="TableView" border="1" id="myTable">
				<tbody>
					<tr class="trHeader">
						<th class="CheckBoxsmall">Mã Đơn hàng</th>
						<th class="Text">Tên Khách hàng</th>
						<th class="Text">Ngày đặt hàng</th>
						<th class="Text">Trị giá</th>
						<th class="Text">Tình trạng</th>
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
            							DONDATHANG_MOD dondathang_mod=new DONDATHANG_MOD();
            							ResultSet dsDh=null;
            							if(searchby!=null)
            							{
            								if(searchby.equals("madh"))
            								{
            									dsDh=dondathang_mod.TimDonhangMadh(keyword);
            								}
            								else
            								{
            									dsDh=dondathang_mod.TimDonhangTenKh(keyword);
            								}
            							}
            							else
            							{
            								dsDh=dondathang_mod.Danhsachdonhang_Trang(10, p);
            							}
									  	if(dsDh!=null)
									  	{
									  		while(dsDh.next())
									  		{
									  			String madh=dsDh.getString("MADH");
									  			String tenkh=dsDh.getString("TENKH");
									  			String ngaydh=dsDh.getString("DD/MM/YYYY");
									  			int trigia=dsDh.getInt("TONGTIEN");
									  			int tinhtrang=dsDh.getInt("TINHTRANG");
								
            						%>
					<tr class="trOdd">

						<td class="CheckBoxsmall"><%= madh %></td>
						<td class="Text"><%=tenkh %></td>

						<td class="Text"><%=ngaydh %></td>
						<td class="Text"><fmt:formatNumber value="<%=trigia %>" minFractionDigits="0"/>    đ</td>
						<td class="Text">
							<% if(tinhtrang==1){out.print("Đã giao hàng");}else{ out.print("Chưa giao hàng"); }%>
						</td>
						<td class="Function"><strong>
						<a class="views"
								href="Chitietdonhang.jsp?madh=<%=madh %>"
								title="Duyệt đơn hàng">
								
						</a> 
						<a href="Chitietdonhang.jsp?madh=<%=madh %>" style="color:blue;">Duyệt</a>
						<a class="vdelete"
								href="../Dathang.do?madh=<%=madh %>" title="Hủy đơn hàng"
								onclick="DeleteConfirm()">
						</a>
						<a href="../Dathang.do?madh=<%=madh %>" " style="color:red;">Hủy</a>
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
                int pageCurent=0;
                if(request.getParameter("p")==null){
                	pageCurent=1;
                }
                else{
                	pageCurent=Integer.parseInt(request.getParameter("p"));
                }
                int n=dondathang_mod.tinhSotrang(10);
                for(int i=1;i<=n;i++)
                {
                	if(i==pageCurent)
                	{
	                	%>
				<a href="Quanlydonhang.jsp?p=<%=i %>"><b class="phantrang"><%=i %></b></a>
				<%
                	}
                	else{
                		%>
				<a href="Quanlydonhang.jsp?p=<%=i %>"><b><%=i %></b></a>
				<%
                	}
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