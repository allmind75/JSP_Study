<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="db.DAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dto" class="db.DTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	DAO dao = DAO.getInstance();
	dao.insert(dto);	
%>
<h2>글 저장 완료</h2>
<a href="main.jsp">목록으로</a>
</body>
</html>