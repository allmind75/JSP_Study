<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getCookie - Cookie 에서 데이터 가져오기</title>
</head>
<body>
	<h1>Cookie 에서 데이터 가져오기</h1>
	<%
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie c : cookies) {
				out.print("cookie name : " +  c.getName() + "<br>");
				out.print("cookie value : " + URLDecoder.decode(c.getValue(), "UTF-8") + "<br>");
				out.print("cookie comment : " + c.getComment() + "<br>");
				
				
				//쿠키 삭제하기, setMaxAge(0) 으로 설정
				if(c.getName().equals("name")) {
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
	%>
	<a href="index.jsp">이전 페이지 가기</a>

</body>
</html>