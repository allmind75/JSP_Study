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
        function loginCheck() {

            if (myform.id.value == "" || myform.pw.value == "") {
                alert("아이디 또는 비밀번호를 입력하세요.");

                if (myform.id.value == "") {
                    myform.id.focus();
                } else {
                    myform.pw.focus();
                }

                return;
            } else {
                //id, pw 서버로 전송
                document.myform.submit();    //document는 생략가능
            }
        }
        
        function onKeyEnter() {
        	if(event.keyCode == 13) {
        		loginCheck();
        	}
        }
    </script>
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="main.jsp" class="btn_back" id="menu-toggle"><i class="fa fa-chevron-left"></i></a>
            <h1 class="logo">로그인</h1>
        </div>
    </header>
    <section class="section-login">
      <header>
          <h2 class="readonly">로그인 정보 입력</h2>
      </header>
        <div class="wrap">
            <form class="input" name="myform" action="login.mem" method="post">
                
                <label for="input-id" class="readonly">아이디입력</label>
                <input type="text" name="id" class="id" id="input-id" maxlength="16" placeholder="아이디">
                <label for="input-pw" class="readonly">비밀번호입력</label>
                <input type="password" name="pw" class="pw" id="input-pw" maxlength="20" onkeydown="onKeyEnter()" placeholder="비밀번호">
                
            </form>

            <a class="login" onclick="loginCheck();">로그인</a>
            
            <div class="login-check">
              <!-- <label for="login-checkbox" class="readonly">로그인 상태 유지 체크</label> -->
              <input type="checkbox" id="login-checkbox">
              <span>로그인 상태 유지</span>
            </div>
            <ul class="login-ul">
              <li><a href="#">아이디 찾기</a></li>
              <li><a href="#">비밀번호 찾기</a></li>
              <li><a href="join.jsp">회원가입</a></li>
            </ul>
        </div>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
</body>

</html>
