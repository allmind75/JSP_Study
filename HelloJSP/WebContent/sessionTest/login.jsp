<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login</title>
</head>
<body>

<%
	String Did = "admin";
	String Dpw = "pass";
%>

<%
	String Uid = request.getParameter("id");
	String Upw = request.getParameter("pw");
	
	if(Did.equals(Uid) && Dpw.equals(Upw)) {
		
		session.setAttribute("LOGIN", Uid);
		out.println("로그인 성공");
	} else {
		out.println("로그인 실패");
	}
%>
</body>
</html>