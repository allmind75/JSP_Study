<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진주투어</title>
<link rel="shortcut icon" href="images/size57.png">
<link rel="apple-touch-icon" href="images/size57.png">
<link rel="apple-touch-icon-precomposed" href="images/size114.png">
</head>
<body>
	
	<%@ include file="login.jsp" %>
	
	<script>
		setTimeout(function() {
			alert("아이디 또는 비밀번호가 틀렸거나, \n 가입되지 않은 회원입니다.");
		},500);

	</script>
</body>
</html>