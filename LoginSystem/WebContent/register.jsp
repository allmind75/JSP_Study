<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

		String id = "'" + request.getParameter("id") + "'";
		String pass = "'" + request.getParameter("pass") + "'";
		String name = "'" + request.getParameter("name") + "'";
		String phone = "'" + request.getParameter("phone") + "'";
		String email = "'" + request.getParameter("email") + "'";

		String sql = "insert into member2 values(" + id + "," + pass + "," + name + "," + phone + "," + email + ","
				+ "now()" + ");";
				
	%>

<%
	Connection con;
	Statement stm;
	int rs;
	
	String URL = "jdbc:mysql://localhost:3306/java";
	String user = "root";
	String pw = "admin1214";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, user, pw);
		stm = con.createStatement();
		rs = stm.executeUpdate(sql);
		
		if(rs == 1) {
			out.print("<h3>회원가입성공</h3>");
		} else {
			out.print("<h3>이미 가입된 회원인지 확인해 주세요</h3>");
		}
	} catch (Exception e) {
		out.print("<h3>회원가입 실패</h3>");
	}
	out.print("<h3><a href=\"index.jsp\">로그인 화면으로</a></h3>");

%>
</body>
</html>