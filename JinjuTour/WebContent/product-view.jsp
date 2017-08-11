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
    
    <section class="tap_bar">
        <div class="tab_cont">
            <header>
                <h2 class="readonly">탭메뉴</h2>
            </header>
            <ul>
                <li><a href="main.jsp">추천</a></li>
                <li><a href="trip.jsp">관광지</a></li>
                <li><a href="food.jsp">맛집</a></li>
                <li class="active"><a href="product.jsp">특산물</a></li>
            </ul>
        </div>
    </section>

    <!-- sub contents start -->

    <section class="sub-contents-view">
        <img class="imgw100" src="images/product_01d.jpg" alt="실키안">
        <div class="content">
            <h2 class="sub-title">실키안</h2>

            <div class="info">
                <a href="#">
                    <p class="sub-address"><i class="fa fa-map-marker"></i>경상남도 진주시 본성동 10-4</p>
                </a>
                <p class="sub-address"><i class="fa fa-phone"></i>055-753-1230</p>
                <a href="http://jinjusilk.co.kr/">
                    <p class="sub-address"><i class="fa fa-home"></i>http://jinjusilk.co.kr/</p>
                </a>
            </div>


            <p class="sub-content">진주에서 생산된 천연섬유실크를 주력제품으로 하고 있으며 28곳의 실크생산업체의 지원아래 다양한 넥타이, 스카프, 양장지, 한복지, 인테리어 제품등을 생산하고 있으며 우수한 디자인과 상품성으로 특화상품으로 지정되어 있어 앞으로 세계속의 명품진주실크를 만들어 가기 위해 추진중입니다.</p>

            <div class="sns-box">
                <i class="fa fa-facebook-square facebook"></i>
                <i class="fa fa-twitter-square twitter"></i>
                <i class="fa fa-google-plus-square google"></i>
            </div>

            <div class="count">
                <ul>
                    <li>
                        <i class="fa fa-heart heartIcon"></i>
                        <p class="heartCount1">11</p>
                    </li>
                    <li>
                        <i class="fa fa-weixin reviewIcon"></i>
                        <p class="reviewCount1">10</p>
                    </li>
                    <li>
                        <i class="fa fa-eye"></i>
                        <p class="reviewCount1">29</p>
                    </li>
                </ul>

            </div>

        </div>

        <iframe title="구글지도" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3260.652759973739!2d128.0816565155334!3d35.19020626435089!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356efc14d1db023d%3A0xa8c677e4d9f768dd!2z7Iuk7YKk7JWI!5e0!3m2!1sko!2skr!4v1496278247875"
            width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
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
