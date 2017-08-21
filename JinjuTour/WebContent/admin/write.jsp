<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>진주투어</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <script>
        function writeCheck() {

        }
    </script>
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="#" class="btn_gnb" id="menu-toggle"><i class="fa fa-navicon headericon"></i></a>
            <h1 class="logo"><a href="main.html">진주투어</a></h1>
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
                <a href="main.html" id="menu-close" class="btn-close"><i class="fa fa-close"></i></a>
            </div>
            <ul class="sidebar-nav">
                <li><i class="fa fa-home active"></i><a href="main.html">HOME</a></li>
                <!--<li><i class="fa fa-user-plus "></i><a href="member.html">로그아웃</a></li>-->
                <li><i class="fa fa-flag-o"></i><a href="#">관광지</a></li>
                <li><i class="fa fa-question-circle-o"></i><a href="#">맛집</a></li>
                <li><i class="fa fa-question-circle-o"></i><a href="#">특산물</a></li>
                <li><i class="fa fa-gear"></i><a href="setting.html">설정</a></li>
            </ul>

        </div>
    </nav>
    <section class="admin_tap_bar">
        <div class="admin_tab_cont">
            <header>
                <h2 class="readonly">탭메뉴</h2>
            </header>
            <ul>
                <li class="active"><a href="main.html">관광지</a></li>
                <li><a href="../food.html">맛집</a></li>
                <li><a href="../product.html">특산물</a></li>
            </ul>
        </div>
    </section>

    <div class="adminbox">

        <form class="input" name="myform" action="member.html" method="get" enctype="multipart/form-data">
            <ul>
                <li>
                    <label for="input-id" class="readonly">관광지 이름 입력</label>
                    <input type="text" name="id" class="id" id="input-id" placeholder="관광지 이름 입력">
                </li>
                <li>
                    <label for="input-pw" class="readonly">관광지 정보 입력</label>
                    <textarea name="content" placeholder="관광지 정보 입력"></textarea>
                </li>
                <li>
                    <label for="input-pw" class="readonly">관광지 주소 입력</label>
                    <input type="password" name="pw" class="pw" id="input-pw" placeholder="관광지 주소 입력">
                </li>
                <li>
                    <label for="input-img" class="filebox">관광지 사진 업로드</label>
                    <input type="file" name="input-img" id="input-img">
                </li>
                <li>
                    <button type="button" onClick="javascript:writeCheck();" class="write-save">저장</button>
                    <button type="button" onClick="javascript:history.back();" class="write-cancel">취소</button>    <!--history.back() : 뒤로가기-->
                </li>
            </ul>
        </form>
    </div>

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
