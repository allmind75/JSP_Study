<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.Member"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="db.BoardDAO"%>
<%@ page import="db.BoardDTO"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP04</title>
<style>
table {
	width: 80%;
	height: 40%;
	text-align: center;
	margin: 0 auto;
	text-align: center;
}

table caption {
	font-size: 35px;
	font-weight: bold;
	padding: 20px
}

table thead tr {
	background: #ff5b5b;
	color: #fff;
	height: 60px;
}

table tbody {
	background: #03c3c7;
	color: #fff;
	background: #03c3c7;
	font-size: 18px;
}
</style>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> list = dao.select();
	%>

	<div>
		<table border=1>
			<caption>MC회사 사원 정보</caption>
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (list != null) {
						for (BoardDTO m : list) {
				%>
				<tr>
					<td><%=m.getTitle() %></td>
					<td><%=m.getContent() %></td>
					<td><%=m.getCount() %></td>
					<td><%=m.getReg_date() %></td>
				</tr>
				<%
						}
					} else {
						out.print("list null!!");
					}
				%>
			</tbody>


		</table>
	</div>
</body>
</html>