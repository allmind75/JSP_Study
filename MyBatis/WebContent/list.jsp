<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="db.PageOut"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<style>
tr, td {
	text-align: center;
}
</style>
</head>
<body>

	<%
		List list = (List) request.getAttribute("LIST");
		PageOut pageOut = (PageOut) request.getAttribute("PAGE");
	%>

	<h1>게시판</h1>
	<table border=1>
		<colgroup>
			<col style="width: 10%">
			<col style="width: 40%">
			<col style="width: 10%">
			<col style="width: *">
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
			<%
				for (int i = 0; i < list.size(); i++) {

					HashMap rs = (HashMap) list.get(i);

					int num = (Integer) rs.get("num");
					String title = (String) rs.get("title");
					Integer count = (Integer) rs.get("count");
					Timestamp date = (Timestamp) rs.get("reg_date");
			%>
			<tr>
				<td><%=num%></td>
				<td><%=title%></td>
				<td><%=count%></td>
				<td><%=date.toString().substring(0, 11)%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<%
		String prevPage = "list.bo?pageNum=" + pageOut.getPrevPage() + "&pageSize=10";
		String nextPage = "list.bo?pageNum=" + pageOut.getNextPage() + "&pageSize=10";
	%>

	<a href=<%=prevPage%>> << </a>
	<%
		for (int i = 0; i < pageOut.getPageCnt(); i++) {

			if (i == pageOut.getPageNum()) {
	%>
	<span style="font-size: 25px;"><%=i+1%></span>
	<%
			} else {
	%>


	<a href="list.bo?pageNum=<%=i%>&pageSize=10"><%=i + 1%></a>
	<%
			}
		}
	%>
	<a href=<%=nextPage%>> >> </a><br>
	
	
</body>
</html>