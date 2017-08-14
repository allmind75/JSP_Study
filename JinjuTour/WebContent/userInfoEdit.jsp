<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>진주투어</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    
       <script>
		
       //휴대폰 번호 앞자리 확인 후 select 선택
       <%
		String userPhone1 = (String) request.getAttribute("PHONE1");
       %>
       	window.onload = function() {
       		var phone = "<%=userPhone1%>";
       		document.myform.phoneNum1.value = phone;
       	}
       	
		function pwCheck() {

			var pw = document.getElementById("input-join-pw").value;
			var pw2 = document.getElementById("input-join-pw2").value;
					
			if(pw == "") {
				document.getElementById("pwCheckText").innerHTML = "<font color='red'>입력안함</font>";
				return true;
			} else if (pw != pw2) {
				document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호다름</font>";
				return false;
			} else {
				document.getElementById("pwCheckText").innerHTML = "<font color='blue'>비밀번호같음</font>";
				return true;
			}
		}
		
		function nameCheck() {
			//2 ~ 15자리인 한글
			var nameReg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}$/;
			var name = document.getElementById("input-join-name").value;
			
			if(nameReg.test(name)) {
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
			
			if(emailReg.test(email)) {
				document.getElementById("emailCheckText").innerHTML = "<font color='blue'>사용가능</font>";
				return true;
			} else {
				document.getElementById("emailCheckText").innerHTML = "<font color='red'>이메일 형식을 확인해주세요.</font>"
				return false;
			}
			

		}
		
    	function validate() {
    		if(pwCheck() && nameCheck() && emailCheck()) {
    			alert("회원 정보 수정 완료");
    			return true;
    		} else {
    			alert("회원 정보 수정 실패");
    			if(!pwCheck()) alert("비밀번호가 맞는지 확인해주세요.");
    			if(!nameCheck()) alert("이름 형식을 확인해주세요.");
    			if(!emailCheck()) alert("이메일 형식을 확인해주세요.");
    			return false;
    		}
    	}
    	
    	function SaveCheck() {
    		
    		if(validate()) {
    			myform.submit(); 
    		} 
    		
    		event.preventDefault();
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
            <a href="main.jsp" class="btn_back" id="menu-toggle"><i class="fa fa-chevron-left"></i></a>
            <h1 class="logo">회원 정보 수정</h1>
        </div>
    </header>
    <section class="section-join">
        <header>
            <h2 class="readonly">회원 정보 수정</h2>
        </header>
        <div class="wrap">
            <form class="input" name="myform" action="edit.mem" method="post">
                <label for="input-join-name" class="readonly">사용자 이름 변경</label>
                <input type="text" name="name" class="join-name" id="input-join-name" onkeyup="nameCheck()" maxlength="15" pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}" placeholder="사용자 이름 변경 (한글, 2 ~ 15자만 가능)" value=<%=userName %>>
				<p id="nameCheckText"></p>
				
                <label for="input-join-pw" class="readonly">비밀번호 변경</label>
                <input type="password" name="pw" class="join-pw" id="input-join-pw" maxlength="20" placeholder="비밀번호 변경 (6 ~ 20자 이내)">

                <label for="input-pw-check" class="readonly">비밀번호 확인</label>
                <input type="password" name="pw-check" class="pw-check" id="input-join-pw2" onkeyup="pwCheck()" maxlength="20" placeholder="비밀번호 확인">
				<p id="pwCheckText"></p>
				
                <label for="input-email" class="readonly">이메일 변경</label>
                <input type="text" name="email" class="email" id="input-join-email" onkeyup="emailCheck()" pattern="[\w]{4,}@[\w]+(\.[\w-]+){1,3}" placeholder="E-Mail (비밀번호 분실 시 필요합니다.)" value=<%=userEmail %>>
				<p id="emailCheckText"></p>
				
                <div class="wrap-phoneNum">
                    <label for="input-phoneNum1" class="readonly">전화번호 변경</label>
                    <select name="phoneNum1" id="input-phoneNum1">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="017">017</option>
                    </select>
                    <label for="input-phoneNum2" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum2" id="input-phoneNum2" maxlength="4" value=<%=userPhone2 %>>
                    <label for="input-phoneNum3" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum3" id="input-phoneNum3" maxlength="4" value=<%=userPhone3 %>>
                </div>                
            </form>

            <a class="join" onclick="SaveCheck()" href="#">저장</a>
        </div>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
</body>

</html>
