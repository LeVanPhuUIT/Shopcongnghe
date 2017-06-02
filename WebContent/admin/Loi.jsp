<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đã có lỗi xảy ra</title>
</head>
<body>
	<%
	String TenKH = request.getParameter("loi");
	byte[] bytes = TenKH.getBytes(StandardCharsets.ISO_8859_1);
	TenKH = new String(bytes, StandardCharsets.UTF_8);
	%>
	<p><%=TenKH %></p>
</body>
</html>