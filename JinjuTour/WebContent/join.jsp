<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>진주투어</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    
    <!-- ajax -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    
		function idRegExpCheck() {
			//^[a-z] : 첫글자는 소문자
			// \w : [a-zA-Z0-9_]
			//{3,19} : 3개부터 19개 까지
			// 앞글자에 하나 있어서, 최종적으로는 4개부터 20개까지 가능
			var idReg = /^[a-z]\w{3,19}$/;
			var id = document.getElementById("input-join-id").value;
			
			if(idReg.test(id)) {
				document.getElementById("idCheckText").innerHTML = "사용가능한 형식";
				return true
			} else {
				document.getElementById("idCheckText").innerHTML = "숫자 와 영어(첫글자는 소문자), 4 ~ 20자만 가능";
				return false
			}
		}
	
		function pwCheck() {

			var pw = document.getElementById("input-join-pw").value;
			var pw2 = document.getElementById("input-join-pw2").value;
					
			if(pw == "") {
				document.getElementById("pwCheckText").innerHTML = "입력안함";
				return false;
			} else if (pw != pw2) {
				document.getElementById("pwCheckText").innerHTML = "비밀번호다름";
				return false;
			} else {
				document.getElementById("pwCheckText").innerHTML = "비밀번호같음";
				return true;
			}
		}
		
		function nameCheck() {
			//2 ~ 12자리인 한글
			var nameReg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,12}$/;
			var name = document.getElementById("input-join-name").value;
			
			if(nameReg.test(name)) {
				document.getElementById("nameCheckText").innerHTML = "사용가능";
				return true;
			} else {
				document.getElementById("nameCheckText").innerHTML = "한글, 2 ~ 12자만 가능";
				return false;
			}
			
		}
		
		function emailCheck() {
			
			var emailReg = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
			var email = document.getElementById("input-join-email").value;
			
			if(emailReg.test(email)) {
				document.getElementById("emailCheckText").innerHTML = "사용가능";
				return true;
			} else {
				document.getElementById("emailCheckText").innerHTML = "이메일 형식을 확인해주세요."
				return false;
			}
			

		}
		
		function idCheck()
		{
			if(idRegExpCheck()) {
				var bIdCheck = false;
				$.ajax({
					type :"GET",					//get, post
					url :"idCheck.mem",					//웹페이지 경로
					async: false,
					//data : "cmd=idCheck&" + $('#id').val(),"
					data : {
						"id" : $("#input-join-id").val()
					},
					dataType :"json",					//url 페이지를 내부적으로 처리하고 처리한결과를 가져오는 형식
			
					 error : function()					//내부페이지를 처리중에 발생하는 에러를 알림
					 {
						alert('통신실패!!');
			         },
					 complete : function(data) 			//내부처리 완료, data는 내부페이지에서 넘겨준 값
					 {
					 
					 },
			         success : function(data)			//내부처리 성공
					 {
			        	var result;
			  
			        	 if(data.ret == true) {
			        		 bIdCheck = true;
			        		 result = "<font color='blue'>사용가능한 아이디입니다.</font>";
			        		 document.getElementById("resultIdCheck").innerHTML = result;
			        	 } else {
			        		 bIdCheck = false;
			        		 result = "<font color='red'>이미 등록된 아이디 입니다.</font>";
			        		 document.getElementById("resultIdCheck").innerHTML = result;
			        	 }
			     
			         }});
				if(bIdCheck) {
					//alert("id true");
					return true;
				} else {
					//alert("id false");
					return false;
				}
			} else {
				//alert("사용가능한 아이디 형식인지 확인해주세요");
				return false;
			}
			event.preventDefault()
		}
		
    	function validate() {
    		if(idCheck() && pwCheck() && nameCheck() && emailCheck()) {
    			alert("회원가입성공");
    			return true;
    		} else {
    			alert("회원가입실패");
    			if(!idCheck()) alert("아이디 중복검사 및 형식을 확인해주세요.");
    			if(!pwCheck()) alert("비밀번호가 맞는지 확인해주세요.");
    			if(!nameCheck()) alert("이름 형식을 확인해주세요.");
    			if(!emailCheck()) alert("이메일 형식을 확인해주세요.");
    			return false;
    		}
    	}
    	
    	function regCheck() {
    		
    		if(validate()) {
    			myform.submit(); 
    		} 
    		
    		event.preventDefault();
    	}
    </script>
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="login.jsp" class="btn_back" id="menu-toggle"><i class="fa fa-chevron-left"></i></a>
            <h1 class="logo">회원가입</h1>
        </div>
    </header>
    <section class="section-join">
        <header>
            <h2 class="readonly">회원가입 정보 입력</h2>
        </header>
        <div class="wrap">
            <form class="input" name="myform" action="reg.mem" method="post">
            
                <label for="input-join-name" class="readonly">사용자 이름 입력</label>
                <input type="text" name="name" class="join-name" id="input-join-name" onkeyup="nameCheck()"  maxlength="15" pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}" placeholder="사용자 이름 입력 (한글, 2 ~ 15자만 가능)">
				<p id="nameCheckText"></p>
							
                <label for="input-join-id" class="readonly">아이디 입력</label>
                <input type="text" name="id" class="join-id" id="input-join-id" onkeyup="idRegExpCheck()"  maxlength="16" placeholder="아이디 입력 (숫자 와 영어(첫글자는 소문자), 4 ~ 16자만 가능)">
                <a class="idCheck" href="#" onclick="idCheck()">중복확인</a>
				<p id="idCheckText"></p>
				<p id="resultIdCheck"></p>

                <label for="input-join-pw" class="readonly">비밀번호 입력</label>
                <input type="password" name="pw" class="join-pw" id="input-join-pw"  maxlength="20" placeholder="비밀번호 입력 (6 ~ 20자 이내)">

                <label for="input-pw-check" class="readonly">비밀번호 확인</label>
                <input type="password" name="pw-check" class="pw-check" id="input-join-pw2" onkeyup="pwCheck()"  maxlength="20" placeholder="비밀번호 확인">
				<p id="pwCheckText"></p>

                <label for="input-email" class="readonly">이메일 입력</label>
                <input type="text" name="email" class="email" id="input-join-email" onkeyup="emailCheck()" pattern="[\w]{4,}@[\w]+(\.[\w-]+){1,3}" placeholder="E-Mail (비밀번호 분실 시 필요합니다.)">
				<p id="emailCheckText"></p>
				
                <div class="wrap-phoneNum">
                    <label for="input-phoneNum1" class="readonly">전화번호 입력</label>
                    <select name="phoneNum1" id="input-phoneNum1">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="017">017</option>
                    </select>
                    <label for="input-phoneNum2" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum2" id="input-phoneNum2" maxlength="4">
                    <label for="input-phoneNum3" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum3" id="input-phoneNum3" maxlength="4">
                </div>
            </form>

            <a class="join" onclick="regCheck();" href="#">회원가입</a>
        </div>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
</body>

</html>
