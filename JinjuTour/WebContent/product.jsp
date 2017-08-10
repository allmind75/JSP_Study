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
    <header class="header">
        <div class="headerTop">
            <a class="btn_gnb" id="menu-toggle"><i class="fa fa-navicon headericon"></i></a>
            <h1 class="logo"><a href="main.html">진주투어</a></h1>
            <a class="btn_search"><i class="fa fa-search headericon"></i></a>
        </div>
        <div class="bar-search">
            <div class="inner">
                <form name="mysearch">
                    <label for="search" class="readonly">검색단어 입력</label>
                    <input type="text" name="search" class="search" id="search" placeholder="검색어를 입력하세요">
                    <div class="btn_search2_wrap"><a class="btn_search2">검색</a></div>
                </form>
            </div>
        </div>
    </header>

    <nav id="slidebar-wrapper">
        <div id="nav-wrapper">
            <div class="nav-top">
                <a href="main.html" id="menu-close" class="btn-close"><i class="fa fa-close"></i></a>
                <div class="slidebar-wrap">
                    <div class="slidebar-brand">
                    </div>
                    <p class="userName">장환호</p>
                    <p class="userID">abcdef</p>
                </div>
                <p class="userMail">abcdef@gamil.com</p>
                <a href="userInfoEdit.html" class="userEdit"><i class="fa fa-edit"></i></a>
            </div>
            <ul class="sidebar-nav">
                <li><i class="fa fa-home"></i><a href="main.html">HOME</a></li>
                <li><i class="fa fa-sign-out"></i><a href="main.html">로그아웃</a></li>
                <li><i class="fa fa-flag-o"></i><a href="notice.html">공지사항</a></li>
                <li><i class="fa fa-question-circle-o"></i><a href="help.html">도움말</a></li>
                <!--<li><i class="fa fa-gear"></i><a href="setting.html">설정</a></li>-->
            </ul>
        </div>
    </nav>
    <section class="tap_bar">
        <div class="tab_cont">
            <header>
                <h2 class="readonly">탭메뉴</h2>
            </header>
            <ul class="tab_links">
                <li><a href="main.html">추천</a></li>
                <li><a href="trip.html">관광지</a></li>
                <li><a href="food.html">맛집</a></li>
                <li class="active"><a href="product.html">특산물</a></li>
            </ul>
        </div>
    </section>

    <!-- sub contents start -->

    <section class="sub-contents">
        <h2 class="readonly">콘텐츠내용</h2>
        <ul>
            <li>
                <a href="product-view.jsp">
                    <img class="imgw100" src="images/product_01d.jpg" alt="실키안">
                    <div class="content">
                        <p class="sub-title">실키안</p>
                        <p class="sub-content">진주에서 생산된 천연섬유실크를 활용해서, 넥타이, 스카프, 양장지, 한복지 등을 생산하고 있습니다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 본성동 10-4</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">11</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">10</p>
                        </div>
                    </div>

                </a>
            </li>
            <li>
                <a href="product-view.html">
                    <img class="imgw100" src="images/product_02.jpg" alt="진주 사잇길도예공방">
                    <div class="content">
                        <p class="sub-title">진주 사잇길도예공방</p>
                        <p class="sub-content">진주 도자기를 직접 만들어 볼 수있는 공방으로 취미, 일일 체험 등 다양한 도예 체험을할 수 있습니다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 강남로227</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">13</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">11</p>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="product-view.html">
                    <img class="imgw100" src="images/product_03.jpg" alt="진주 딸기">
                    <div class="content">
                        <p class="sub-title">진주 딸기</p>
                        <p class="sub-content">경남 진주는 딸기 주산지이다. 하우스에서 재배를 하며, 겨울과이른 봄에 주로 낸다.</p>
                        <p class="sub-address"><i class="fa fa-map-marker"></i> 경상남도 진주시 강남로7</p>
                        <div class="count">
                            <i class="fa fa-heart heartIcon"></i>
                            <p class="heartCount1">24</p>
                            <i class="fa fa-weixin reviewIcon"></i>
                            <p class="reviewCount1">19</p>
                        </div>
                        <p class="sub-address"></p>
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
