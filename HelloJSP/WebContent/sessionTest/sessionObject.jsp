<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Ӽ� ���</title>
</head>
<body>

<%
	session.setAttribute("NAME", "Hwan");		//���� �Ӽ� ����
	session.setAttribute("ADDRESS", "Daejeon");
%>

<%
	//session.invalidate();		//���� ����
%>

���� �Ӽ� ����
<a href="read_session.jsp">����</a>�� Ŭ���ϸ� ������ �Ӽ� Ȯ�� ����
</body>
</html>