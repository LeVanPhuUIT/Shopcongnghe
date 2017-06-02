<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="AdminIndex.jsp"></jsp:include>
<td id="col_right">
	<marquee direction="right" behavior="alternate">
		<h2>Chào mừng bạn đến với trang quản trị</h2>
	</marquee>
	<p style="color: red; font-size:70px;">
		<%if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao")); %>
	</p>
	<p style="color: red; font-size:70px;">
		<%if(request.getAttribute("thongbaoxoasanpham")!=null) out.print(request.getAttribute("thongbaoxoasanpham")); %>
	</p>
	</td>
</tr>
</table>

</div>
</div>