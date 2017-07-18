<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
	</head>

	<body>
	
<%
	//String saveDir = application.getRealPath("/upload");
    String saveDir = "C:/upload";
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";

	System.out.println("파일 저장 경로 :"+saveDir);
	
	MultipartRequest multipartRequest
	= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	
    out.write("이름 : " + multipartRequest.getParameter("name") + "<br>");
    out.write("파일 : " + multipartRequest.getParameter("file") + "<br>"); //null 값을 갖는다.
    out.write("업로드파일명 : " + multipartRequest.getFilesystemName("file") + "<br>");
    out.write("원래파일명 : " + multipartRequest.getOriginalFileName("file") + "<br>");
    
    File file = multipartRequest.getFile("file");
%>


	</body>
</html>