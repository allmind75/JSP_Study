<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="db.Dao" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="db.Dto" scope="page"></jsp:useBean>

	<%
		String id = (String) session.getAttribute("ID");
		db.Dto memberInfo = dao.memberInfoPrint(id);
		dto.setId(memberInfo.getId());
		dto.setName(memberInfo.getName());
		dto.setPhone(memberInfo.getPhone());
		dto.setEmail(memberInfo.getEmail());
	%>
	
아이디 : <jsp:getProperty property="id" name="dto"/><br>
이름 : <jsp:getProperty property="name" name="dto"/><br>
전화번호 : <jsp:getProperty property="phone" name="dto"/><br>
이메일 : <jsp:getProperty property="email" name="dto"/><br>

</body>
</html>