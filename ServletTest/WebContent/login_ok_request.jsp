<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<h1>로그인 성공</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getAttribute("UserID");
	%>
	<%=id %> 님이 로그인 성공<br>
	request를 이용해서 값 전달
	<a href="login_ok_session.jsp">menu</a>
</body>
</html>