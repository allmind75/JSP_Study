<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>req1 JSP</title>
</head>
<body>
	<h1>req1.jsp</h1>
	<%
		String data1 = (String) request.getAttribute("ReqData1");
		String data2 = request.getParameter("ReqData2");

		request.setAttribute("ReqData3", data1);

		RequestDispatcher rd = request.getRequestDispatcher("req2.jsp");
		rd.forward(request, response);
	%>

	request data1 :
	<%=data1%><br> request data2 :
	<%=data2%><br>
</body>
</html>