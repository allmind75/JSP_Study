<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠키 생성하기</title>
</head>
<body>

<%
	Cookie cookie = new Cookie("ID", "allg");	//쿠키생성
	
	//cookie.setDomain("java.sum.com");				//쿠키가 전달될 도메인 설정
	//cookie.setPath("/sub");					//쿠키 경로 설정
	//cokie.setMaxAge(60 * 60 * 24);			//쿠키 유효시간 설정: 60(초)*60(분)*24(시간) = 1일
	response.addCookie(cookie);						//쿠키전달
%>

<a href="read_cookie.jsp">쿠키 확인</a><br/>
<a href="sub/read_cookie.jsp">쿠키 경로 설정</a>

</body>
</html>