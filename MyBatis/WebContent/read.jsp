<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="db.ContentDTOOut" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>READ JSP</title>
<style>
	body {background: #000; color: #fff;}
	h1, tr, td {text-align: center;}
	table { width: 600px;}
	.table-content {width: 600px;height: 600px;}
</style>
</head>
<body>
	<h1>게시판</h1>
	
	<%
		ContentDTOOut dto = (ContentDTOOut) request.getAttribute("READ");
		int num = dto.getNum();
		String title = dto.getTitle();
		String content = dto.getContent();
		int count = dto.getCount();
		Timestamp date = dto.getReg_date();
	%>	
	<div>
		<table border=1 align="center">
			<colgroup>
				<col style="width: 20%">
				<col style="width: *">
				<col style="width: 10%">
				<col style="width: 30%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=num %></td>
					<td><%=title %></td>
					<td><%=count %></td>
					<td><%=date.toString().substring(0, 10) %></td>
				</tr>
				<tr class="table-content">
					<td colspan=4><%=content %></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<button onclick="window.history.back();">뒤로가기</a>
</body>
</html>