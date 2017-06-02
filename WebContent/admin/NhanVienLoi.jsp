<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%String tenLoi=request.getParameter("tenloi"); %>
		<h1>
			<font color="red"><%=tenLoi %></font>
		</h1>
		Click<a href="admin/DangNhap.jsp">here</a>to try agains<br /> Click<a
			href="admin/NhanVienThemMoi.jsp">Register</a>to register new account<br />
	</div>
</body>
</html>