<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

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
        	if(myform.title.value.trim() == "") {
        		alert("제목을 입력해 주세요.");
        		return false;
        	}
        	if(myform.address.value.trim() == "") {
        		alert("주소를 입력해 주세요.");
        		return false;
        	}
			
        	return true;
        }
        
        function fileName(fis) {
        	var str = fis.value;
        	var name = fis.value.substring(str.lastIndexOf("\\") + 1);
        	document.getElementById("fileName").innerHTML = name;
        	document.getElementById("fileName-wrap").style.display = "block";
        }
        
        function fileDelete() {
        	var img = document.getElementById("input-img");
        	
			//선택한 파일 초기화
        	img.type="";
        	img.type="file";
        	document.getElementById("fileName-wrap").style.display = "none";
        }
        
    </script>
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="#" class="btn_gnb" id="menu-toggle"><i class="fa fa-navicon headericon"></i></a>
            <h1 class="logo"><a href="listTrip.board">진주투어</a></h1>
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
                <li><a href="listTrip.board">관광지</a></li>
                <li><a href="list.fo">맛집</a></li>
                <li class="active"><a href="list.po">특산물</a></li>
            </ul>
        </div>
    </section>

	
	<c:set var="boardVO" value="${READ}" />
    <div class="adminbox">

        <form class="input" name="myform" action="modifyPage.po" method="post" enctype="multipart/form-data" onsubmit="return writeCheck()">
            
            <input type="hidden" name="page" value="${CRI.page }">
        	<input type="hidden" name="perPageNum" value="${CRI.perPageNum }">
        	<input type="hidden" name="searchType" value="${CRI.searchType }">
        	<input type="hidden" name="keyword" value="${CRI.keyword }">
        	
            <ul>
            	<li>
            		<label for="input-tnum" class="readonly">특산물 게시물 번호</label>
            		<input type="text" name="pnum" value="${boardVO.pnum}" readonly="readonly">
            	</li>
                <li>
                    <label for="input-title" class="readonly">특산물 이름 입력</label>
                    <input type="text" name="title" class="id" id="input-title" placeholder="특산물 이름 입력" autofocus value="${boardVO.title}">
                </li>
                <li>
                    <label for="input-content" class="readonly">특산물 설명 입력</label>
                    <textarea name="content" id="content" placeholder="특산물 설명 입력" >${boardVO.content}</textarea>
                </li>
                <li>
                    <label for="input-address" class="readonly">특산물 주소 입력</label>
                    <input type="text" name="address" class="id" id="input-address" placeholder="특산물 주소 입력" value="${boardVO.address}">
                </li>
                 <li>
                    <label for="input-phone" class="readonly">특산물 연락처 입력</label>
                    <input type="text" name="phone" class="id" id="input-phone" placeholder="특산물 연락처 입력" value="${boardVO.phone}">
                </li>
                <li>
                    <label for="input-link" class="readonly">특산물 홈페이지 주소 입력</label>
                    <input type="text" name="link" class="id" id="input-link" placeholder="특산물 홈페이지 주소 입력" value="${boardVO.link}">
                </li> 
                 <li>
                    <label for="input-map" class="readonly">구글 지도 경로 입력</label>
                    <input type="text" name="map" class="id" id="input-map" placeholder="구글 지도 경로 입력" value="${boardVO.map}">
                </li>                                             
                <li>
                    <label for="input-img" class="filebox">특산물 사진</label>
                    <input type="file" name="img" id="input-img" onchange="fileName(this)">
                    <div id="fileName-wrap" style="display:none;">
                    	<p>파일이름 : <span id="fileName"></span></p>
                    	<button type="button" class="filebox" onclick="fileDelete()">삭제</button>
                    </div>
                </li>
                <li>
                    <input type="submit" class="write-save" value="저장">
                    <input type="button" class="write-save write-cancel" value="취소">
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
        
        $(".write-cancel").on("click", function() {
        	self.location = "list.po?page=${CRI.page}&perPageNum=${CRI.perPageNum}" +
        			"&searchType=${CRI.searchType}&keyword=${CRI.keyword}";
        });

    </script>
</body>

</html>
