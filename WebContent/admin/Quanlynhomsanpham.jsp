<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý nhóm sản phẩm</title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Quản lý nhóm Sản Phẩm</h2>
<p class="thongbao" name="thongbao" id="thongbao" value="<%out.print(request.getAttribute("thongbao"));%>"></p>
	<form action="" method="post" novalidate="novalidate">
		<div class="clearfix"></div>
		<div class="Control">
			<ul>
				<li><a class="vadd" href="Themnhomsanpham.jsp">Thêm</a></li>
				<li><a class="vrefresh" href="Quanlynhomsanpham.jsp">Refesh</a></li>
			</ul>
		</div>
	</form>

	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã nhóm sản phẩm</th>
				<th class="Text">Tên nhóm Sản phẩm</th>
				<th class="Text">Ghi chú</th>
				<th class="Function">Chức năng</th>
			</tr>
		</tbody>
		<tbody>
			<%
				NHOMSANPHAM_MOD nhomsanpham_mod = new NHOMSANPHAM_MOD();
				ResultSet dsNSP = nhomsanpham_mod.DanhsachNhomSanPham();
				if (dsNSP != null) {
					while (dsNSP.next()) {
						String manhomsp = dsNSP.getString("MANHOMSP");
						String tennhomsp = dsNSP.getString("TENNHOMSP");
						String ghichu = dsNSP.getString("GHICHUNSP");
			%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=manhomsp%></td>
				<td class="Text"><%=tennhomsp%></td>
				<td class="Text">
					<%
						if (ghichu != null) {
									out.print(ghichu);
								}
					%>
				</td>
				
				<td class="Function"><strong> 
				<a class="vedit"
						href="Suanhomsanpham.jsp?manhomsp=<%=manhomsp%>"
						title="Chỉnh sửa">
				</a> 
				<a href="Suanhomsanpham.jsp?manhomsp=<%=manhomsp%>" style="color:blue;">Sửa</a>
						<input type="hidden" value="xoa" name="key">
				<a class="vdelete"
						href="../Nhomsanpham.do?manhomsp=<%=manhomsp%>" title="Xóa"
						onclick="DeleteConfirm()"></a>
				<a href="../Nhomsanpham.do?manhomsp=<%=manhomsp%>" style="color:red;" onclick="DeleteConfirm()">Xóa</a>						
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
		function Get(idname) {
			if (document.getElementById) {
				return document.getElementById(idname);
			} else if (document.all) {
				return document.all[idname];
			} else if (document.layers) {
				return document.layers[idname];
			} else {
				return null;
			}
		}
		function toggleXPMenu(block) {
			var CloseImage = "imagesAdmin/closed.gif";
			var OpenImage = "imagesAdmin/open.gif";
			var divid = block;
			var img = "img" + block;
			if (Get(divid).style.display == "") {
				Get(divid).style.display = "none";
				Get(img).src = OpenImage;
				return false;
			} else {
				Get(divid).style.display = "";
				Get(img).src = CloseImage;
				return false;
			}
		}
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