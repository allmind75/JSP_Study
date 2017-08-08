<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Process</title>
</head>
<body>

	<!-- 

getParameter(String name)
getParameterValues(String name) : 이름이 name인 파라미터의 모든 값을 배열로 리턴
getParameterNames(); : 웹 브라우저가 전송한 파라미터의 이름 Enumeration Type으로 리턴
getParameterMap() : Map형식으로 리턴, Map<파라미터이름, 값> <String, String[]>

 -->

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String hidden = request.getParameter("test");

		Enumeration<String> e = request.getParameterNames();
		Map<String, String[]> map = request.getParameterMap();
	%>

	<h1>login_proc.jsp</h1>
	<h2>requeset Test</h2>
	id :
	<%=id%><br> pw :
	<%=pw%><br> hidden :
	<%=hidden%><br>
	<br>

	<%
		if (map != null && e != null) {
	%>
	id-map :<%=map.get("id")[0]%><br> 
	pw-map :<%=map.get("pw")[0]%><br><br> 
	id-enumeration :<%=e.nextElement()%><br> 
	pw-enumeration :<%=e.nextElement()%><br>
	<%
		}
	%>
</body>
</html>