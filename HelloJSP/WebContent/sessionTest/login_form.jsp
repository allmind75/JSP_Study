<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session을 이용한 로그인</title>
</head>
<body>

	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id"><br/>
		비밀번호 : <input type="password" name="pw"><br/>
		<input type="submit" value="확인">
	</form>
	
</body>
</html>