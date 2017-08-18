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
				document.getElementById("idCheckText").innerHTML = "<font color='blue'>사용가능한 형식</font>";
				return true
			} else {
				document.getElementById("idCheckText").innerHTML = "<font color='red'>숫자 와 영어(첫글자는 소문자), 4 ~ 20자만 가능</font>";
				return false
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
			        		 result = "<font color='blue'>사용가능한 아이디</font>";
			        		 document.getElementById("resultIdCheck").innerHTML = result;
			        	 } else {
			        		 bIdCheck = false;
			        		 result = "<font color='red'>이미 등록된 아이디</font>";
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
		
		function pwCheck() {
			var pwReg = /[\w][`~!@#$%^&*()-_+=\|<,>.?/]{3,20}$/;
			var pw = document.getElementById("input-join-pw").value;
			var pw2 = document.getElementById("input-join-pw2").value;
					
			if(pw == "" || pw2 == "") {
				document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호 입력안함</font>";
				return false;
			} else if (pw != pw2) {
				document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호다름</font>";
				return false;
			} else if (pw == pw2 && pwReg.test(pw)){
				document.getElementById("pwCheckText").innerHTML = "<font color='blue'>비밀번호같음</font>";
				return true;
			} else if (!pwReg.test(pw)){
				document.getElementById("pwCheckText").innerHTML = "<font color='red'>비밀번호 4자리 이상 20자리 이하</font>";
				return false;
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
		
		function phoneCheck() {
			
			var phone2Reg = /[0-9]{3,4}$/;
			var phone3Reg = /[0-9]{4}$/;
			var phone2 = document.getElementById("input-phoneNum2").value;
			var phone3 = document.getElementById("input-phoneNum3").value;
			
			if(!phone2Reg.test(phone2)) {
				alert("숫자만 입력가능(3 ~ 4자리)");
				return false;
			}

			if(!phone3Reg.test(phone3)) {
				alert("숫자만 입력가능(4자리)");
				return false;
			}
			
			return true;			
		}
		
    	function validate() {
    		var id = false;
    		var pw = false;
    		var name = false;
    		var email = false;
    		var phone = false;
    		
    		id = idCheck();
    		pw = pwCheck();
    		name = nameCheck();
    		email = emailCheck();
    		phone = phoneCheck();
    		
    		if(id && pw && name && email &phone) {
    			return true;
    		} else {
    			if(!id) alert("아이디 중복검사 또는 형식을 확인해주세요.");
    			if(!pw) alert("비밀번호가 맞는지 확인해주세요.");
    			if(!name) alert("이름 형식을 확인해주세요.");
    			if(!email) alert("이메일 형식을 확인해주세요.");
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
    	
    	function regCheck() {
    		
    		if(validate() && CheckFileType()) {
    			alert("회원가입성공");
    			return true;
    		} else {
    			return false;
    		}
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
            <form class="input" name="myform" action="reg.mem" method="post" onsubmit="return regCheck()" enctype="multipart/form-data">
            	
            	<input id="file" type="file" name="uploadFile" id="uploadFile">
            	
                <label for="input-join-name" class="readonly">사용자 이름 입력</label>
                <input type="text" name="name" class="join-name" id="input-join-name" onkeyup="nameCheck()"  maxlength="15" 
                pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,15}" placeholder="사용자 이름 입력 (한글, 2 ~ 15자만 가능)" required>
				<p id="nameCheckText"></p>
							
                <label for="input-join-id" class="readonly">아이디 입력</label>
                <input type="text" name="id" class="join-id" id="input-join-id" onkeyup="idRegExpCheck()"  maxlength="16" 
                placeholder="아이디 입력 (숫자 와 영어(첫글자는 소문자), 4 ~ 16자만 가능)" required>
                <a class="idCheck" href="#" onclick="idCheck()">중복확인</a>
				<p id="idCheckText"></p>
				<p id="resultIdCheck"></p>

                <label for="input-join-pw" class="readonly">비밀번호 입력</label>
                <input type="password" name="pw" class="join-pw" id="input-join-pw"  maxlength="20" placeholder="비밀번호 입력 (4 ~ 20자 이내)" required>

                <label for="input-pw-check" class="readonly">비밀번호 확인</label>
                <input type="password" name="pw-check" class="pw-check" id="input-join-pw2" onkeyup="pwCheck()"  maxlength="20" placeholder="비밀번호 확인" required>
				<p id="pwCheckText"></p>

                <label for="input-email" class="readonly">이메일 입력</label>
                <input type="text" name="email" class="email" id="input-join-email" onkeyup="emailCheck()" 
                pattern="[\w]{4,}@[\w]+(\.[\w-]+){1,3}" placeholder="E-Mail (비밀번호 분실 시 필요합니다.)" required>
				<p id="emailCheckText"></p>
				
                <div class="wrap-phoneNum">
                    <label for="input-phoneNum1" class="readonly">전화번호 입력</label>
                    <select name="phoneNum1" id="input-phoneNum1">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="017">017</option>
                    </select>
                    <label for="input-phoneNum2" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum2" id="input-phoneNum2" maxlength="4" pattern="[0-9]*" required>
                    <label for="input-phoneNum3" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum3" id="input-phoneNum3" maxlength="4" pattern="[0-9]*" required>
                </div>
                
                <input class="join" type="submit" value="회원가입">
            </form>
        </div>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
</body>

</html>
