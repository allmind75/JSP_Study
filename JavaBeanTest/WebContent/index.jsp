<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 
id : JSP ���������� ���� �ڹٺ� Ŭ������ ��ü �̸�
class : �ڹٺ����� ���� �ڹ� Ŭ���� �̸�
scope : �ڹٺ� ��ü�� ����� �� �ִ� ����(page, request, session, application)

<scope>
page : ���� JSP ������
request : Request ���� �������Ǵ� ������ ����
session : Session ���� ��ü�� ���� �� �� ����
application : �������̳ʰ� ���� �� �� ����
 -->


<jsp:useBean id="meminfo" class="member.MemberInfo" scope="page"></jsp:useBean>

<!-- 
<%
	meminfo.setAge(10);
	meminfo.setName("Hwanho");
	
	out.println("�̸� : " + meminfo.getName() + "<br>");
	out.println("���� : " + meminfo.getAge() + "<br>");
%>
-->

<!-- setProperty, getProperty -->
<jsp:setProperty name="meminfo" property="age" value="10"></jsp:setProperty>
<jsp:setProperty name="meminfo" property="name" value="Hwanho"></jsp:setProperty>

�̸� : <jsp:getProperty property="name" name="meminfo"/><br>
���� : <jsp:getProperty property="age" name="meminfo"/><br>


</body>
</html>