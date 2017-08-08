<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Check</title>
</head>
<body>

<%

	String id = (String)session.getAttribute("LOGIN");

	if(id != null) {
		out.println("로그인중");
	} else {
		out.println("로그아웃 상태");
	}
%>
</body>
</html>