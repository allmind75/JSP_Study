<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠키값 확인</title>
</head>
<body>

<%
	 Cookie[] cookies = request.getCookies();

	for(int i=0 ; i<cookies.length ; i++) {
		
		out.print(cookies[i].getName());
		out.print(" : ");
		out.print(cookies[i].getValue());
		out.print(" : ");
		out.print(cookies[i].getDomain());
		out.print("<br/>");
	}
	
	
	//쿠키 삭제, 유효시간(.setMaxAge(0))을 0으로 설정
	/*
	for(int i=0 ; i<cookies.length ; i++) {
		
		String name = "name";
		
		if(name.equals(cookies[i].getName()) == true) {
			
			Cookie cookie = new Cookie(name, "");
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
	}
	*/
	

%>
</body>
</html>