<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>daumAPI request</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String zonecode = request.getParameter("zonecode");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
	%>
	
	<h1>daum api request</h1>
	
	6자리 우편번호 : <%=zonecode %><br>
	5자리 우편번호 : <%=postcode %><br>
	일반주소 : <%=address %><br>
	영문주소 : <%=address2 %><br>
	
	<h1>전달된 우편번호/주소는 데이터베이스에 저장됨</h1>
</body>
</html>