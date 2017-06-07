<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.Enumeration" %>
<% request.setCharacterEncoding("euc-kr");%><!-- 한글 출력 인코딩 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 

getParameter(String name)
getParameterValues(String name) : 이름이 name인 파라미터의 모든 값을 배열로 리턴
getParameterNames(); : 웹 브라우저가 전송한 파라미터의 이름 Enumeration Type으로 리턴
getParameterMap() : Map형식으로 리턴, Map<파라미터이름, 값> <String, String[]>

 -->
 
 
<% 
	String[] strArray = request.getParameterValues("phone");
	Map<String, String[]> map = request.getParameterMap();
	Enumeration<String> e = request.getParameterNames();
%>

이름 : <%=request.getParameter("name") %><br/>
전화번호 : <%=strArray[0]%><br/><br/>

getParameterNames() : <%=e.nextElement() %><br/>
getParameterNames() : <%=e.nextElement() %><br/>
getParameterMap() - 이름 : <%=map.get("name")[0] %><br/>
getParameterMap() - 전화번호 : <%=map.get("phone")[0] %><br/>


</body>
</html>