<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>진주투어</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!--safari에서 버튼과 주소창 안보이게-->

    <link rel="stylesheet" href="css/myStyle.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- 바로기가 이이콘-->
    <link rel="shortcut icon" href="images/size57">
    <link rel="apple-touch-icon" href="images/size57.png">
    <link rel="apple-touch-icon-precomposed" href="images/size114.png">

    <script>
        if(navigator.userAgent.match(/iPhone/i)) {
          document.write('<link rel="apple-touch-icon" href="images/size57.png">');
        } else if(navigator.userAgent.match(/iPad/i)) {
          document.write('<link rel="apple-touch-icon" href="images/size72.png">');
        } else if(navigator.userAgent.match(/iPod/i)) {
          document.write('<link rel="apple-touch-icon" href="images/size57.png">');
        } else if(navigator.userAgent.match(/Android/i)) {
          document.write('<link rel="shorcut icon" href="images/size72.png">');
        }
    </script>

</head>

<body id="top">
	
	<%@ include file="header-nav.jsp" %>


    <div class="content">
        <section class="main_visual">
            <header>
                <h2 class="readonly">광고 메인비쥬얼</h2>
            </header>
            <!--<h3 class="main_title">[진주성]</h3>-->
            <div class="inner">
                <div class="backgroundchange">
                    <div class="backgroundimg" id="back1"></div>
                    <div class="backgroundimg" id="back2"></div>
                    <div class="backgroundimg" id="back3"></div>
                    <div class="backgroundimg" id="back4"></div>
                    <div class="backgroundimg" id="back5"></div>
                </div>
            </div>
        </section>
        <section class="contents">
            <h2 class="readonly">콘텐츠내용</h2>
            <div class="tab1_cont">
                <ul>
                    <li>
                        <a href="trip-view.jsp">
                            <img class="imgw100" src="images/trip_01.jpg" alt="진주성">
                            <span>진주성</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount1">29</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount1">21</p>
                            </div>
                            <p>진주성(晉州城)은 경상남도 진주시 남성동에서 본성동에 걸쳐 있는 석성으로, 삼국시대 백제 때 제작되었다.</p>
                        </a>
                    </li>
                    <li>
                        <a href="trip-view.jsp">
                            <img class="imgw100" src="images/trip_01.jpg" alt="진주성">
                            <span>진주성</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount1">29</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount1">21</p>
                            </div>
                            <p>진주성(晉州城)은 경상남도 진주시 남성동에서 본성동에 걸쳐 있는 석성으로, 삼국시대 백제 때 제작되었다.</p>
                        </a>
                    </li>
                    <li>
                        <a href="trip-view.jsp">
                            <img class="imgw100" src="images/trip_01.jpg" alt="진주성">
                            <span>진주성</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount1">29</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount1">21</p>
                            </div>
                            <p>진주성(晉州城)은 경상남도 진주시 남성동에서 본성동에 걸쳐 있는 석성으로, 삼국시대 백제 때 제작되었다.</p>
                        </a>
                    </li>
                    <li>
                        <a href="food-view.jsp">
                            <img class="imgw100" src="images/food_01.jpg" alt="진주냉면">
                            <span>박군자 진주냉면</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount1">17</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount1">18</p>
                            </div>
                            <p>장남인 하연규, 박군자 부부가 가업을 이어 '박군자 진주냉면' 으로 2대에 걸쳐 천년 진주냉면의 정통 명맥을 이어오고 있습니다.</p>
                        </a>
                    </li>
                    <li>
                        <a href="food-view.jsp">
                            <img class="imgw100" src="images/food_03.jpg" alt="진주냉면">
                            <span>유정장어</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount1">24</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount1">19</p>
                            </div>
                            <p>저희 유정장어는 진주시로부터 향토음식점으로 선정받아 45년간 장어구이맛의 정통을 계승보존하고자 노력하고 있습니다.</p>
                        </a>
                    </li>
                    <li>
                        <a href="product-view.jsp">
                            <img class="imgw100" src="images/product_01.jpg" alt="진주실크">
                            <span>실키안</span>
                            <div class="count">
                                <i class="fa fa-heart heartIcon"></i>
                                <p class="heartCount2">11</p>
                                <i class="fa fa-weixin reviewIcon"></i>
                                <p class="reviewCount2">10</p>
                            </div>
                            <p>진주에서 생산된 천연섬유실크를 활용해서, 넥타이, 스카프, 양장지, 한복지 등을 생산하고 있습니다.</p>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        <div class="top" id="goTop">
            <a href="#top"><i class="fa fa-chevron-up"></i>TOP</a>
        </div>
    </div>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        //toggle
        $("#menu-toggle").click(function(e) {
            e.preventDefault();
            $("#slidebar-wrapper").toggleClass("active-nav");
        });
        $("#menu-close").click(function(e) {
            e.preventDefault();
            $("#slidebar-wrapper").toggleClass("active-nav");
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


        //Webapp Transition hotfix
        (function(a, b, c) {
            if (c in b && b[c]) {
                var d, e = a.location,
                    f = /^(a|html)$/i;
                a.addEventListener("click", function(a) {
                    d = a.target;
                    while (!f.test(d.nodeName)) d = d.parentNode;
                    "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href)
                }, !1)
            }
        })(document, window.navigator, "standalone")
        
    </script>
</body>

</html>
