<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������Ȯ��</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="dto" class="db.Dto" />
	<jsp:setProperty property="*" name="dto" />  <!-- request�� ���� ������ DTO�� �ִ� �̸��� ���� �����鿡 ���� -->


	<%
		Dao dao = Dao.getInstance();
		dao.insert(dto);
	%>

	<h2>ȸ�����ԿϷ�</h2>
	<h2>
		<a href="index.jsp">�α��� ȭ������</a>
	</h2>
</body>
</html>