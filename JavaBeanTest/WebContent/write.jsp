<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>write.jsp</title>
</head>
<body>


<!-- 객체 생성 -->
<jsp:useBean id="BD" class="member.BoardData" scope="request"></jsp:useBean>

<!-- 객체에 값을 설정, property="*" -> 폼을 통해 넘어오는 데이터를 폼에서 같은 이름을 갖는 자바빈 객체 필드에 저장-->
<jsp:setProperty name="BD" property="*"></jsp:setProperty>

<!--다른 jsp로 자바빈 객체 전달-->
<jsp:forward page="view.jsp"></jsp:forward>

</body>
</html>