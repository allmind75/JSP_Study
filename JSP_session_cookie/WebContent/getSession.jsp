<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getSession JSP</title>
</head>
<body>
	<h1>getSession JSP</h1>
	<%
		String name = (String) session.getAttribute("sessionData1");
	%>
	session 에서 가져온 데이터 :
	<%=name%><br>
	<a href="index.jsp">이전 페이지 가기</a>

</body>
</html>