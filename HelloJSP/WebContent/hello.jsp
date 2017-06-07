<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>First JSP Page</h1>

	<%
		int sum = 0;
		for (int i = 0; i < 10; i++) {
			sum += add(i, i+1);
		}
	%>

	<%!
	public int add(int a, int b) {
		return a + b;
	}
	%>
	
	<p>결과 : <%=sum %></p>
	
	<% 
		response.sendRedirect("form.jsp");
	%>
	
</body>
</html>