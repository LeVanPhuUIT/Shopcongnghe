<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Quản lý sản phẩm</title>
<style type="text/css">
.phantrang {
	color: red;
}
</style>
<script src="js/jquery.js"></script>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Quản lý Sản Phẩm</h2>
	<form action="../Sanpham.do" method="post" novalidate="novalidate">
		<div class="TopSearch">
			<lable for="srch" class="lablesearch"> Tìm kiếm</lable>
			<ul>
				<li><div class="inputbutton">
						<input checked="checked" id="searchby" class="radio"
							name="searchby" type="radio" value="tensp"> Tên Sản phẩm
					</div></li>
				<li>
					<div class="inputbutton">
						<input id="searchby" class="radio" name="searchby" type="radio"
							value="masp" /> Mã Sản phẩm
					</div>
				</li>

				<li><input id="srch" name="search" placeholder="Searching"></li>
				<input type="submit" value="Tìm kiếm" />
			</ul>
			<div class="clearfix"></div>
		</div>
	</form>

	<form action="" method="post" novalidate="novalidate">
		<div class="clearfix"></div>
		<div class="Control">
			<ul>
				<li><a class="vadd" href="ThemSanpham.jsp">Thêm</a></li>
				<li><a class="vrefresh" href="Quanlysanpham.jsp">Refesh</a></li>
			</ul>
		</div>
	</form>

	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã sản phẩm</th>
				<th class="Text">Tên Sản phẩm</th>
				<th class="Image">Ảnh Sản phẩm</th>
				<th class="Image">Giá</th>
				<th class="Image">Xuất xứ</th>
				<th class="Image">Đơn vị tính</th>
				<th class="Image">Số lượng</th>
				<th class="Function">Chức năng</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							
									  	String pageNum =request.getParameter("page");
									  	int Page=1;
									  	
									  	if(pageNum!=null)
									  	{
									  		Page=Integer.parseInt(pageNum);
									  		
									  		//phantrang="phantrang";
									  	}
            							SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
									  	ResultSet dsSp=sanpham_mod.DanhsachSanpham_Trang(Page, 6);
									  	
									  	if(dsSp!=null)
									  	{
									  		while(dsSp.next())
									  		{
									  			String masp=dsSp.getString(1);
									  			String tensp=dsSp.getString(3);
									  			String hinhanh=dsSp.getString(8);
									  			int giasp=dsSp.getInt(4);
									  			String xuatxu=dsSp.getString(6);
									  			String donvitinh=dsSp.getString(7);
									  			String soluong=dsSp.getString(9);
								
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%= masp %></td>
				<td class="Text"><%=tensp %></td>
				<td class="Image"><img src="../hinhanh/<%=hinhanh %>"
					style="width: 90px; height: 90px; margin-top: 5px;" /></td>

				<td class="Text"><fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>đ</td>
				<td class="Text"><%= xuatxu %></td>
				<td class="Text"><%= donvitinh %></td>
				<td class="Text"><%= soluong %></td>
				
				<td class="Function">
				<strong> <a class="vedit"
						href="SuaSanpham.jsp?masp=<%=masp %>" title="Chỉnh sửa"></a>
						<a href="SuaSanpham.jsp?masp=<%=masp %>" style="color:blue;">Sửa</a>
						 <input type="hidden" value="xoa" name="key"> 
						<a class="vdelete" href="../Sanpham.do?masp=<%=masp %>" title="Xóa" onclick="return DeleteConfirm()"></a>
						<a href="../Sanpham.do?masp=<%=masp %>" onclick="return DeleteConfirm()" style="color:red;">Xóa</a>
				</strong></td>
			</tr>
			<%
									  				}
									  			}
						                   %>
		</tbody>
		</td>
		</tr>
	</table> <!--Code phân trang-->

	<div class="pagingContainer">
		<b color="white">Trang : </b>
		<%
                String phantrang="";
                int pageCurent=0;
                if(request.getParameter("page")==null){
                	pageCurent=1;
                }
                else{
                	pageCurent=Integer.parseInt(request.getParameter("page"));
                }
                int n=sanpham_mod.tinhSotrang(6);
                for(int i=1;i<=n;i++)
                { 
                	if(i==pageCurent)
                	{
                
                	%>
		<a href="../Sanpham.do?page=<%=i %>"><b class="phantrang"><%=i %></b></a>
		<%
                	}
                	else{
                		
                		%>
		<a href="../Sanpham.do?page=<%=i %>"><b class=">"><%=i %></b></a>
		<%
                	}
                }
                %>
	</div> <!-- cod phân trang -->
	</div>
	</div> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script> <script type="text/javascript">
    function DeleteConfirm() {

        if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?"))
            return true;
        else
            return false;
    }

    </script>
	</body>
</html>