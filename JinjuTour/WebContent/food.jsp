<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>진주투어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet" href="css/subContentsStyle.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<link rel="shortcut icon" href="images/size57.png">
<link rel="apple-touch-icon" href="images/size57.png">
<link rel="apple-touch-icon-precomposed" href="images/size114.png">
</head>

<body id="top">

	<%@ include file="header-nav.jsp"%>

	<!-- sub contents start -->

	<section class="sub-contents">
		<h2 class="readonly">콘텐츠내용</h2>
		<ul>
			<c:forEach items="${LIST}" var="boardVO">
			<li>
				<a href="readFood.mo${PAGEMAKER.makeSearch(PAGEMAKER.cri.page)}&fnum=${boardVO.fnum}"> 
				<img class="imgw100" src="images/food/${boardVO.img }" alt="${boardVO.title }">
					<div class="content">
						<p class="sub-title">${boardVO.title }</p>
						<p class="sub-content">${boardVO.content }</p>
						<p class="sub-address">
							<i class="fa fa-map-marker"></i>
							${boardVO.address }
						</p>
						<ul class="count-wrap">
							<li>
								<i class="fa fa-heart heartIcon"></i>
								<p class="count">${boardVO.heart }</p>
							</li>
							<li>
								<i class="fa fa-weixin reviewIcon"></i>
								<p class="count">${boardVO.reply }</p>
							</li>
							<li>
								<i class="fa fa-eye eyeIcon"></i>
								<p class= "count">${boardVO.cnt }</p>							
							</li>

						</ul>
					</div>
				</a>
			</li>
			</c:forEach>
		</ul>
		<div class="top" id="goTop">
			<a href="#top"><i class="fa fa-chevron-up"></i>TOP</a>
		</div>
	</section>

	<div class="paging">
		<select name="searchType">
			<option value="n" <c:out value="${CRI.searchType == null? 'selected':'' }"/> >---</option>
			<option value="t" <c:out value="${CRI.searchType == 't'? 'selected':'' }"/> >제목</option>
			<option value="c" <c:out value="${CRI.searchType == 'c'? 'selected':'' }"/> >내용</option>
			<option value="a" <c:out value="${CRI.searchType == 'a'? 'selected':'' }"/> >주소</option>
			<option value="tc" <c:out value="${CRI.searchType == 'tc'? 'selected':'' }"/> >제목 + 내용</option>
			<option value="ca" <c:out value="${CRI.searchType == 'ca'? 'selected':'' }"/> >내용 + 주소</option>
			<option value="tca" <c:out value="${CRI.searchType == 'tca'? 'selected':'' }"/> >제목 + 내용 + 주소</option>
		</select>
			
		<input type="text" name="keyword" id="keywordInput" value="${CRI.keyword }"	>
		<button id="searchBtn" class="btn">검색</button>
	</div>	
		
	<!-- paging -->	
	<div class="paging">
		<ul class="pagination">
			<c:if test="${PAGEMAKER.prev }">
				<li>
					<a href="food.mo${PAGEMAKER.makeSearch(0) }">&laquo;</a>
					<a href="food.mo${PAGEMAKER.makeSearch(PAGEMAKER.startPage-1)}"><</a>
				</li>
			</c:if>
			
			<c:forEach begin="${PAGEMAKER.startPage }" end="${PAGEMAKER.endPage }" var="idx">
				<li <c:out value="${PAGEMAKER.cri.page == idx? 'class= active': '' }"/>>
					<a href="food.mo${PAGEMAKER.makeSearch(idx) }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${PAGEMAKER.next && PAGEMAKER.endPage > 0 }">
				<li>
					<a href="food.mo${PAGEMAKER.makeSearch(PAGEMAKER.endPage + 1) }">></a>
					<a href="food.mo${PAGEMAKER.makeSearch(PAGEMAKER.end()) }">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>
		
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
		
		$("#searchBtn").on("click", function() {				
			self.location = "food.mo" +
			"${PAGEMAKER.makeQuery(1)}" + 
			"&searchType=" + $("select option:selected").val() +
			"&keyword=" + encodeURIComponent($("#keywordInput").val());
		});
	</script>
</body>

</html>
