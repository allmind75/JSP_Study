<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request</title>
</head>
<body>
	<!-- 
		request.getParameter(name) - name에 저장된 변수를 가져오는 메소드, 변수의 값은 String으로 리턴, 값이 없을 경우 null 리턴
	 -->
	 
	<h1>링크를 클릭해서 이동했고, 요청 정보가 request 내장객체에 있음</h1>
	
	<%
		String test1 = request.getParameter("test1");
		String test2 = request.getParameter("test2");
		
		out.println("request.getParameter(test1) : " + test1 + "<br>");
		out.println("request.getParameter(test2) : " + test2 + "<br>");
	%>
	
	
	<h1>html에서 출력</h1>
	request.getParameter(test1) = <%=test1 %><br>
	request.getParameter(test2) = <%=test2 %><br>
	
	
</body>
</html>