<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

		String id = "'" + request.getParameter("id") + "'";
		String pass = "'" + request.getParameter("pass") + "'";

		String sql = "select * from member2 where id=" + id + " and pass=" + pass + ";";
	%>

	<%
		Connection con;
		Statement stm;
		ResultSet rs;
		
		String URL = "jdbc:mysql://localhost:3306/java";
		String user = "root";
		String pw = "admin1214";
		
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, user, pw);
			stm = con.createStatement();
			rs = stm.executeQuery(sql);
			
			
			
			if(rs.isBeforeFirst()) {
				session.setAttribute("ID", request.getParameter("id"));
				out.print("<h3>�α��� ����</h3>");
			} else {
				out.print("<h3>���Ե��� ���� ȸ���Դϴ�.</h3>");
			}
			
		} catch (Exception e) {
			out.print("<h3>�α��� ����</h3>");
		}
		out.print("<h3><a href=\"index.jsp\">ó������</a></h3>");
	%>
</body>
</html>