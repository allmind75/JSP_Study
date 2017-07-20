<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터 저장 예제</title>
</head>
<body>

	<h1>request 객체에 데이터 저장하기</h1>

	<%
		request.setAttribute("ReqData1", "홍길동");
		//RequestDispatcher rd = request.getRequestDispatcher("req1.jsp");
		//rd.forward(request, response);
	%>

	<hr>
	<h1>Session 객체에 데이터 저장하기</h1>
	<a href="setSession.jsp">session 에 데이터 저장하기</a><br>
	<a href="getSession.jsp">session 에서 데이터 가져오기</a>
	
	<hr>
	<h1>Cookie 객체에 데이터 저장하기</h1>
	<a href="addCookie.jsp">cookie 생성하기</a><br>
	<a href="getCookie.jsp">cookie 에서 데이터 가져오기</a>
</body>
</html>