<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String adminId = (String) session.getAttribute("ADMINID");
	String adminName = (String) session.getAttribute("ADMINNAME");
	
	if(adminId == null || adminName == null) {
%>
	<script>
		alert("관리자 권한이 필요합니다.\n관리자로 로그인해 주세요.");
		location.href = "/JinjuTour/admin/index.jsp";
	</script>
<%	
	}
%>