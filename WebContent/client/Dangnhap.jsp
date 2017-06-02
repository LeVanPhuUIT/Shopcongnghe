<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/login.css" type="text/css"
	media="all">
<title>Đăng nhập</title>
</head>
<body class="login login-action-login wp-core-ui  locale-en-us">
	<div id="login">
		<form name="frmDangnhap" id="frmDangnhap" action="../Dangnhapkh.do"
			method="post"
			style="border: 1px solid rgba(147, 184, 189, 0.8); background: none repeat scroll 0% 0% #F7F7F7; border: 1px solid rgba(147, 184, 189, 0.8); box-shadow: 0pt 2px 5px rgba(105, 108, 109, 0.7), 0px 0px 8px 5px rgba(208, 223, 226, 0.4) inset; border-radius: 5px;">
			<h1
				style="font-size: 28px; color: #066A75; padding: 2px 0px 30px; font-family:"
				FranchiseRegular","Arial Narrow",Arial,sans-serif;font-weight:bold;text-align:center;">Đăng Nhập</h1>
			<h1
				style="width: 100%; height: 2px; margin-top: 10px; background: -moz-linear-gradient(left center, rgba(147, 184, 189, 0) 0%, rgba(147, 184, 189, 0.8) 20%, #93B8BD 53%, rgba(147, 184, 189, 0.8) 79%, rgba(147, 184, 189, 0) 100%) repeat scroll 0% 0% transparent;"></h1>
			<p>
				<label for="Taikhoan">Tài khoản<br /> <input type="text"
					name="Taikhoan" id="Taikhoan" class="input" value="" size="20" /></label>
			</p>
			<p>
				<label for="Matkhau">Mật khẩu<br /> <input type="password"
					name="Matkhau" id="Matkhau" class="input" value="" size="20" /></label>
			</p>
			<input type="hidden" name="url"
				value="<%=request.getRequestURI().toString()%>">
				<p style="color: red">
				<%
				//HttpSession a=r
				session=request.getSession();
				/* if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao")); */
				if(session.getAttribute("thongbao")!=null) out.print(session.getAttribute("thongbao"));
				%>
			</p>
			<%-- <p style="color: red">
				<%if(request.getAttribute("thongbao")!=null) out.print(request.getAttribute("thongbao")); %>
			</p> --%>
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