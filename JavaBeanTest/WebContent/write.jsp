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


<!-- ��ü ���� -->
<jsp:useBean id="BD" class="member.BoardData" scope="request"></jsp:useBean>

<!-- ��ü�� ���� ����, property="*" -> ���� ���� �Ѿ���� �����͸� ������ ���� �̸��� ���� �ڹٺ� ��ü �ʵ忡 ����-->
<jsp:setProperty name="BD" property="*"></jsp:setProperty>

<!--�ٸ� jsp�� �ڹٺ� ��ü ����-->
<jsp:forward page="view.jsp"></jsp:forward>

</body>
</html>