<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글 입력</title>
</head>
<body>

<form action="write.jsp" method="post">

	<table border = 1>
		<tr><th>제목</th><td><input type="text" name="title" size="50"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="writer" size="50"></td></tr>
		<tr><th>내용</th><td><textarea rows="20" cols="50"  name="text"></textarea></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
		<tr><td colspan=2 align="center"><input type="submit" value="확인"><input type="reset" value="취소"></td></tr>
		
		
	</table>
</form>

</body>
</html>