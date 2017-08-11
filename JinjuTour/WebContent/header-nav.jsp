<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String userId = (String) session.getAttribute("USERID");
	String userName = (String) session.getAttribute("USERNAME");
	String userEmail = (String) session.getAttribute("USEREMAIL");

	if (userId == null || userName == null || userEmail == null) {
		userId = "";
		userName = "";
		userEmail = "";
	}
%>

<header class="header">
	<div class="headerTop">
		<a class="btn_gnb" id="menu-toggle"><i
			class="fa fa-navicon headericon"></i></a>
		<h1 class="logo">
			<a href="main.jsp">진주투어</a>
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
			<a href="main.html" id="menu-close" class="btn-close"><i
				class="fa fa-close"></i></a>
			<div class="slidebar-wrap">
				<div class="slidebar-brand"></div>
				<p class="userName"><%=userName%></p>
				<p class="userID"><%=userId%></p>
			</div>
			<p class="userMail"><%=userEmail%></p>
			<a href="userInfoEdit.jsp" class="userEdit"><i class="fa fa-edit"></i></a>
		</div>
		<ul class="sidebar-nav">
			<li><i class="fa fa-home active"></i><a href="main.jsp">HOME</a></li>

			<%
				if (userId == null || userId == "") {
			%>

			<li><i class="fa fa-sign-in"></i><a href="login.jsp"
				id="loginState">로그인</a></li>

			<%
				} else {
			%>
			<li><i class="fa fa-sign-in"></i><a href="logout.mem"
				id="loginState">로그아웃</a></li>
			<li><i class="fa fa-user-times"></i><a href="deleteMem.mem" id="loginState">회원탈퇴</a></li>
			<%
				}
			%>

			<li><i class="fa fa-flag-o"></i><a href="notice.jsp">공지사항</a></li>
			<li><i class="fa fa-question-circle-o"></i><a href="help.jsp">도움말</a></li>	
		</ul>
	</div>
</nav>