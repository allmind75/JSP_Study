<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminCheck.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>진주투어</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="#" class="btn_gnb" id="menu-toggle"><i class="fa fa-navicon headericon"></i></a>
            <h1 class="logo"><a href="main.jsp">진주투어</a></h1>
            <a href="#" class="btn_search"><i class="fa fa-search headericon"></i></a>
        </div>
        <div class="bar-search">
            <div class="inner">
                <form name="mysearch">
                    <label for="search" class="readonly">검색단어 입력</label>
                    <input type="text" name="search" class="search" id="search" placeholder="검색어를 입력하세요">
                    <div class="btn_search2_wrap"><a href="#" class="btn_search2">검색</a></div>
                </form>
            </div>
        </div>
    </header>

    <nav id="slidebar-wrapper">
        <div id="nav-wrapper">
            <div class="nav-top">
				<a href="main.jsp" id="menu-close" class="btn-close"><i
					class="fa fa-close"></i></a>
				<div class="slidebar-wrap">
					<div id="userImg" class="slidebar-brand"></div>
					<p class="userName"><%=adminName%></p>
					<p class="userID"><%=adminId%></p>
				</div>
			</div>
			<ul class="sidebar-nav">
				<li><i class="fa fa-home active"></i><a href="/JinjuTour/admin/main.jsp">HOME</a></li>
				<li><i class="fa fa-sign-in"></i><a href="logout.admin" id="loginState">로그아웃</a></li>
		</ul>
        </div>
    </nav>
    <section class="admin_tap_bar">
        <div class="admin_tab_cont">
            <header>
                <h2 class="readonly">탭메뉴</h2>
            </header>
            <ul>
                <li class="active"><a href="/JinjuTour/admin/main.jsp">관광지</a></li>
                <li><a href="/JinjuTour/admin/food.jsp">맛집</a></li>
                <li><a href="/JinjuTour/admin/product.jsp">특산물</a></li>
            </ul>
        </div>
    </section>

    <div class="adminbox">
        <table class="list">
            <caption class="hidden">관광지 목록</caption>
            <colgroup>
                <col width="10%">
                <col width="*">
                <!-- "*"  : 100%에서 사용 후 남은 공간 사용-->
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead>
                <th scope="col">번호</th>
                <!-- scope : 웹접근성, 어떤 요소인지 알려줌-->
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
            </thead>
            <tbody>
                <tr>
                    <td>43</td>
                    <td>진주성</td>
                    <td>2017-05-27</td>
                    <td>75</td>
                </tr>
            </tbody>
        </table>
        <div class="paging">
            <strong>1</strong>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">
                <i class="fa fa-angle-double-right"></i>
            </a>
            <a href="write.jsp" class="write-btn">글쓰기</a>
        </div>
    </div>

    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
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
    </script>
</body>

</html>
