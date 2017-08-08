<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.Member"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP04</title>
<style>
table {
	width: 80%;
	height: 40%; text-align : center;
	margin: 0 auto;
	text-align: center;
}
table caption {font-size: 35px; font-weight: bold; padding: 20px}
table thead tr {
	background: #ff5b5b;
	color: #fff;
	height: 60px;
}

table tbody {
	background : #03c3c7;
	color: #fff;
	background: #03c3c7;
	font-size: 18px;
}
</style>
</head>
<body>
	<%
		/*
		회사에 아래와 같은 사원 목록이 있다.
		순번 이름		직책	부서
		1	 강호동		부장	영업
		2	 유재석		차장	영업
		3	 신동엽		사원	마케팅
		4	 전현무		사원	마케팅
		5	 홍길동		사원	마케팅
		*/
		Member[] memberArr = new Member[] { new Member(1, "강호동", "부장", "영업"), new Member(2, "유재석", "차장", "영업"),
				new Member(3, "신동엽", "사원", "마케팅"), new Member(4, "전현무", "사원", "마케팅"),
				new Member(5, "홍길동", "사원", "마케팅") };
	
		ArrayList<Member> list = new ArrayList<Member>();
		
		for(int i=0 ; i<memberArr.length ; i++) {
			list.add(memberArr[i]);
		}
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
					<th>순번</th>
					<th>이름</th>
					<th>직책</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Member m : list) {
				%>
				<tr>
					<td><%=m.getNum()%></td>
					<td><%=m.getName()%></td>
					<td><%=m.getPosition()%></td>
					<td><%=m.getPart()%></td>
				</tr>
				<%
					}
				%>
			</tbody>


		</table>
	</div>
</body>
</html>