<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<body>
	<jsp:useBean id="dto" class="db.Dto" scope="page"></jsp:useBean>
	<%
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		dto.setId(id);
		dto.setPass(pass);
	%>

	<%
		Dao dao = Dao.getInstance();
		if (dao.login(dto)) {
			session.setAttribute("ID", request.getParameter("id"));
			out.print("<h3>�α��� ����</h3>");
		} else {
			out.print("<h3>���Ե��� ���� ȸ���Դϴ�.</h3>");
		}
		out.print("<h3><a href=\"index.jsp\">ó������</a></h3>");
	%>
</body>
</html>