<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세션 속성 사용</title>
</head>
<body>

<%
	session.setAttribute("NAME", "Hwan");		//세션 속성 설정
	session.setAttribute("ADDRESS", "Daejeon");
%>

<%
	//session.invalidate();		//세션 삭제
%>

세션 속성 설정
<a href="read_session.jsp">여기</a>를 클릭하면 설정된 속성 확인 가능
</body>
</html>