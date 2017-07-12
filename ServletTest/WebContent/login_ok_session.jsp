<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 메뉴</title>
</head>
<body>
	<h1>로그인 성공</h1>
	<%
		String id = (String) session.getAttribute("UserID");
	
		String rId = (String) request.getParameter("id");
	%>
	<%=id %> 님이 로그인 성공<br>
	session을 이용해서 id 값을 전달<br>
	id : <%=rId %><br>
	<a href="index.jsp">HOME</a>
</body>
</html>