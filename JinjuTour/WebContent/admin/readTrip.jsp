<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ include file="adminHeader.jsp"%>
	
	<c:set var="boardVO" value="${READ}" />
    <div class="adminbox">

        <form class="input" name="myform" method="post" onsubmit="return writeCheck()">
            <ul>
                <li>
                    <label for="input-title" class="readonly">관광지 이름 입력</label>
                    <input type="text" name="title" class="id" id="input-title" placeholder="관광지 이름 입력" autofocus value="${boardVO.title}" readonly="readonly">
                </li>
                <li>
                    <label for="input-content" class="readonly">관광지 설명 입력</label>
                    <textarea name="content" id="content" placeholder="관광지 설명 입력" readonly="readonly">${boardVO.content}</textarea>
                </li>
                <li>
                    <label for="input-address" class="readonly">관광지 주소 입력</label>
                    <input type="text" name="address" class="id" id="input-address" placeholder="관광지 주소 입력" value="${boardVO.address}" readonly="readonly">
                </li>
                 <li>
                    <label for="input-phone" class="readonly">관광지 연락처 입력</label>
                    <input type="text" name="phone" class="id" id="input-phone" placeholder="관광지 연락처 입력" value="${boardVO.phone}" readonly="readonly">
                </li>
                <li>
                    <label for="input-time" class="readonly">관광지 이용시간 입력</label>
                    <input type="text" name="time" class="id" id="input-time" placeholder="관광지 이용시간 입력" value="${boardVO.time}" readonly="readonly">
                </li> 
                 <li>
                    <label for="input-map" class="readonly">구글 지도 경로 입력</label>
                    <input type="text" name="map" class="id" id="input-map" placeholder="구글 지도 경로 입력" value="${boardVO.map}" readonly="readonly">
                </li>                                             
            </ul>
            
        </form>
        
        <form role="form" action="modifyPage" method="post">
        	<input type="hidden" name="tnum" value="${boardVO.tnum }">
        	<input type="hidden" name="page" value="${CRI.page }">
        	<input type="hidden" name="perPageNum" value="${CRI.perPageNum }">
        	<input type="hidden" name="searchType" value="${CRI.searchType }">
        	<input type="hidden" name="keyword" value="${CRI.keyword }">
        </form>
        
        <div class="box-footer">
        	<button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
        	<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
        	<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
        	
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
        
        
        $(document).ready(function() {
        	var formObj = $("form[role='form']");
        	
        	$("#modifyBtn").on("click", function() {
        		formObj.attr("action", "modifyReadPage.to");
        		formObj.attr("method", "get");
        		formObj.submit();
        	});
        	
        	$("#removeBtn").on("click", function() {
        		formObj.attr("action", "removePage.to");
        		formObj.submit();
        	});
        	
        	$("#goListBtn").on("click", function() {
        		formObj.attr("action", "list.to");
        		formObj.attr("method", "get");
        		formObj.submit();
        	})
        })
    </script>
</body>

</html>
