<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.Enumeration" %>
<% request.setCharacterEncoding("euc-kr");%><!-- �ѱ� ��� ���ڵ� ���� -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 

getParameter(String name)
getParameterValues(String name) : �̸��� name�� �Ķ������ ��� ���� �迭�� ����
getParameterNames(); : �� �������� ������ �Ķ������ �̸� Enumeration Type���� ����
getParameterMap() : Map�������� ����, Map<�Ķ�����̸�, ��> <String, String[]>

 -->
 
 
<% 
	String[] strArray = request.getParameterValues("phone");
	Map<String, String[]> map = request.getParameterMap();
	Enumeration<String> e = request.getParameterNames();
%>

�̸� : <%=request.getParameter("name") %><br/>
��ȭ��ȣ : <%=strArray[0]%><br/><br/>

getParameterNames() : <%=e.nextElement() %><br/>
getParameterNames() : <%=e.nextElement() %><br/>
getParameterMap() - �̸� : <%=map.get("name")[0] %><br/>
getParameterMap() - ��ȭ��ȣ : <%=map.get("phone")[0] %><br/>


</body>
</html>