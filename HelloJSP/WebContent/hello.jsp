<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>First JSP Page</h1>

	<%
		int sum = 0;
		for (int i = 0; i < 10; i++) {
			sum += add(i, i+1);
		}
	%>

	<%!
	public int add(int a, int b) {
		return a + b;
	}
	%>
	
	<p>��� : <%=sum %></p>
	
	<!--  request ��ü : Ŭ���̾�Ʈ�� ��û������ �����ϱ� ���� ���� ��ý -->
	<ul>
		<!-- Ŭ���̾�Ʈ �� ��û ���� ���� -->
		<li>Ŭ���̾�Ʈ�ּ� : <%=request.getRemoteAddr() %></li>
		<li>��û���� ���� : <%=request.getContentLength() %></li>
		<li>���ڵ� : <%=request.getCharacterEncoding() %></li>
		<li>����Ÿ�� : <%=request.getContentType() %></li>
		<li>�������� : <%=request.getProtocol() %></li>
		<li>���۹�� : <%=request.getMethod() %></li>
		<li>��û URL : <%=request.getRequestURL() %></li>
	</ul>
	
	<ul>
		<!-- ���� ���� ���� -->
		<li>������� : <%=request.getContextPath() %></li>
		<li>�����ּ� : <%=request.getServerName() %></li>
		<li>������Ʈ : <%=request.getServerPort() %></li>
	</ul>
	
</body>
</html>