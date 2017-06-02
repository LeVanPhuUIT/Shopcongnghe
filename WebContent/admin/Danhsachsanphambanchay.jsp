<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	int thang=5;
	int nam=2014;
	if(request.getParameter("thang")!=null)
	{
		thang=Integer.parseInt(request.getParameter("thang"));
	}
	if(request.getParameter("nam")!=null)
	{
		nam=Integer.parseInt(request.getParameter("nam"));
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách 10 Sản phẩm bán chạy nhất tháng <%=thang %> năm
	<%=nam %></title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>
		Danh sách 10 Sản phẩm bán chạy nhất tháng
		<%=thang %>
		năm
		<%=nam %></h2>
	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Mã sản phẩm</th>
				<th class="Text">Tên Sản phẩm</th>
				<th class="Text">Giá</th>
				<th class="Text">Xuất xứ</th>
				<th class="Text">Số lượng bán ra</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							ResultSet dsSP=null;
            							SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
            							dsSP=sanpham_mod.TOP10SanphamBanchay(thang,nam);
            							if(dsSP!=null)
            							{
            								while(dsSP.next())
            								{
            									String masp=dsSP.getString("MASP");
            									String tensp=dsSP.getString("TENSP");
            									int gia=dsSP.getInt("GIASP");
            									String xuatxu=dsSP.getString("XUATXU");
            									int Soluongban=dsSP.getInt("SL");
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=masp %></td>
				<td class="Text"><%=tensp %></td>
				<td class="Text"><fmt:formatNumber value="<%=gia %>" minFractionDigits="0"/> đ</td>
				<td class="Text"><%=xuatxu %></td>
				<td class="Text"><%=Soluongban %></td>

			</tr>
			<%
		            								}
		            							}
						                    %>
			<tr>
				<td class="Control" colspan="5">
					<ul>

						<li><a class="print"
							href="../Inbaocao.do?thang=<%=thang %>&nam=<%=nam %>&id=2"
							title="In Thống kê" target="_blank">In thống kê</a></li>
						<li><a class="uback" href="Thongkesanphambanchay.jsp"
							title="Quay lại">Quay lại</a></li>
					</ul>
				</td>
			</tr>
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