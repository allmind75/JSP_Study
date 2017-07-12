<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	function idCheck()
	{       
		$.ajax({
			type     :"GET",					//get, post
			url      :"2.html",					//웹페이지 경로
			dataType :"html",					//url 페이지를 내부적으로 처리하고 처리한결과를 가져오는 형식
	
			 error : function()					//내부페이지를 처리중에 발생하는 에러를 알림
			 {
				alert('통신실패!!');
	         },
			 complete : function(data) 			//내부처리 완료, data는 내부페이지에서 넘겨준 값
			 {
			 
			 },
	         success : function(data)			//내부처리 성공
			 {
	            alert("통신데이터 값 : " + data) ;
				
	         }});
	
	}
	
	function idRegExpCheck() {
		var idReg = /[0-9a-zA-Z]/;
		var id = document.getElementById("id").value;
				
		for(var i=0 ; i<id.length ; i++) {
			if(id.charAt(i) == " " || idReg.test(id.charAt(i)) == false) {
				document.getElementById("idCheckText").innerHTML = "숫자 와 영어만 가능"
			} else {
				document.getElementById("idCheckText").innerHTML = "사용가능"
			}
		}
	}
	
	function SearchAddr() {
		
		var width = 600; //팝업의 너비
		var height = 700; //팝업의 높이
		var themeObj = {
				   searchBgColor: "#0B65C8", //검색창 배경색
				   queryTextColor: "#FFFFFF", //검색창 글자색

				};
		
		new daum.Postcode({
			
		    width: width, 
		    height: height,
		    theme: themeObj,
		    
			oncomplete : function(data) {
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = data.address;
            }
		}).open({
		    left: (window.screen.width/2)-(width/2),
       		top: (window.screen.height/2)-(height/2)
		});
	}
	
	function pwCheck() {

		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
				
		if(pw == "") {
			document.getElementById("pwCheckText").innerHTML = "입력안함";
		} else if (pw != pw2) {
			document.getElementById("pwCheckText").innerHTML = "비밀번호다름";
		} else {
			document.getElementById("pwCheckText").innerHTML = "비밀번호같음";
		}
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="CTRL">
		<table border="1">
			<colgroup>
				<col style="width: 150px">
				<col style="width: 600px">
			</colgroup>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" id="id" autofocus onkeyup="idRegExpCheck()"> 
						<input type="button" value="중복검사" onClick="idCheck">
						<span id="idCheckText"></span>
					</td>

				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="pw2" id="pw2"
						onkeyup="pwCheck()"> <span id="pwCheckText"></span></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="address" id="address" size="60" readonly> 
						<input type="button" value="주소검색" onClick="SearchAddr()"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="회원가입"> <input type="reset"
			value="다시쓰기"> <input type="hidden" name="cmd" value="reg">
	</form>
</body>
</html>