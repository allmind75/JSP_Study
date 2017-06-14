<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!--  write.jsp 에서 전달 받은 객체 -->
<jsp:useBean id="BD" class="member.BoardData" scope="request"/>

<table border=1>
	<tr><th>제목</th><td><jsp:getProperty name="BD" property="title"/></td></tr>
	<tr><th>작성자</th><td><jsp:getProperty name="BD" property="writer"/></td></tr>
	<tr><th>내용</th><td><jsp:getProperty name="BD" property="text"/></td></tr>
	<tr><th>비밀번호</th><td><jsp:getProperty name="BD" property="pass"/></td></tr>

</table>
</body>
</html>