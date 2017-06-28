<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	background: #000;
	color: #fff;
}
h1 {
	text-align: center;
	color: #fff;
	border-bottom: 1px solid #fff;
}
table, tr, td {
	border: 1px solid #fff;
}
td {
	text-align: center;
}
</style>
</head>
<body>

	<h1>게시판</h1>
	<%
		int num = 1;
		String title = "오늘의 날씨가 너무 덥다 춥다";
		String writer = "관리자";
		int count = 1;
		String date = "2017-06-28";
	%>
	<table>
		<colgroup>
			<col width="10%">
			<col width="*">
			<!-- "*"  : 100%에서 사용 후 남은 공간 사용-->
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < 20; i++) {
			%>
			<tr>
				<td><%=i+1%></td>
				<td><%=title%></td>
				<td><%=writer%></td>
				<td><%=count%></td>
				<td><%=date%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>