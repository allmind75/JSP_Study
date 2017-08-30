<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>진주투어</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="../css/myStyle.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<!-- 바로기가 이이콘-->
<link rel="shortcut icon" href="../images/size57.png">
<link rel="apple-touch-icon" href="../images/size57.png">
<link rel="apple-touch-icon-precomposed" href="../images/size114.png">
</head>

<%
	String adminId = (String) session.getAttribute("ADMINID");
	String adminName = (String) session.getAttribute("ADMINNAME");
	String uri = request.getRequestURI().substring(request.getContextPath().length() + 7);
	
	System.out.println(uri);
	if (adminId == null || adminName == null) {
%>
<script>
	alert("관리자 권한이 필요합니다.\n관리자로 로그인해 주세요.");
	location.href = "/JinjuTour/admin/index.jsp";
</script>
<%
	}
%>

<body>
	<header class="header">
		<div class="headerTop">
			<a href="#" class="btn_gnb" id="menu-toggle"><i
				class="fa fa-navicon headericon"></i></a>
			<h1 class="logo">
				<a href="list.to">진주투어</a>
			</h1>
			<a href="#" class="btn_search"><i class="fa fa-search headericon"></i></a>
		</div>
		<div class="bar-search">
			<div class="inner">
				<form name="mysearch">
					<label for="search" class="readonly">검색단어 입력</label> <input
						type="text" name="search" class="search" id="search"
						placeholder="검색어를 입력하세요">
					<div class="btn_search2_wrap">
						<a href="#" class="btn_search2">검색</a>
					</div>
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
				<li><i class="fa fa-home active"></i><a href="list.to">HOME</a></li>
				<li><i class="fa fa-sign-in"></i><a href="logout.admin"
					id="loginState">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<section class="admin_tap_bar">
		<div class="admin_tab_cont">
			<header>
				<h2 class="readonly">탭메뉴</h2>
			</header>
			<ul>	
				<%
					if (uri.equals("listTrip.jsp") || uri.equals("readTrip.jsp") || uri.equals("modifyTrip.jsp")) {
				%>
						<li class="active"><a href="list.to">관광지</a></li>
				<%
					} else {
				%>
						<li><a href="list.to">관광지</a></li>
				<%
					}
				%>
				<%
					if (uri.equals("listFood.jsp") || uri.equals("readFood.jsp") || uri.equals("modifyFood.jsp")) {
				%>
						<li class="active" ><a href="list.fo">맛집</a></li>
				<%
					} else {
				%>
						<li><a href="list.fo">맛집</a></li>
				<%
					}
				%>
	
				<%
					if (uri.equals("listProduct.jsp") || uri.equals("readProduct.jsp") || uri.equals("modifyProduct.jsp")) {
				%>
						<li class="active"><a href="list.po">특산물</a></li>
				<%
					} else {
				%>
						<li><a href="list.po">특산물</a></li>
				<%
					}
				%>				
			</ul>
		</div>
	</section>