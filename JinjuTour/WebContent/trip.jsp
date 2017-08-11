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
            <ul class="tab_links">
                <li><a href="main.jsp">추천</a></li>
                <li class="active"><a href="trip.jsp">관광지</a></li>
                <li><a href="food.jsp">맛집</a></li>
                <li><a href="product.jsp">특산물</a></li>
            </ul>
        </div>
    </section>

    <!-- sub contents start -->

    <section class="sub-contents">
        <h2 class="readonly">콘텐츠내용</h2>
        <ul>
            <li>
                <a href="trip-view.jsp">
                    <img class="imgw100" src="images/trip_01d.jpg" alt="진주성">
                    <div class="content">
                        <p class="sub-title">진주성</p>
                        <p class="sub-content">진주성(晉州城)은 경상남도 진주시 남성동에서 본성동에 걸쳐 있는 석성으로, 삼국시대 백제 때 제작되었다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 남강로 626</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">29</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">21</p>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="trip-view.html">
                    <img class="imgw100" src="images/trip_02.jpg" alt="진양호">
                    <div class="content">
                        <p class="sub-title">진양호</p>
                        <p class="sub-content">진양호(晉陽湖)는 1970년 7월에 완성된 낙동강 유역 최초의 다목적댐인 남강댐의 건설로 형성된 호수이다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 판문동</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">17</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">13</p>
                        </div>

                    </div>
                </a>
            </li>
            <li>
                <a href="trip-view.html">
                    <img class="imgw100" src="images/trip_03.jpg" alt="진양호 동물원">
                    <div class="content">
                        <p class="sub-title">진양호 동물원</p>
                        <p class="sub-content">1986년 1월 20일 개원하여 연차적으로 시설물을 확충하여 현재 55종 300여마리의 동물을 사육하고 있다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 판문동 171</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">14</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">12</p>
                        </div>

                    </div>
                </a>
            </li>
            <li>
                <a href="trip-view.html">
                    <img class="imgw100" src="images/trip_04.jpg" alt="망진상 봉수대">
                    <div class="content">
                        <p class="sub-title">망진상 봉수대</p>
                        <p class="sub-content">이곳 봉수대는 예부터 외적의 침입을 알리는 통신 수단으로 이용된 것으로 크기는 옛날의 것보다 1/3로 축소 조성되었다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 망경동</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">25</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">23</p>
                        </div>

                    </div>

                </a>
            </li>
            <li>
                <a href="trip-view.html">
                    <img class="imgw100" src="images/trip_05.jpg" alt="월아산 해돋이">
                    <div class="content">
                        <p class="sub-title">월아산 해돋이</p>
                        <p class="sub-content">장군대봉과 국사봉 사이 밑바닥(질매재)에서 튀어 오르는 해돋이 광경은 금호지와 어우러져 탄성을 자아낸다. </p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 금산면 갈전리</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">36</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">23</p>
                        </div>

                    </div>
                </a>
            </li>
            <li>
                <a href="trip-view.html">
                    <img class="imgw100" src="images/trip_06.jpg" alt="음악분수">
                    <div class="content">
                        <p class="sub-title">음악분수</p>
                        <p class="sub-content">음악에 맞추어 수동으로 분수 모양을 조합하여 조명과 각종 효과들을 연출함으로써 예술성이 요구되는 종합창작 예술품이다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 신안동</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">43</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">31</p>
                        </div>

                    </div>
                </a>
            </li>
        </ul>
        <div class="paging">
            <strong>1</strong>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">
                <i class="fa fa-angle-double-right"></i>
            </a>
            <div class="top" id="goTop">
                <a href="#top"><i class="fa fa-chevron-up"></i>TOP</a>
            </div>
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
                if ($(this).scrollTop() > 100) {
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
