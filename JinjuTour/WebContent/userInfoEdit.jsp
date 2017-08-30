<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>진주투어</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">

<script>
		
       //휴대폰 번호 앞자리 확인 후 select 선택
       <%String userPhone1 = (String) request.getAttribute("PHONE1");%>
       	window.onload = function() {
       		var phone = "<%=userPhone1%>
	";
		document.myform.phoneNum1.value = phone;
	}

	function pwCheck() {
		var pwReg = /[\w][`~!@#$%^&*()-_+=\|<,>.?/]{3,20}$/;
		var pw = document.getElementById("input-join-pw").value;
		var pw2 = document.getElementById("input-join-pw2").value;

		if (pw == "" || pw2 == "") {
			document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호 입력안함</font>";
			return false;
		} else if (pw != pw2) {
			document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호다름</font>";
			return false;
		} else if (pw == pw2 && pwReg.test(pw)) {
			document.getElementById("pwCheckText").innerHTML = "<font color='blue'>비밀번호같음</font>";
			return true;
		} else if (!pwReg.test(pw)) {
			document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호 4자리 이상 20자리 이하</font>";
			return false;
		}
	}

	function nameCheck() {
		//2 ~ 15자리인 한글
		var nameReg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}$/;
		var name = document.getElementById("input-join-name").value;

		if (nameReg.test(name)) {
			document.getElementById("nameCheckText").innerHTML = "<font color='blue'>사용가능</font>";
			return true;
		} else {
			document.getElementById("nameCheckText").innerHTML = "<font color='red'>한글, 2 ~ 15자만 가능</font>";
			return false;
		}

	}

	function emailCheck() {

		var emailReg = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
		var email = document.getElementById("input-join-email").value;

		if (emailReg.test(email)) {
			document.getElementById("emailCheckText").innerHTML = "<font color='blue'>사용가능</font>";
			return true;
		} else {
			document.getElementById("emailCheckText").innerHTML = "<font color='red'>이메일 형식을 확인해주세요.</font>"
			return false;
		}

	}

	function phoneCheck() {

		var phone2Reg = /[0-9]{3,4}$/;
		var phone3Reg = /[0-9]{4}$/;
		var phone2 = document.getElementById("input-phoneNum2").value;
		var phone3 = document.getElementById("input-phoneNum3").value;

		if (!phone2Reg.test(phone2)) {
			alert("숫자만 입력가능합니다.(3 ~ 4자리)");
			return false;
		}

		if (!phone3Reg.test(phone3)) {
			alert("숫자만 입력가능합니다.(4자리)");
			return false;
		}

		return true;
	}

	function validate() {
		var pw = false;
		var name = false;
		var email = false;
		var phone = false;

		pw = pwCheck();
		name = nameCheck();
		email = emailCheck();
		phone = phoneCheck();

		if (name && email & phone) {
			return true;
		} else {
			if (!pw)
				alert("비밀번호가 맞는지 확인해주세요.");
			if (!name)
				alert("이름 형식을 확인해주세요.");
			if (!email)
				alert("이메일 형식을 확인해주세요.");
			return false;
		}
	}

	function CheckFileType() {
		var file = document.getElementById("file").value;
		var idx = file.lastIndexOf(".");
		var ext = file.substring(idx).toLowerCase();

		console.log(ext);
		if (ext == ".jpg" || ext == ".bmp" || ext == ".png" || ext == "") {
			return true;
		} else {
			alert("업로드 할 수 없는 파일 형식입니다. (jpg, bmp, png 파일을 선택해주세요)");
			return false;
		}
		return false;
	}

	function saveCheck() {

		if (validate() && CheckFileType()) {
			alert("회원정보 수정완료");
			return true;
		} else {
			return false;
		}
	}
</script>
</head>

<body>

	<%
		String userName = (String) session.getAttribute("USERNAME");
		String userEmail = (String) session.getAttribute("USEREMAIL");
		String userPhone2 = (String) request.getAttribute("PHONE2");
		String userPhone3 = (String) request.getAttribute("PHONE3");
	%>

	<header class="header">
		<div class="headerTop">
			<a href="main.mo" class="btn_back" id="menu-toggle"><i
				class="fa fa-chevron-left"></i></a>
			<h1 class="logo">회원 정보 수정</h1>
		</div>
	</header>
	<section class="section-join">
		<header>
			<h2 class="readonly">회원 정보 수정</h2>
		</header>
		<div class="wrap">
			<form class="input" name="myform" action="mod.mem" method="post"
				onsubmit="return saveCheck()" enctype="multipart/form-data">
				<input id="file" type="file" name="uploadFile" id="uploadFile">

				<label for="input-join-name" class="readonly">사용자 이름 변경</label> <input
					type="text" name="name" class="join-name" id="input-join-name"
					onkeyup="nameCheck()" maxlength="15" pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}"
					placeholder="사용자 이름 변경 (한글, 2 ~ 15자만 가능)" value=<%=userName%>>
				<p id="nameCheckText"></p>

				<label for="input-join-pw" class="readonly">비밀번호 변경</label> <input
					type="password" name="pw" class="join-pw" id="input-join-pw"
					maxlength="20" placeholder="비밀번호 변경 (4 ~ 20자 이내)"> <label
					for="input-pw-check" class="readonly">비밀번호 확인</label> <input
					type="password" name="pw-check" class="pw-check"
					id="input-join-pw2" onkeyup="pwCheck()" maxlength="20"
					placeholder="비밀번호 확인">
				<p id="pwCheckText"></p>

				<label for="input-email" class="readonly">이메일 변경</label> <input
					type="text" name="email" class="email" id="input-join-email"
					onkeyup="emailCheck()" pattern="[\w]{4,}@[\w]+(\.[\w-]+){1,3}"
					placeholder="E-Mail (비밀번호 분실 시 필요합니다.)" value=<%=userEmail%>>
				<p id="emailCheckText"></p>

				<div class="wrap-phoneNum">
					<label for="input-phoneNum1" class="readonly">전화번호 변경</label> <select
						name="phoneNum1" id="input-phoneNum1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
					</select> <label for="input-phoneNum2" class="readonly">전화번호 입력</label> <input
						type="text" name="phoneNum2" id="input-phoneNum2" maxlength="4"
						value=<%=userPhone2%>> <label for="input-phoneNum3"
						class="readonly">전화번호 입력</label> <input type="text"
						name="phoneNum3" id="input-phoneNum3" maxlength="4"
						value=<%=userPhone3%>>
				</div>

				<input class="join" type="submit" value="저장">
			</form>
		</div>
	</section>
	<footer class="footer">
		<p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
	</footer>
</body>

</html>
