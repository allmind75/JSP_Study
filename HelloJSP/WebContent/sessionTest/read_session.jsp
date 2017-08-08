<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세션 속성값 확인</title>
</head>
<body>

NAME : <%=session.getAttribute("NAME") %><br/>			
ADDRESS : <%=session.getAttribute("ADDRESS") %><br/>

</body>
</html>