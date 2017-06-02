<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lỗi truy cập</title>
</head>
<body>
	<h1 h1
		style="font-family: Tahoma; font-size: 20px; text-align: center; color: red;">
		LỖI ! Bạn không có quyền Truy cập vào đường dẫn này.<br />
		<%
	
	if(request.getAttribute("canhbao")!=null)
	{
		
%>
		<h1 h1
			style="font-family: Tahoma; font-size: 18px; text-align: center; color: red;">
			<% out.print(request.getAttribute("canhbao")); %>
		</h1>
		<%
	}else
	{
%>
		Bấm vào <a href="../Dangnhap.jsp">Đây</a> để Đăng nhập lại
	</h1>
	<%} %>
</body>
</html>
