<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.HOADON_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String tungay=request.getParameter("tungay");
	String denngay=request.getParameter("denngay");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thống kê doanh thu từ ngày <%=tungay %> đến ngày <%=denngay %></title>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>
		Thống kê doanh thu từ ngày
		<%=tungay %>
		đến ngày
		<%=denngay %></h2>
	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">Ngày</th>
				<th class="Text">Doanh thu</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							ResultSet dsDoanhthu=null;
            							HOADON_MOD hoadon_mod=new HOADON_MOD();
            							if(tungay!=null&& denngay!=null)
            							{
            							dsDoanhthu=hoadon_mod.ThongkedoanhthutheoNgay(tungay, denngay);
            							if(dsDoanhthu!=null)
            							{
            								while(dsDoanhthu.next())
            								{
            									String ngay=dsDoanhthu.getString(1);
            									int doanhthu=dsDoanhthu.getInt(2);
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=ngay %></td>
				<td class="Text"><fmt:formatNumber value="<%=doanhthu %>" minFractionDigits="0"/> đ</td>
			</tr>

			<%
		            								}
		            							}
            							}
						                    %>
			<tr class="trOdd">
				<td><b> Tổng doanh thu</b></td>
				<td>
					<%
						           				int tong=0;
						           				if(tungay!=null&& denngay!=null)
		            							{
		            								tong=hoadon_mod.TinhtongDoanhthu(tungay, denngay);
		            							}
						           				%> <b><fmt:formatNumber value="<%=tong %>" minFractionDigits="0"/> đ</b>
				</td>
			</tr>
			<tr>
				<td class="Control" colspan="3">
					<ul>

						<li><a class="print"
							href="../Inbaocao.do?tungay=<%=tungay %>&denngay=<%=denngay %>&id=3"
							title="In Thống kê" target="_blank">In thống kê</a></li>
						<li><a class="uback" href="Thongkedoanhthutheongay.jsp"
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