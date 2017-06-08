<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login State</title>
</head>
<body>


<%

	Cookie[] cookies = request.getCookies();
	boolean isLogin = false;
	
	if(cookies != null && cookies.length > 0) {
		
		for(int i=0 ; i<cookies.length ; i++) {
			
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			
			if(name.equals("ID") && value.equals("ADMIN")) {
				isLogin = true;
			}
		}
	}
	
	if(isLogin) {
		out.print("<h1>현재 로그인한 상태</h1>");
	} else {
		out.print("<h1>현재 로그인 하지 않은 상태</h1>");
	}
%>
</body>
</html>