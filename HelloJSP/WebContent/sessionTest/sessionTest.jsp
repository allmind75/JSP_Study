<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세션</title>
</head>
<body>

세션 아이디 : <%= session.getId() %><br/>					
세션 생성 시각 : <%= session.getCreationTime() %><br/>
세션 최종 접근 시각 : <%= session.getLastAccessedTime() %><br/>

</body>
</html>