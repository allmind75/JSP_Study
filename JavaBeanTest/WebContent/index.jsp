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
id : JSP 페이지에서 사용될 자바빈 클래스의 객체 이름
class : 자바빈으로 사용될 자바 클래스 이름
scope : 자바빈 객체를 사용할 수 있는 공간(page, request, session, application)

<scope>
page : 현재 JSP 페이지
request : Request 최종 포워딩되는 페이지 까지
session : Session 내장 객체가 유지 될 때 까지
application : 웹컨테이너가 종료 될 때 까지
 -->


<jsp:useBean id="meminfo" class="member.MemberInfo" scope="page"></jsp:useBean>

<!-- 
<%
	meminfo.setAge(10);
	meminfo.setName("Hwanho");
	
	out.println("이름 : " + meminfo.getName() + "<br>");
	out.println("나이 : " + meminfo.getAge() + "<br>");
%>
-->

<!-- setProperty, getProperty -->
<jsp:setProperty name="meminfo" property="age" value="10"></jsp:setProperty>
<jsp:setProperty name="meminfo" property="name" value="Hwanho"></jsp:setProperty>

이름 : <jsp:getProperty property="name" name="meminfo"/><br>
나이 : <jsp:getProperty property="age" name="meminfo"/><br>


</body>
</html>