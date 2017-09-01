<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ include file="adminHeader.jsp"%>
	
	<c:set var="boardVO" value="${READ}" />
    <div class="adminbox">

		<div><img src="../images/trip/${boardVO.img }"></div>
        <form class="input" name="myform" action="modifyPage.to" method="post" enctype="multipart/form-data" onsubmit="return writeCheck()">
            
            <input type="hidden" name="page" value="${CRI.page }">
        	<input type="hidden" name="perPageNum" value="${CRI.perPageNum }">
        	<input type="hidden" name="searchType" value="${CRI.searchType }">
        	<input type="hidden" name="keyword" value="${CRI.keyword }">
        	
            <ul>
            	<li>
            		<label for="input-tnum" class="readonly">관광지 게시물 번호</label>
            		<input type="text" name="tnum" value="${boardVO.tnum}" readonly="readonly">
            	</li>
                <li>
                    <label for="input-title" class="readonly">관광지 이름 입력</label>
                    <input type="text" name="title" class="id" id="input-title" placeholder="관광지 이름 입력" autofocus value="${boardVO.title}">
                </li>
                <li>
                    <label for="input-content" class="readonly">관광지 설명 입력</label>
                    <textarea name="content" id="content" placeholder="관광지 설명 입력" >${boardVO.content}</textarea>
                </li>
                <li>
                    <label for="input-address" class="readonly">관광지 주소 입력</label>
                    <input type="text" name="address" class="id" id="input-address" placeholder="관광지 주소 입력" value="${boardVO.address}">
                </li>
                 <li>
                    <label for="input-phone" class="readonly">관광지 연락처 입력</label>
                    <input type="text" name="phone" class="id" id="input-phone" placeholder="관광지 연락처 입력" value="${boardVO.phone}">
                </li>
                <li>
                    <label for="input-time" class="readonly">관광지 이용시간 입력</label>
                    <input type="text" name="time" class="id" id="input-time" placeholder="관광지 이용시간 입력" value="${boardVO.time}">
                </li> 
                 <li>
                    <label for="input-map" class="readonly">구글 지도 경로 입력</label>
                    <input type="text" name="map" class="id" id="input-map" placeholder="구글 지도 경로 입력" value="${boardVO.map}">
                </li>                                             
                <li>
                    <label for="input-img" class="filebox">관광지 사진</label>
                    <input type="file" id="input-img" onchange="fileName(this)">
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
        
        <form method="post" enctype="multipart/form-data" id="photo">
        	<input type="button" id="" value="사진 삭제" onclick="delPhoto()">
        	<input type="button" id="" value="사진 수정" onclick="modPhoto()">        	
        </form>
        
        <form role="form" action="modifyPage" method="post">
        	<input type="hidden" name="page" value="${CRI.page }">
        	<input type="hidden" name="perPageNum" value="${CRI.perPageNum }">
        	<input type="hidden" name="searchType" value="${CRI.searchType }">
        	<input type="hidden" name="keyword" value="${CRI.keyword }">
        </form>      
                
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
        
        $(".write-cancel").on("click", function() {
        	self.location = "list.to?page=${CRI.page}&perPageNum=${CRI.perPageNum}" +
        			"&searchType=${CRI.searchType}&keyword=${CRI.keyword}";
        });
        
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
        
        function delPhoto() {
        	console.log("del");
        }
        
        function modPhoto() {
        	console.log("mod");
        	
        	var formTag = document.getElementById("photo");
        	var formData = new FormData(formTag[0]);
        	
        	$.ajax({
        		type:"POST",
        		enctype: 'multipart/form-data',
        		proccessData: false,
        		contentType: false,
        		cache: false,
        		timeout: 600000,
        		url: "modPhoto.to",
        		data: formData,						//사진 데이터가 있는 폼데이터
        		dataType:"json",					//결과를 json 형식으로 리턴
        		success:function(res) {
        			
        		}, error: function() {
        			
        		}
        	});
        	
        	event.prventDefault();
        }

    </script>
</body>

</html>
