<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body>

	<h1>파일 업로드 하기</h1>
	<form method="post" action="upload.jsp" enctype="multipart/form-data">
		파일 : <input type="file"  name="file" value="파일선택"><br>
		<input type="submit" value="파일전송">
	</form>
</body>
</html>