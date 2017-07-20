<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>req2 JSP</title>
</head>
<body>
	<h1>req2.jsp</h1>
	<%
		String data1 = (String) request.getAttribute("ReqData1");
		String data2 = (String) request.getAttribute("ReqData2");
		String data3 = (String) request.getAttribute("ReqData3");
	%>

	index.jsp에서 전달받은 data1 :
	<%=data1%><br> req1.jsp에서 전달받은 data2 :
	<%=data2%><br> req1.jsp에서 전달받은 data3 :
	<%=data3%><br>
</body>
</html>