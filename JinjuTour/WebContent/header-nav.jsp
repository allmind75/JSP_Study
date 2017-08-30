<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String userId = (String) session.getAttribute("USERID");
	String userName = (String) session.getAttribute("USERNAME");
	String userEmail = (String) session.getAttribute("USEREMAIL");
	String userImg = (String) session.getAttribute("USERIMG");
	
	if (userId == null || userName == null || userEmail == null) {
		userId = "";
		userName = "";
		userEmail = "";
	}

	String uri = request.getRequestURI().substring(request.getContextPath().length() + 1);
	
	System.out.println(uri);
%>

<!-- ajax -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//회원탈퇴 ajax
	function delUser() {
		
		var con = confirm("회원탈퇴를 하시겠습니가?");
		
		if(con == true) {
			$.ajax({
				type : "GET",
				url : "delete.mem",
				dataType : "JSON",
				error : function() {
					console.log("ajax error");
				}, success : function(data) {
					
					if(data.ret == true) {
						alert("회원탈퇴가 완료되었습니다.");
						location.href="main.mo";
					} else {
						alert("회원탈퇴를 할 수 없습니다.");
					}
				}
			});
		}
		event.preventDefault();
	}
	
	window.onload = function() {
		var path = "<%=userImg%>";
		if(path != 'null') {
			document.getElementById("userImg").style.backgroundImage = "url(images/userImg/" + path + ")";
		} else {
			document.getElementById("userImg").style.backgroundImage = "url(images/userImg/default.png)";
		}
		console.log(path);
	}
</script>

<header class="header">
	<div class="headerTop">
		<a class="btn_gnb" id="menu-toggle"><i
			class="fa fa-navicon headericon"></i></a>
		<h1 class="logo">
			<a href="main.mo">진주투어</a>
		</h1>
		<a class="btn_search"><i class="fa fa-search headericon"></i></a>
	</div>
	<div class="bar-search">
		<div class="inner">
			<form name="mysearch">
				<label for="search" class="readonly">검색단어 입력</label> <input
					type="text" name="search" class="search" id="search"
					placeholder="검색어를 입력하세요">
				<div class="btn_search2_wrap">
					<a class="btn_search2">검색</a>
				</div>
			</form>
		</div>
	</div>
</header>

<nav id="slidebar-wrapper">
	<div id="nav-wrapper">
		<div class="nav-top">
			<a href="main.mo" id="menu-close" class="btn-close"><i
				class="fa fa-close"></i></a>
			<div class="slidebar-wrap">
				<div id="userImg" class="slidebar-brand"></div>
				<p class="userName"><%=userName%></p>
				<p class="userID"><%=userId%></p>
			</div>
			<p class="userMail"><%=userEmail%></p>

			<%
				if (userId == null || userId == "") {
			%>
					
			<%
				} else {
			%>
					<a href="loadMod.mem" class="userEdit"><i class="fa fa-edit"></i></a>
			<%
				}
			%>
		</div>
		<ul class="sidebar-nav">
			<li><i class="fa fa-home active"></i><a href="main.mo">HOME</a></li>

			<%
				if (userId == null || userId == "") {
			%>

					<li><i class="fa fa-sign-in"></i><a href="login.jsp"id="loginState">로그인</a></li>
					<li><i class="fa fa-flag-o"></i><a href="notice.jsp">공지사항</a></li>
					<li><i class="fa fa-question-circle-o"></i><a href="help.jsp">도움말</a></li>

			<%
				} else {
			%>
					<li><i class="fa fa-sign-in"></i><a href="logout.mem" id="loginState">로그아웃</a></li>
					<li><i class="fa fa-flag-o"></i><a href="notice.jsp">공지사항</a></li>
					<li><i class="fa fa-question-circle-o"></i><a href="help.jsp">도움말</a></li>
					<li><i class="fa fa-user-times"></i><a href="#" onclick="delUser()" id="loginState">회원탈퇴</a></li>
			<%
				}
			%>
		</ul>
	</div>
</nav>

<section class="tap_bar">
	<div class="tab_cont">
		<header>
			<h2 class="readonly">탭메뉴</h2>
		</header>
		<ul class="tab_links">
			<%
				if (uri.equals("main.jsp")) {
			%>
					<li class="active" id="active-main"><a href="main.mo">추천</a></li>
			<%
				} else {
			%>
					<li id="active-main"><a href="main.mo">추천</a></li>
			<%
				}
			%>

			<%
				if (uri.equals("trip.jsp") || uri.equals("trip-view.jsp")) {
			%>
					<li class="active" id="active-main"><a href="trip.mo">관광지</a></li>
			<%
				} else {
			%>
					<li id="active-main"><a href="trip.mo">관광지</a></li>
			<%
				}
			%>
			<%
				if (uri.equals("food.jsp") || uri.equals("food-view.jsp")) {
			%>
					<li class="active" id="active-main"><a href="food.mo">맛집</a></li>
			<%
				} else {
			%>
					<li id="active-main"><a href="food.mo">맛집</a></li>
			<%
				}
			%>

			<%
				if (uri.equals("product.jsp") || uri.equals("product-view.jsp")) {
			%>
					<li class="active" id="active-main"><a href="product.mo">특산물</a></li>
			<%
				} else {
			%>
					<li id="active-main"><a href="product.mo">특산물</a></li>
			<%
				}
			%>
		</ul>
	</div>
</section>