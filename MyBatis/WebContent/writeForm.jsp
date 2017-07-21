<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeForm</title>
</head>
<body>
	<h1>글쓰기</h1>

	<form action="write.bo" method="post">
		<table border=1>
			<colgroup>
				<col style="width: 20%">
				<col style="width: 80%">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" cols="40" rows="32" required></textarea></td>
				</tr>
			</tbody>

		</table>
		<input type="submit" value="저장">
		<input type="reset" value="다시쓰기">
	</form>

</body>
</html>