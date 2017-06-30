<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<!--  request 객체 : 클라이언트의 요청정보를 제공하기 위한 내장 객체 -->
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