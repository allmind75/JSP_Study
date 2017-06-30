<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제 06, form tag</title>
</head>
<body>
	<form method=get action="JSP06_login_proc_request.jsp">
		<input type="text" name="id" placeholder="아이디입력" autofocus required>
		<input type="password" name="pw" placeholder="비밀번호입력">
		<input type="hidden" name="test" value="1234567890">
		<input type="submit" value="로그인">
	</form>
	
	
	<a href="JSP06_login_proc_request.jsp?id=123&pw=123&test=1234567890">로그인</a>
</body>
</html>