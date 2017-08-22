<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>진주투어</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">

</head>

<body>
	<header class="header">
		<div class="headerTop">
			<a href="main.jsp" class="btn_back"><i class="fa fa-chevron-left"></i></a>
			<h1 class="logo">공지사항</h1>
		</div>
	</header>
	<section class="section-notice">
		<header>
			<h2 class="readonly">공지사항 목록</h2>
		</header>
		<ul>
			<li class="notice"><i class="fa fa-chevron-down notice-icon"></i>
				<p class="notice-title">진주투어 업데이트 소식</p>
				<div class="notice-context">
					<p class="context">
						안녕하세요. 진주투어입니다.<br /> 오늘은 진주투어 업데이트 소식을 전해드리려고<br /> 이렇게 공지로
						찾아왔습니다.<br />
					</p>
				</div></li>
			<li class="notice"><i class="fa fa-chevron-down notice-icon"></i>
				<p class="notice-title">도서 증정 이벤트 당첨자 발표</p>
				<div class="notice-context">
					<p class="context">
						안녕하세요. 진주투어입니다.<br /> "진주투어x도서 증정 이벤트"가 마감되었습니다.<br />
					</p>
				</div></li>
			<li class="notice"><i class="fa fa-chevron-down notice-icon"></i>
				<p class="notice-title">새해 맞이 이벤트 당첨자 발표</p>
				<div class="notice-context">
					<p class="context">
						안녕하세요. 진주투어입니다.<br /> 2월30일부터 1월 12일까지 진행된<br /> 새해맞이 이벤트 당참자를
						발표합니다!<br /> 당참자분들께는 개별적으로 연락을 드릴 예정 입니다.<br /> 이벤트 상품으로 “진주투어
						달력”을 제작하여<br /> 보내드리오니 꼭 메시지 확인 바랍니다.<br />
					</p>
				</div></li>
		</ul>
	</section>
	<footer class="footer">
		<p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
	</footer>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$(".notice").click(
							function(e) {
								e.preventDefault();
								$(this).toggleClass("active");

								var state = $(this).find('div').css('display');
								if (state == "none") {
									$(this).find('div').show();
									$(this).find('i')
											.removeClass("notice-icon")
											.addClass("notice-active");
								} else {
									$(this).find('div').hide();
									$(this).find('i').removeClass(
											"notice-active").addClass(
											"notice-icon");
								}
							});
				});
	</script>
</body>

</html>
