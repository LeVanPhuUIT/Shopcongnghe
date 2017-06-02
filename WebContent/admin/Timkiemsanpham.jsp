<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Tìm kiếm sản phẩm</title>
<link rel="stylesheet" type="text/css" href="AdminStyle.css" />
<script src="js/jquery.js"></script>
</head>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Tìm kiếm Sản Phẩm</h2>
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
            							request.setCharacterEncoding("UTF-8");
            							String searchby=request.getParameter("searchby");
									  	String searchkey=request.getParameter("searchkey");
									  	SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
									  	ResultSet dsTk=null;
									  	if(searchby.equals("tensp"))
									  	{
									  	 	dsTk=sanpham_mod.TimSanphamTensp(searchkey);
									  	}
									  	else
									  	{
									  		dsTk=sanpham_mod.TimSanphamMasp(searchkey);
									  	}
									  	if(dsTk!=null)
									  	{
									  		while(dsTk.next())
									  		{
									  			String masp=dsTk.getString(1);
									  			String tensp=dsTk.getString(3);
									  			String hinhanh=dsTk.getString(8);
									  			float giasp=dsTk.getFloat(4);
									  			String xuatxu=dsTk.getString(6);
									  			String donvitinh=dsTk.getString(7);
									  			String soluong=dsTk.getString(9);
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%= masp %></td>
				<td class="Text"><%= tensp %></td>
				<td class="Image"><img src="../hinhanh/<%=hinhanh %>"
					style="width: 90px; height: 90px; margin-top: 5px;"></td>

				<td class="Text"><%=giasp %></td>
				<td class="Text"><%= xuatxu %></td>
				<td class="Text"><%= donvitinh %></td>
				<td class="Image"><%= soluong %></td>
				<td class="Function"><strong> <a class="vedit"
						href="SuaSanpham.jsp?masp=<%=masp %>" title="Chỉnh sửa"></a> <a
						class="vdelete" href="XoaSanpham.jsp?masp=<%=masp %>" title="Xóa"
						onclick="DeleteConfirm()"></a>
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