<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	text-align: center;
}
</style>
</head>
<body>

	<%
		/*
		아래와 같은 사원 이름이 주어졌을때 사원이름을 HTML에 출력하시오.(배열과 for 이용)
		강호동
		유재석
		신동엽
		전현무
		홍길동
		*/

		String[] name = new String[] { "강호동", "유재석", "신동엽", "전현무", "홍길동" };
	%>

	<table border=1>
		<caption>사원 이름 출력</caption>
		<colgroup>
			<col width="30%">
			<col width="*">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < name.length; i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=name[i]%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>