<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 
Application 객체

1. 웹 컨테이너 정보 읽어 오기

getServerInfo() : 서버 정보를 리턴
getMajorVersion() : 서버가 지원하는 서블릿 규약의 버전 앞 번호를 리턴
getMajorVersion() : 서버가 지원하는 서블릿 규약의 버전 뒷 번호를 리턴

 -->
 
 웹 컨테이너 정보 : <%=application.getServerInfo() %><br/>
 서블릿 규약 버전 : <%=application.getMajorVersion() %>. <%=application.getMinorVersion() %>.<br/>
 
 <h1>[로그 기록 예제]</h1>
 <!-- 
 log(String msg) : 로그 메시지 msg를 기록
 log(String msg, Throwable throwable) : 로그 메시지 msg와 예외 정보를 함께 기록
  -->
 
 <%
 	String basePath = System.getProperty("catalina.base");
 	application.log("my log msg 기록");
 %>
 
 로그 파일 경로 <%=basePath%>\logs
 </body>
</html>