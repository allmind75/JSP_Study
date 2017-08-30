<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="adminHeader.jsp"%>

    <div class="adminbox">

        <form class="input" name="myform" action="write.po" method="post" enctype="multipart/form-data" onsubmit="return writeCheck()">
            
            <ul>
                <li>
                    <label for="input-title" class="readonly">특산물 이름 입력</label>
                    <input type="text" name="title" class="id" id="input-title" placeholder="특산물 이름 입력" autofocus>
                </li>
                <li>
                    <label for="input-content" class="readonly">특산물 설명 입력</label>
                    <textarea name="content" id="content" placeholder="특산물 설명 입력"></textarea>
                </li>
                <li>
                    <label for="input-address" class="readonly">특산물 주소 입력</label>
                    <input type="text" name="address" class="id" id="input-address" placeholder="특산물 주소 입력">
                </li>
                 <li>
                    <label for="input-phone" class="readonly">특산물 연락처 입력</label>
                    <input type="text" name="phone" class="id" id="input-phone" placeholder="특산물 연락처 입력">
                </li>
                <li>
                    <label for="input-link" class="readonly">특산물 홈페이지 주소 입력</label>
                    <input type="text" name="link" class="id" id="input-link" placeholder="특산물 홈페이지 주소 입력">
                </li> 
                 <li>
                    <label for="input-map" class="readonly">구글 지도 경로 입력</label>
                    <input type="text" name="map" class="id" id="input-map" placeholder="구글 지도 경로 입력">
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
                    <input type="reset" class="write-save write-cancel" value="목록">
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
        	self.location = "list.po";
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
    </script>
</body>

</html>
