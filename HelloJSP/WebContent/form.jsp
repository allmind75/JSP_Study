<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>form</title>
</head>
<body>

<form action="process.jsp" method="post">
	이름 : <input type="text" name="name"><br/>
	전화번호 : <input type="text" name="phone"><br/>
	
	<input type="submit" value="확인">
	<input type="reset" value="취소">
</form>
</body>
</html>