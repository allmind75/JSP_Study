<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<body>
<%String ID = (String)session.getAttribute("ID"); %>
<%if(ID == null) { %>
<form action="login.jsp" method="post">
<table border = 0>
	<tr><th>���̵�</th> <td><input type="text" name="id"></td></tr>
	<tr><th>��й�ȣ</th> <td><input type="password" name="pass"></td></tr>
	<tr><td><input type="submit" value="�α���"></td></tr>
	<tr><td><a href="register_form.jsp">ȸ������</a></td></tr>
</table>
</form>
<%} else { %>
<h3>�α��� ID : <a href="info.jsp"><%=ID %></a></h3>
<h3><a href="logout.jsp">�α׾ƿ�</a></h3>
<% } %>
</body>
</html>