<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Servlet Test</title>
</head>
<body>

	<a href="CTRL">서블릿 링크하기(get)</a>
	
	<form action="CTRL" method="POST">
		<input type="submit" value="servlet link(post)">
	</form><br>
	
	<form method="post" action="CTRL">
		아 이 디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		<input type="hidden" name="cmd" value="login">
		<input type="submit" value="로그인">
	</form>
	<a href="register.jsp">회원가입</a>
	
</body>
</html>