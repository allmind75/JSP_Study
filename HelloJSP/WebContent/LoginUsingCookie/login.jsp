<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 확인</title>
</head>
<body>

<%
	String DBid = "admin";
	String DBpw = "1234";
%>

<%

	String Uid = request.getParameter("id");
	String Upw = request.getParameter("pw");
	
	if(Uid.equals(DBid) && Upw.equals(DBpw)) {
		
		Cookie cookie = new Cookie("ID", "ADMIN");		//쿠키생성
		response.addCookie(cookie);
		out.print("<h1>로그인 성공!</h1>");
	} else {
		out.print("<h1>로그인 실패 ..</h1>");
	}
	
%>

</body>
</html>