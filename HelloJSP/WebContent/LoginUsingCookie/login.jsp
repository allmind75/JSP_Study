<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� Ȯ��</title>
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
		
		Cookie cookie = new Cookie("ID", "ADMIN");		//��Ű����
		response.addCookie(cookie);
		out.print("<h1>�α��� ����!</h1>");
	} else {
		out.print("<h1>�α��� ���� ..</h1>");
	}
	
%>

</body>
</html>