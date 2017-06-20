<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="dto" class="db.Dto" />
	<jsp:setProperty property="*" name="dto" />  <!-- request로 받은 값들을 DTO에 있는 이름이 같은 변수들에 저장 -->


	<%
		Dao dao = Dao.getInstance();
		dao.insert(dto);
	%>

	<h2>회원가입완료</h2>
	<h2>
		<a href="index.jsp">로그인 화면으로</a>
	</h2>
</body>
</html>