<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<!-- 
		request 내장 객체
		- 이전 페이지(.jsp)에서 다음 페이지(.jsp)로 이동할때 값을 전달함
		- 값을 전달하는 방식에는 get, post 2가지 방식
		
		get
		- 값이 주소에 노출되서 전송
	
		post
		- 값을 숨겨서 전송
		
		get, post 방식 - http://mommoo.tistory.com/60
	 -->
	
	<h1>아래의 링크를 클릭하면 JSP 에서 request 내장 객체가 생성된다.</h1>
	<a href="request.jsp?test1=100&test2=200">링크</a>
	<!-- 
		get 
		- request.jsp?test1=100 	: test1 이름으로 100 전달
		- request.jsp?test1=100&test2=200 	: &로 값 구분, test1 이름으로 100, test2 이름으로 200 전달
	 -->
	 
	 	
	<h1>form tag를 이용해서 값 전달</h1>
	<form action="form_request.jsp" method="get">
		<input type="text" name="name1">
		<input type="text" name="name2">
		
		<!-- select에서 선택한 value 가 전달 -->
		<select name="op">
			<option value="+">덧셈</option>	
			<option value="-">뺄셈</option>	
			<option value="*">곱셈</option>	
			<option value="/">나눗셈</option>	
		</select>
	
		<input type="submit" value="값 전달">
	</form>
	
	

</body>
</html>