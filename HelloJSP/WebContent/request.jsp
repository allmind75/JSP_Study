<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


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