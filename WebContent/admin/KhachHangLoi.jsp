<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Model.KHACHANG_MOD"%>
<%
	String hanhDong = request.getParameter("hanhdong");
	if (hanhDong.equals("kiemtratendangnhap")) {
		String TenDNKH = request.getParameter("TenDNKH");
		KHACHANG_MOD kh = new KHACHANG_MOD();
		int KiemTra = kh.kiemTraTrungTenDangNhap(TenDNKH);
		if (KiemTra > 0) {
			out.println("Tên đăng nhập đã tồn tại!");
		}
	}
	if (hanhDong.equals("kiemtraemail")) {
		String EmailKH = request.getParameter("EmailKH");
		KHACHANG_MOD kh = new KHACHANG_MOD();
		int KiemTra = kh.kiemTraTrungEmail(EmailKH);
		if (KiemTra > 0) {
			out.println("Email đã tồn tại!");
		}
	}
%>
