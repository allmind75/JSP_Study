<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.MemberDAO"%>
<%@ page import="db.MemberDTO"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();

		dto.setId(id);
		dto.setPw(pw);

		try {
			if (dao.login(dto)) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("fail.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>