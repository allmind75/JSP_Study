<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function CheckFileType() {
		var file = document.getElementById("file2");
		var name = file.value;
		var idx = name.lastIndexOf(".");
		var ext = name.substring(idx);
		var ext2 = ext.toLowerCase(); //소문자로 바꿈

		if (ext2 == ".jpg" || ext2 == ".bmp" || ext2 == ".png") {
			return true;
		} else {
			alert("업로드 할 수 없는 파일 형식입니다..\jpg, bmp, png 을 선택해주세요");
			return false;
		}

		return false;
	}
</script>
</head>
<body>

	<h1>uploadProc.jsp</h1>
	<form action="uploadProc.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name"><br> 
		파일 : <input type="file" name="file1"><br>
		<input type="submit"name="업로드" value="업로드"><br>
	</form>


	<hr>
	<h1>upload.jsp - jpg, bmp, png 파일만 가능</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data" onsubmit="return CheckFileType();">
		<input type="file" name="file2" id="file2"><br> 
		<input type="submit" value="파일전송">
	</form>


	<hr>
	<h1>servlet</h1>
	<form action="Controller" method="post" encType="multipart/form-data">
		<input type="file" name="file3"><br>
		<input type="submit" value="파일 전송">
	</form>

</body>
</html>