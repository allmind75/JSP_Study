<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��Ű �����ϱ�</title>
</head>
<body>

<%
	Cookie cookie = new Cookie("ID", "allg");	//��Ű����
	
	//cookie.setDomain("java.sum.com");				//��Ű�� ���޵� ������ ����
	//cookie.setPath("/sub");					//��Ű ��� ����
	//cokie.setMaxAge(60 * 60 * 24);			//��Ű ��ȿ�ð� ����: 60(��)*60(��)*24(�ð�) = 1��
	response.addCookie(cookie);						//��Ű����
%>

<a href="read_cookie.jsp">��Ű Ȯ��</a><br/>
<a href="sub/read_cookie.jsp">��Ű ��� ����</a>

</body>
</html>