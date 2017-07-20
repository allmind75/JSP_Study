<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addCookie</title>
</head>
<body>
	<h1>addCookie - 쿠키에 이름 저장하기</h1>

	<%
		String name = URLEncoder.encode("홍길동", "UTF-8");		//한글입력 처리
	
		Cookie c1 = new Cookie("name", name);
		c1.setComment("comment"); //쿠키에  설명 추가
		c1.setMaxAge(60 * 60); //쿠키 유효기간 설정, 초단위 60*60*24 = 1일

		response.addCookie(c1);
	%>
	<%
		Cookie c2 = new Cookie("address", "daejeon");
		response.addCookie(c2);
	%>
	<a href="index.jsp">이전 페이지 가기</a>

</body>
</html>