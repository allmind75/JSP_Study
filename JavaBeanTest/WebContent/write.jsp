<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>write.jsp</title>
</head>
<body>


<jsp:useBean id="BD" class="member.BoardData" scope="request"></jsp:useBean>

<jsp:setProperty name="BD" property="*"></jsp:setProperty>

<jsp:forward page="view.jsp"></jsp:forward>

</body>
</html>