<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>진주투어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/subContentsStyle.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

</head>

<body id="top">

	<%@ include file="header-nav.jsp"%>

	<!-- sub contents start -->

	<section class="sub-contents">
		<h2 class="readonly">콘텐츠내용</h2>
		<ul>
			<li><a href="food-view.jsp"> <img class="imgw100"
					src="images/food_01d.jpg" alt="박군자 진주 냉면">
					<div class="content">
						<p class="sub-title">박군자 진주 냉면</p>
						<p class="sub-content">장남인 하연규, 박군자 부부가 가업을 이어 '박군자 진주냉면' 으로
							2대에 걸쳐 천년 진주냉면의 정통 명맥을 이어오고 있습니다.</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i> 경남 진주시 망경로 308
						</p>
						<div class="count">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1">17</p>
							<i class="fa fa-weixin reviewIcon"></i>
							<p class="reviewCount1">18</p>
						</div>

					</div>

			</a></li>
			<li><a href="food-view.jsp"> <img class="imgw100"
					src="images/food_02.jpg" alt="설야 진주 전통 비빔밥">
					<div class="content">
						<p class="sub-title">설야 진주 전통 비빔밥</p>
						<p class="sub-content">화학조미료를 쓰지 않고 최상의 재료로 재료 본연의 맛을 그대로 살려
							많은 사람이 찾고 있습니다.</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i> 경남 진주시 동진로 169
						</p>
						<div class="count">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1">13</p>
							<i class="fa fa-weixin reviewIcon"></i>
							<p class="reviewCount1">11</p>
						</div>

					</div>
			</a></li>
			<li><a href="food-view.jsp"> <img class="imgw100"
					src="images/food_03.jpg" alt="유정장어">
					<div class="content">
						<p class="sub-title">유정장어</p>
						<p class="sub-content">저희 유정장어는 진주시로부터 향토음식점으로 선정받아 45년간
							장어구이맛의 정통을 계승보존하고자 노력하고 있습니다.</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i> 경남 진주시 진주성로 2
						</p>
						<div class="count">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1">24</p>
							<i class="fa fa-weixin reviewIcon"></i>
							<p class="reviewCount1">19</p>
						</div>

					</div>
			</a></li>
			<li><a href="food-view.html"> <img class="imgw100"
					src="images/food_04.jpg" alt="홍제원">
					<div class="content">
						<p class="sub-title">홍제원</p>
						<p class="sub-content">진주 남강 옆에 위치한 한우모듬구이 및 돼지갈비가 유명한 곳이다.</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i> 경남 진주시 남강로 1171
						</p>
						<div class="count">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1">28</p>
							<i class="fa fa-weixin reviewIcon"></i>
							<p class="reviewCount1">15</p>
						</div>

					</div>

			</a></li>
			<li><a href="food-view.html"> <img class="imgw100"
					src="images/food_05.jpg" alt="송화한정식">
					<div class="content">
						<p class="sub-title">송화한정식</p>
						<p class="sub-content">전통궁중한정식이며 코스별요리 및 15가지 이상의 찬과 후식이 나오는
							한정식 전문점입니다.</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i> 경상남도 진주시 도동천로 82
						</p>
						<div class="count">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1">35</p>
							<i class="fa fa-weixin reviewIcon"></i>
							<p class="reviewCount1">26</p>
						</div>

					</div>
			</a></li>
		</ul>
		<div class="paging">
			<strong>1</strong> <a href="#">2</a> <a href="#">3</a> <a href="#">
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
