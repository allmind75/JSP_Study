<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>진주투어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
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

	<%@ include file="header-nav.jsp"%>


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
					<li><a href="trip-view.jsp"> <img class="imgw100"
							src="images/trip_01.jpg" alt="진주성"> <span>진주성</span>
							<ul class="count-wrap">
								<li><i class="fa fa-heart heartIcon"></i>
									<p class="count">29</p></li>
								<li><i class="fa fa-weixin reviewIcon"></i>
									<p class="count">21</p></li>
								<li><i class="fa fa-eye eyeIcon"></i>
									<p class="count">52</p></li>
							</ul>
					</a></li>
					<li><a href="food-view.jsp"> <img class="imgw100"
							src="images/food_01.jpg" alt="진주냉면"> <span>박군자 진주냉면</span>
							<ul class="count-wrap">
								<li>
									<i class="fa fa-heart heartIcon"></i>
									<p class="count">17</p>
								</li>
								<li>										
		                            <i class="fa fa-weixin reviewIcon"></i>
		                            <p class="count">18</p>
								</li>
								<li>
									<i class="fa fa-eye eyeIcon"></i>
									<p class="count">52</p>
								</li>
							</ul>
					</a></li>
					<li><a href="food-view.jsp"> <img class="imgw100"
							src="images/food_03.jpg" alt="진주냉면"> <span>유정장어</span>
							<ul class="count-wrap">
								<li>
									<i class="fa fa-heart heartIcon"></i>
									<p class="count">24</p>
								</li>
								<li>										
		                            <i class="fa fa-weixin reviewIcon"></i>
		                            <p class="count">19</p>
								</li>
								<li>
									<i class="fa fa-eye eyeIcon"></i>
									<p class="count">52</p>
								</li>
							</ul>
					</a></li>
					<li><a href="product-view.jsp"> <img class="imgw100"
							src="images/product_01.jpg" alt="진주실크"> <span>실키안</span>
							<ul class="count-wrap">
								<li>
									<i class="fa fa-heart heartIcon"></i>
									<p class="count">11</p>
								</li>
								<li>										
		                            <i class="fa fa-weixin reviewIcon"></i>
		                            <p class="count">10</p>
								</li>
								<li>
									<i class="fa fa-eye eyeIcon"></i>
									<p class="count">52</p>
								</li>
							</ul>
					</a></li>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
