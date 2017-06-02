<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css" type="text/css" media="all">
<title>Đăng nhập</title>
</head>
<body class="login login-action-login wp-core-ui  locale-en-us">
	<div id="login">
		<%
	String url=request.getRequestURI();
	if(url!=null)
	{
		request.setAttribute("link", url);
	}
%>
		<form name="frmDangnhap" id="frmDangnhap" action="Dangnhap.do"
			method="post">
			<p>
				<label for="Taikhoan">Tài khoản<br /> <input type="text"
					name="Taikhoan" id="Taikhoan" class="input" value="" size="20" /></label>
			</p>
			<p>
				<label for="Matkhau">Mật khẩu<br /> <input type="password"
					name="Matkhau" id="Matkhau" class="input" value="" size="20" /></label>
			</p>
			<p color="red">
				<%
		request.setCharacterEncoding("UTF-8");
		if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao"));%>
			</p>
			<p class="forgetmenot">
				<label for="ghinho"><input name="ghinho" type="checkbox"
					id="ghinho" value="forever" /> Ghi nhớ</label>
			</p>
			<p class="submit">
				<input type="submit" name="wp-submit" id="wp-submit"
					class="button button-primary button-large" value="Đăng nhập" />
			</p>
		</form>
	</div>
</body>
</html>