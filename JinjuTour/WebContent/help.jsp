<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>진주투어</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="main.jsp" class="btn_back"><i class="fa fa-chevron-left"></i></a>
            <h1 class="logo">도움말</h1>
        </div>
    </header>
    <section class="section-notice">
        <header>
            <h2 class="readonly">도움말 목록</h2>
        </header>
        <ul>
            <li class="notice">
                <i class="fa fa-chevron-down notice-icon"></i>
                <p class="notice-title">진주투어는 어떤 서비스인가요?</p>
                <div class="notice-context">
                    <p class="context">
                      진주투어는 진주시의 관광지, 맛집, 특산물 정보를<br/>
                      제공하는 여행서비스입니다.</p>
                </div>
            </li>
            <li class="notice">
                <i class="fa fa-chevron-down notice-icon"></i>
                <p class="notice-title">진주투어 계정을 분실한 경우</p>
                <div class="notice-context">
                    <p class="context">로그인 화면에서 아이디 찾기 또는 비밀번호 찾기를<br/>
                      터치한 후, 가입당시 입력하신 이메일을 입력하시면<br/>
                      아이디 또는 임시비밀번호를 보내드립니다.</p>
                </div>
            </li>
        </ul>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(".notice").click(function(e) {
            e.preventDefault();
            $(this).toggleClass("active");

            var state = $(this).find('div').css('display');
            if (state == "none") {
                $(this).find('div').show();
                $(this).find('i').removeClass("notice-icon").addClass("notice-active");
            } else {
                $(this).find('div').hide();
                $(this).find('i').removeClass("notice-active").addClass("notice-icon");
            }
        });
    </script>
</body>

</html>
