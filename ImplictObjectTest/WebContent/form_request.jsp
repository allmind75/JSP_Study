<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form request</title>
</head>
<body>
	<h1>form tag에서 전달받은 값 출력</h1>
	
	<%
		String name1 = request.getParameter("name1");
		String name2 = request.getParameter("name2");
		String op = request.getParameter("op");
		
		int n1 = Integer.parseInt(name1);
		int n2 = Integer.parseInt(name2);
		int result = 0;
		
		if(op.equals("+")) {
			
			result = n1 + n2;		
		} else if(op.equals("-")) {
			
			result = n1 - n2;	
		} else if(op.equals("*")) {
			
			result = n1 * n2;		
		} else if(op.equals("/")) {
			
			result = n1 / n2;
		}
	%>
	
	name1 = <%=name1%><br>
	name2 = <%=name2 %><br>
	plus = <%=op %><br><br>
	
	계산결과 : <%=name1 %> <%=op %> <%=name2 %> = <%=result%>
</body>
</html>