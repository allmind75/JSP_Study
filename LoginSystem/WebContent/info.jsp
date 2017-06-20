<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="db.Dto" scope="page"></jsp:useBean>

	<%
		Dao dao = Dao.getInstance();
		String id = (String) session.getAttribute("ID");

		if (id != null) {
			db.Dto memberInfo = dao.selectMemberInfo(id);
			dto.setId(memberInfo.getId());
			dto.setName(memberInfo.getName());
			dto.setPhone(memberInfo.getPhone());
			dto.setEmail(memberInfo.getEmail());
		}
	%>
	<form action="changeInfo.jsp" method="post">
		<table border=1>
			<tr>
				<th>아이디</th>
				<td><jsp:getProperty property="id" name="dto" /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><jsp:getProperty property="name" name="dto" /></td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><jsp:getProperty property="phone" name="dto" /></td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><jsp:getProperty property="email" name="dto" /></td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="1"><input type="submit" value="수정"></td>
				<td colspan="2"><a href="index.jsp">처음으로</a></td>
			</tr>
		</table>
	</form>

</body>
</html>