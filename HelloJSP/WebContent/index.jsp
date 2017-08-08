<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.BoardDTO" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP TEST</title>
</head>
<body>

<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<BoardDTO> list = null;
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/java";
	String user = "root";
	String pw = "admin1214";
	String sql = "select title, content, count, reg_date from board";
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, pw);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		list = new ArrayList<BoardDTO>();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setCount(rs.getInt("count"));
			dto.setReg_date(rs.getString("reg_date"));
			list.add(dto);			
		}
	} catch(ClassNotFoundException e) {
		
	} catch(SQLException e1) {
		
	} finally {
		rs.close();
		stmt.close();
		con.close();
	}
%>

<table border=1>
	<colgroup>
		<col width="10%">
		<col width="*">
		<col width="10%">
		<col width="10%">
	</colgroup>
	<thead>
		<th>제목</th>
		<th>내용</th>
		<th>조회수</th>
		<th>등록일</th>
	</thead>
	<tbody>
		<%
			for(BoardDTO d: list) {
		%>
		<tr>
			<td><%=d.getTitle() %></td>
			<td><%=d.getContent() %></td>
			<td><%=d.getCount() %></td>
			<td><%=d.getReg_date() %></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>

</body>
</html>