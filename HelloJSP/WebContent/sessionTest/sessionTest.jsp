<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>技记</title>
</head>
<body>

技记 酒捞叼 : <%= session.getId() %><br/>					
技记 积己 矫阿 : <%= session.getCreationTime() %><br/>
技记 弥辆 立辟 矫阿 : <%= session.getLastAccessedTime() %><br/>

</body>
</html>