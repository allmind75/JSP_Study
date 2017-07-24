<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Timestamp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<style>
	tr, td {text-align: center;}
</style>
</head>
<body>

	<%
		List list = (List) request.getAttribute("LIST");
	%>

	<h1>게시판</h1>
	<table border=1>
		<colgroup>
			<col style="width: 10%">
			<col style="width: 20%">
			<col style="width: 50%">
			<col style="width: 10%">
			<col style="width: *">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < list.size(); i++) {
					
					HashMap rs = (HashMap) list.get(i);
					
					String title = (String) rs.get("title");
					String content = (String) rs.get("content");
					Integer count = (Integer) rs.get("count");
					Timestamp date = (Timestamp) rs.get("reg_date");
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=title %></td>
				<td><%=content %></td>
				<td><%=count %></td>
				<td><%=date.toString().substring(0,11) %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>