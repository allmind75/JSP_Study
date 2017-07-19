<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<h1>파일 업로드 하기</h1>
	<%
		//업로드한 파일 저장

		String saveDir = "C:/upload";
		int maxSize = 1024 * 1024 * 10; //1024byte = 1KB, 1KB * 1024 = 1MB,  => 10MB
		String encType = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, saveDir, maxSize, encType,
				new DefaultFileRenamePolicy());

		String orgName = multipartRequest.getOriginalFileName("file");
		String saveName = multipartRequest.getFilesystemName("file");

		System.out.println("업로드 파일 이름 :" + orgName);
		System.out.println("저장된 파일 이름 :" + saveName);
	%>
</body>
</html>