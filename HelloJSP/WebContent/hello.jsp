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
	
	<!--  request 객체 : 클라이언트의 요청정보를 제공하기 위한 내장 개첵 -->
	<ul>
		<!-- 클라이언트 및 요청 관련 정보 -->
		<li>클라이언트주소 : <%=request.getRemoteAddr() %></li>
		<li>요청정보 길이 : <%=request.getContentLength() %></li>
		<li>인코딩 : <%=request.getCharacterEncoding() %></li>
		<li>문서타입 : <%=request.getContentType() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>전송방식 : <%=request.getMethod() %></li>
		<li>요청 URL : <%=request.getRequestURL() %></li>
	</ul>
	
	<ul>
		<!-- 서버 관련 정보 -->
		<li>문서경로 : <%=request.getContextPath() %></li>
		<li>서버주소 : <%=request.getServerName() %></li>
		<li>서버포트 : <%=request.getServerPort() %></li>
	</ul>
	
</body>
</html>