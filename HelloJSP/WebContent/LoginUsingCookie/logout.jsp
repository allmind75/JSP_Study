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
			cookies[i].setMaxAge(0);			//��Ű����
			response.addCookie(cookies[i]);
		}
		
		out.print("<h1>�α׾ƿ�</h1>");
	} else {
		
		out.print("<h1>�α����� ���� �ϼ���</h1>");
	}

%>
</body>
</html>