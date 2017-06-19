<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>
<%String ID = (String)session.getAttribute("ID"); %>
<%if(ID == null) { %>
<form action="login.jsp" method="post">
<table border = 0>
	<tr><th>아이디</th> <td><input type="text" name="id"></td></tr>
	<tr><th>비밀번호</th> <td><input type="password" name="pass"></td></tr>
	<tr><td><input type="submit" value="로그인"></td></tr>
	<tr><td><a href="register_form.jsp">회원가입</a></td></tr>
</table>
</form>
<%} else { %>
<h3>로그인 ID : <a href="info.jsp"><%=ID %></a></h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<% } %>
</body>
</html>