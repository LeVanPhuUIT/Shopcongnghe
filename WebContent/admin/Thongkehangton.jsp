<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thêm mới nhóm sản phẩm</title>
<jsp:include page="AdminIndex.jsp"></jsp:include>
<td id="col_right">
	<h2>Thống kê hàng tồn</h2>
	<form action="Chitiethangton.jsp" method="post" id="thongke">
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<td class="Control" colspan="5">
						<ul>
							<li><input type="submit" name="Thongke" value="Xem thống kê"
								class="uupdate"></li>
							<li><input type="reset" name="lamlai" value="Làm lại"
								class="vrefresh"></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>
	</body>
</html>