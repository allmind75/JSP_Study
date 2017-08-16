<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>진주투어</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="css/subContentsStyle.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

</head>

<body id="top">
    
    <%@ include file="header-nav.jsp" %>

    <!-- sub contents start -->

    <section class="sub-contents-view">
        <img class="imgw100" src="images/trip_01d.jpg" alt="진주성">
        <div class="content">
            <h2 class="sub-title">진주성</h2>

            <div class="info">
                <a href="#">
                    <p class="sub-address"><i class="fa fa-map-marker"></i>경상남도 진주시 남강로 626</p>
                </a>
                <p class="sub-address"><i class="fa fa-phone"></i>055-749-5175</p>
                <p class="sub-address"><i class="fa fa-clock-o"></i>하절기(3월~10월) 05:00 ~ 23:00</p>
                <p class="sub-address"><i class="fa fa-clock-o" style="color: #fff"></i>동절기(11월~2월) 05:00 ~ 22:00</p>
            </div>


            <p class="sub-content">진주성(晉州城)은 경상남도 진주시 남성동에서 본성동에 걸쳐 있는 석성으로, 삼국시대 백제 때 제작되었다. 1963년 1월 21일에 사적 제 118호로 지정되었다. 진주성 내의 촉석루는 1604년부터는 경상우병영의 병영이었고, 1895년 5월부터는 경상도관찰사부가 경남관찰사부, 경북관찰사부로 나뉘면서 경상남도관찰사부의 소재지가 되었다.</p>


            <div class="sns-box">
                <i class="fa fa-facebook-square facebook"></i>
                <i class="fa fa-twitter-square twitter"></i>
                <i class="fa fa-google-plus-square google"></i>
            </div>

            <div class="count">
                <ul>
                    <li>
                        <i class="fa fa-heart heartIcon"></i>
                        <p class="heartCount1">29</p>
                    </li>
                    <li>
                        <i class="fa fa-weixin reviewIcon"></i>
                        <p class="reviewCount1">21</p>
                    </li>
                    <li>
                        <i class="fa fa-eye"></i>
                        <p class="reviewCount1">52</p>
                    </li>
                </ul>

            </div>

            <iframe title="구글지도" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6521.455838923855!2d128.07540093208635!3d35.188333339611056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356efc8a2ed0b8bb%3A0x7ce375182eea6ea8!2z7KeE7KO87ISx!5e0!3m2!1sko!2skr!4v1496277634196"
                width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

        <div class="top" id="goTop">
            <a href="#top"><i class="fa fa-chevron-up"></i>TOP</a>
        </div>
    </section>

    <!-- sub contents end -->

    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#slidebar-wrapper").toggleClass("active");
        });
        $("#menu-close").click(function(e) {
            e.preventDefault();
            $("#slidebar-wrapper").toggleClass("active");
        });

        $(".btn_search").click(function(e) {
            e.preventDefault();
            $(".bar-search").toggle();
        });

        //top button
        $(function() {
            $("#goTop").hide();
            // 처음에는 탑이미지를 감춥니다.
            $(window).scroll(function() {
                // 스크롤을 할때
                if ($(this).scrollTop() > 50) {
                    $("#goTop").fadeIn();
                }
                //  스크롤이 100 픽셀만큼 내려오면 탑아이콘을 fade in 합니다. (서서히 나타납니다)
                else {
                    $("#goTop").fadeOut();
                }
                // 스크롤이 100 픽셀 이하이면 탑아이콘을 fade out 합니다. (서서히 사라집니다)
            });
        });

        $("#goTop").click(function(e) {
            e.preventDefault();
            $('body, html, .sub-contents-view').scrollTop(0);
        });
    </script>
</body>

</html>