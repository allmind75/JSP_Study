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

	<section class="sub-contents-view">
		<c:set var="boardVO" value="${READ}"/>
		<img class="imgw100" src="images/product/${boardVO.img}" alt="${boardVO.title}">
		<div class="content">
			<h2 class="sub-title">${boardVO.title}</h2>

			<div class="info" id="info">
				<a href="#">
					<p class="sub-address">
						<i class="fa fa-map-marker"></i>${boardVO.address}
					</p>
				</a>
				<p class="sub-address">
					<i class="fa fa-phone"></i>${boardVO.phone}
				</p>
				
				<script>
					var link = "${boardVO.link }"			
						var element = document.getElementById('info');
										
						if(link != "") {
							element.innerHTML += "<a href='${boardVO.link}' target='_blank'><p class='sub-address'><i class='fa fa-home'></i>" 
							+ link + "</p></a>"				
						}
				</script>
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
						<p class="reviewCount1" id="reply">${boardVO.reply}</p></li>
					<li><i class="fa fa-eye"></i>
						<p class="reviewCount1">${boardVO.cnt}</p></li>
				</ul>

			</div>
			<iframe title="구글지도"
				src="${boardVO.map }"
				width="100%" height="300" frameborder="0" style="border: 0"
				allowfullscreen></iframe>
		</div>

        <!-- reply -->
        <c:set var="mapReplyImg" value="${REPLYIMG}"/>
        <section class="wrap-reply-list">
            <h3>전체댓글 <span id="reply-count"></span></h3>
            <div id="reply-list"></div>
        </section>
		
		<!-- reply paging -->	
		<div class="paging">
			<ul class="pagination">
			</ul>
		</div>
	
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

		var id = "<%=userId%>";
		var pnum = ${boardVO.pnum};
		
		function heartCnt() {
			
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
						
						document.getElementById("heartCnt").innerHTML = data.cnt;
					}
				});
			} else {
				alert("로그인 후 사용가능합니다.");
			}
		}
		
        //textarea 엔터 입력시 height 증가
        function resize(obj) {
        	obj.style.height = "1px";
        	obj.style.height = (7 + obj.scrollHeight) + "px";
        }
        		
        var replyPage = 1;
        
		function listReply(page) {
			
			$.ajax({
				type: "GET",
				url: "replyListProduct.po",
				data: {
					"pnum": pnum,
					"page": page
				},
				dataType:"JSON",
				error: function() {
					console.log("댓글 목록 통신 실패");
				},
				success: function(data) {
						
					var str = "";
					
					//data에 저장된 JSON 형태의 데이터 출력
					$(data.LISTREPLY).each(function() {	
						
						var date = this.updatedate;
						var subdate = date.substring(0,16);
						
						if(this.path == null) {
							str += "<ul id='reply-ul'><li><div class='user-img' id='user-img' style='background-Image: url(images/userImg/default.png)'></div></li>";
						} else {
							str += "<ul><li><div class='user-img' id='user-img' style='background-Image: url(images/userImg/" + this.path + ")'></div></li>";
						}

						
						str += "<li id='reply-li'><p>" + this.replyer + "</p><p>" + subdate + "</p><p id='replytext'>" + this.replytext + "</p>";
						
						if(id == this.replyer) {
							str += "<p><a href='#' onclick='removeReply(" + this.rno + ")'>삭제</a>" + 
							"<a href='#' onclick=\"modifyReply(" + this.rno + ',' + "'" + this.replytext + "')\">수정</a></li></ul>";
						} else {
							str += "</li></ul>";
						}
						
					});
					
					//페이징
					printPaging(data.PAGEMAKER);
					
					console.log(data.PAGEMAKER);
					
					$("#reply-count").html("[" + data.COUNT + "]");
					$("#reply").html(data.COUNT);
					$("#reply-list").html(str);
					
				}
			});
		}
		
		function addReply() {
			event.preventDefault();
			
			var replytext = document.getElementById("newReplyText").value;
			replytext = replytext.trim();
			
			if(id != "") {
				$.ajax({
					type: "POST",
					url: "replyAdd.po",
					data: {
						"pnum" : pnum,
						"id" : id, 
						"replytext" : replytext
					},
					dataType: "JSON",
					error: function() {
						console.log("댓글 추가 통신 실패");
					},
					success: function(data) {
						
						if(data.cnt == true) {
							alert("등록 되었습니다.");
							
							document.getElementById("newReplyText").value = "";
							resize(document.getElementById("newReplyText"));
							
							//댓글 목록 ajax
							listReply(replyPage);
							
						} else if(data.cnt == false) {
							console.log("댓글 추가 실패");
						}			
					}
				});
			} else {
				alert("로그인 후 사용가능합니다.");
			}
		}
		
		function removeReply(rno) {
			
			event.preventDefault();
			console.log("remove : " + rno);
			
			$.ajax({
				type: "POST",
				url: "replyRemove.po",
				data: {
					"rno": rno
				},
				dataType: "JSON",
				error: function() {
					console.log("댓글 삭제 통신 실패");
				},
				success: function(data) {
					console.log("성공");
					
					if(data.cnt == true) {					
						alert("삭제 되었습니다.");
						listReply(replyPage);					
					} else if(data.cnt == false) {
						console.log("댓글 삭제 실패");
					}
				}	
			});
		}
		
		function modifyReply(rno, replytext) {
			
			event.preventDefault();
			var modReplyText = prompt("댓글 수정", replytext);
		
			if(modReplyText != null) {
				$.ajax({
					type: "POST",
					url: "replyModify.po",
					data: {
						"rno": rno,
						"replytext": modReplyText
					},
					dataType: "JSON",
					error: function() {
						console.log("댓글 수정 통신 실패");
					},
					success: function(data) {
						console.log("성공");
						
						if(data.cnt == true) {
							alert("수정 되었습니다.");
							listReply(replyPage);
						}
					}
				});
			} else {
				console.log("댓글 수정 취소");
			}
		}
		
		var printPaging = function(pageMaker) {
			
			var str = "";
			
			if(pageMaker.prev) {
				str += "<li><a href = '" + (pageMaker.startPage - 1) + "'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len ; i++) {
				var strClass = pageMaker.cri.page == i? 'class=active' : '';
				str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>"; 
			}
			
			if(pageMaker.next) {
				str += "<li><a href= '" + (pageMaker.endPage + 1) + "'> >> </a></li>";
			}
			
			$(".pagination").html(str);
		}
		
		$(".pagination").on("click", "li a", function(event){
			
			event.preventDefault();
			
			replyPage = $(this).attr("href");
			
			listReply(replyPage);
		});
		
		window.onload  = function() {
			
			//댓글 리스트
			listReply(replyPage);
		}
	</script>
</body>

</html>
