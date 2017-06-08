<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>logout</title>
</head>
<body>


<%

	Cookie[] cookies = request.getCookies();

	if(cookies != null && cookies.length > 0) {
		
		for(int i=0 ; i<cookies.length ; i++) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
		
		out.print("<h1>로그아웃</h1>");
	} else {
		
		out.print("<h1>로그인을 먼저 하세요</h1>");
	}

%>
</body>
</html>