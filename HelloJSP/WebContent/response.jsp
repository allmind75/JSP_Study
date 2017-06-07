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
1.응답 헤더 정보의 처리
addDataHeader(String name, long date) : name 헤더에 date를 추가
addHeader(String name, String value) : name 헤더에 value를 값으로 추가
addIntHeader(String name, int value) : name 헤더에 정수 값 value를 추가

setDateHeader(String name, long date) : name 헤더의 값을 date로 변경
setHeader(String name, String value): name 헤더의 값을 value로 변경
setIntHeader(String name, int value) : name 헤더의 값을 정수값 value로 변경

containsHeader(String name) : 이름이 name인 헤더를 포함하면 true, 아니면 false 리턴

2. 다른 페이지로 강제 이동
response.sendRedirect("name.jsp");      : name.jsp 페이지로 이동

 -->
</body>
</html>