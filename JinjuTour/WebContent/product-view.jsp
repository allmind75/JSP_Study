<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html lang="ko">

<head>
<title>진주투어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/subContentsStyle.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<link rel="shortcut icon" href="images/size57.png">
<link rel="apple-touch-icon" href="images/size57.png">
<link rel="apple-touch-icon-precomposed" href="images/size114.png">

</head>

<body id="top">

	<%@ include file="header-nav.jsp"%>

	<!-- sub contents start -->

	<section class="sub-contents-view">
		<c:set var="boardVO" value="${READ}"/>
		<img class="imgw100" src="images/product/${boardVO.img}" alt="${boardVO.title}">
		<div class="content">
			<h2 class="sub-title">${boardVO.title}</h2>

			<div class="info">
				<a href="#">
					<p class="sub-address">
						<i class="fa fa-map-marker"></i>${boardVO.address}
					</p>
				</a>
				<p class="sub-address">
					<i class="fa fa-phone"></i>${boardVO.phone}
				</p>
				<a href="${boardVO.link}" target="_blank">
					<p class="sub-address">
						<i class="fa fa-home"></i>${boardVO.link}
					</p>
				</a>
			</div>


			<p class="sub-content">${boardVO.content}</p>

			<div class="sns-box">
				<i class="fa fa-facebook-square facebook"></i> <i
					class="fa fa-twitter-square twitter"></i> <i
					class="fa fa-google-plus-square google"></i>
			</div>

			<div class="count">
				<ul>
					<li>
						<button class="btn-cnt" onclick="heartCnt()">
							<i class="fa fa-heart heartIcon"></i>
							<p class="heartCount1" id="heartCnt">${boardVO.heart}</p>
						</button>
					</li>
					<li><i class="fa fa-weixin reviewIcon"></i>
						<p class="reviewCount1">${boardVO.reply}</p></li>
					<li><i class="fa fa-eye"></i>
						<p class="reviewCount1">${boardVO.cnt}</p></li>
				</ul>

			</div>

		</div>

		<iframe title="구글지도"
			src="${boardVO.map }"
			width="100%" height="300" frameborder="0" style="border: 0"
			allowfullscreen></iframe>
			
		<div class="top" id="goTop">
			<a href="#top"><i class="fa fa-chevron-up"></i>TOP</a>
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
		
		function heartCnt() {
			
			var id = "<%=userId%>";
			var pnum = ${boardVO.pnum};
			
			console.log(id + ", " + pnum);
			
			if(id != "") {
				
				$.ajax({
					type : "GET",
					url : "heart.po",
					data : {
						"id" : id, 
						"num" : pnum
					},
					dataType : "JSON",
					error : function() {
						console.log("실패");
					},
					success : function(data) {
						console.log("성공");
						console.log(data.cnt);
						
						document.getElementById("heartCnt").innerHTML = data.cnt;
					}
				});
			} else {
				alert("로그인 후 사용가능합니다.");
			}
		}
	</script>
</body>

</html>
