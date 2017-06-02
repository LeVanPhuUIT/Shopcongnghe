<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.THONGTINCUAHANG_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cấu hình trang web</title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Cấu hình trang web</h2>

	<form action="" method="post" novalidate="novalidate">
		<div class="clearfix"></div>
		<div class="Control">
			<ul>
				<li><a class="vadd" href="themthongtincuahang.jsp">Thêm mới</a></li>
				<li><a class="vrefresh" href="Cauhinhtrangweb.jsp">Refesh</a></li>
			</ul>
		</div>
	</form>

	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="Text">ID</th>
				<th class="Text">Tên cửa hàng</th>
				<th class="Text">Số điện thoại</th>
				<th class="Text">Địa chỉ</th>
				<th class="Text">Email</th>
				<th class="Function">Chức năng</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							int p=1;
            							if(request.getParameter("p")!=null)
            							{
            								p=Integer.parseInt(request.getParameter("p"));
            							}
            							ResultSet tt=null;
            							THONGTINCUAHANG_MOD thongtin_mod=new THONGTINCUAHANG_MOD();
            							tt=thongtin_mod.TatcaThongtin();
            							if(tt!=null)
            							{
            								while(tt.next())
            								{
            									String ID=tt.getString(1);
            									String tencuahang=tt.getString(2);
            									String sdt=tt.getString(4);
            									String diachi=tt.getString(3);
            									String email=tt.getString(5);
            						%>
			<tr class="trOdd">


				<td class="Text"><%=ID %></td>
				<td class="Text"><%=tencuahang %></td>
				<td class="Text"><%=sdt %></td>
				<td class="Text"><%=diachi %></td>
				<td class="Text"><%=email %></td>

				<td class="Function"><strong> <input type="hidden"
						value="xoa" name="key"> <a class="vedit"
						href="Suathongtin.jsp?ID=<%=tt.getString(1) %>" title="Chỉnh sửa"></a>
						<a class="vdelete"
						href="../Thongtincuahang.do?ID=<%=tt.getString(1) %>" title="Xóa"
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

</body>
</html>