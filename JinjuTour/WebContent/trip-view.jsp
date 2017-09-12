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
		<c:set var="boardVO" value="${READ }"/>
		<img class="imgw100" src="images/trip/${boardVO.img }" alt="${boardVO.title }">
		<div class="content">
			<h2 class="sub-title">${boardVO.title }</h2>

			<div class="info" id="info">
				<p class="sub-address">
					<i class="fa fa-map-marker"></i>${boardVO.address }
				</p>
				<p class="sub-address">
					<i class="fa fa-phone"></i>${boardVO.phone }
				</p>
			</div>

			<p class="sub-content">${boardVO.content }</p>

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
							<p class="heartCount1" id="heartCnt">${boardVO.heart }</p>
						</button>
					</li>
					<li><i class="fa fa-weixin reviewIcon"></i>
						<p class="reviewCount1">${boardVO.reply }</p></li>
					<li><i class="fa fa-eye"></i>
						<p class="reviewCount1">${boardVO.cnt }</p></li>
				</ul>

			</div>

			<iframe title="구글지도"
				src="${boardVO.map }"
				width="100%" height="300" frameborder="0" style="border: 0"
				allowfullscreen></iframe>
		</div>
		
        <!-- reply -->
        <section class="wrap-reply-list">
            <h3>전체댓글 <span>[15]</span></h3>
            <c:forEach items="${REPLYLIST}" var="replyVO">
            <ul>
                <li>
                    <div class="user-img"></div>
                </li>
                <li>
                    <p>${replyVO.replyer}</p>
                    <p>${replyVO.updatedate}</p>
                    <p>${replyVO.replytext}</p>
                    <a href="#">삭제</a>
                    <a href="#">수정</a>
                </li>
            </ul>
            </c:forEach>
        </section>

        <div class="wrap-reply-add">
            <textarea class="input-add" id="newReplyText" placeholder="댓글을 입력하세요" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
            <button type="submit" class="btn-add-reply" id="reaplyAddBtn" onclick="addReply()">등록</button>
        </div>
		
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
			var tnum = ${boardVO.tnum};
			
			if(id != "") {
				
				$.ajax({
					type : "GET",
					url : "heart.to",
					data : {
						"id" : id, 
						"num" : tnum
					},
					dataType : "JSON",
					error : function() {
						console.log("통신실패");
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
		
        //textarea 높이 증가
        function resize(obj) {
        	obj.style.height = "1px";
        	obj.style.height = (7 + obj.scrollHeight) + "px";
        }
        
		function addReply() {
			
			var tnum = ${boardVO.tnum};
			var id = "<%=userId%>";
			var replytext = document.getElementById("newReplyText").value;
			replytext = replytext.trim();
			
			if(id != "") {
				$.ajax({
					type : "GET",
					url : "replyAdd.to",
					data : {
						"tnum" : tnum,
						"id" : id, 
						"replytext" : replytext
					},
					dataType : "JSON",
					error : function() {
						console.log("실패");
					},
					success : function(data) {
						
						if(data.cnt == true) {
							document.getElementById("newReplyText").value = "";
							resize(document.getElementById("newReplyText"));
						} else if(data.cnt == false) {
							console.log("댓글 추가 실패");
						}			
					}
				});
			} else {
				alert("로그인 후 사용가능합니다.");
			}
		}
		
		//댓글 사진 추가 생각중....
		function replyImg(path) {
			
			if(path != 'null') {
				document.getElementById("userImg").style.backgroundImage = "url(images/userImg/" + path + ")";
			} else {
				document.getElementById("userImg").style.backgroundImage = "url(images/userImg/default.png)";
			}	
		}
		
		window.onload = function() {
			
			var time = "${boardVO.time }"			
			var timeArray = time.split(',');
			
			for(var i=0 ; i<timeArray.length ; i++) {
				
				var element = document.getElementById('info');
								
				if(timeArray[i].trim() != "") {
					if(i == 0) {
						element.innerHTML += "<p class='sub-address'><i class='fa fa-clock-o'></i><span>" 
						+ timeArray[i].trim() + "</span></p>"; 
					} else {
						element.innerHTML += "<p class='sub-address'><i class='fa fa-clock-o' style='color: #fff'></i><span>"
						+ timeArray[i].trim() + "</span></p>";
					}		
				}
			}
		}
	</script>
</body>

</html>
