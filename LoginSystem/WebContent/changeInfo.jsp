<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보수정확인</title>
</head>
<body>

	<jsp:useBean id="dto" class="db.Dto" scope="page"></jsp:useBean>
	<%
		request.setCharacterEncoding("euc-kr");

		String id = (String) session.getAttribute("ID");
		if (id != null) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");

			dto.setName(name);
			dto.setPhone(phone);
			dto.setEmail(email);
			dto.setId(id);
		}
	%>

	<%
		Dao dao = Dao.getInstance();
		if (dao.changeMemberInfo(dto)) {
			out.print("<h3>회원정보 수정 성공</h3>");
		} else {
			out.print("<h3>회원정보 수정 실패</h3>");
		}
		out.print("<h3><a href=\"index.jsp\">처음으로</a></h3>");
	%>

</body>
</html>