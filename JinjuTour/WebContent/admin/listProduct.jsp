<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="adminHeader.jsp"%>

	<div class="adminbox">
		<table class="list">
			<caption class="hidden">관광지 목록</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<!-- "*"  : 100%에서 사용 후 남은 공간 사용-->
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<th scope="col">번호</th>
				<!-- scope : 웹접근성, 어떤 요소인지 알려줌-->
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</thead>
			<tbody>
				<c:forEach items="${LIST}" var="boardVO">
					<tr>
						<td>${boardVO.pnum}</td>
						<td><a href="read.po${PAGEMAKER.makeSearch(PAGEMAKER.cri.page)}&pnum=${boardVO.pnum}">${boardVO.title}</a></td>
						<td>${boardVO.regdate.toString().substring(0, 11)}</td>
						<td>${boardVO.cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="paging">
		<select name="searchType">
			<option value="n" <c:out value="${CRI.searchType == null? 'selected':'' }"/> >---</option>
			<option value="t" <c:out value="${CRI.searchType == 't'? 'selected':'' }"/> >제목</option>
			<option value="c" <c:out value="${CRI.searchType == 'c'? 'selected':'' }"/> >내용</option>
			<option value="a" <c:out value="${CRI.searchType == 'a'? 'selected':'' }"/> >주소</option>
			<option value="tc" <c:out value="${CRI.searchType == 'tc'? 'selected':'' }"/> >제목 + 내용</option>
			<option value="ca" <c:out value="${CRI.searchType == 'ca'? 'selected':'' }"/> >내용 + 주소</option>
			<option value="tca" <c:out value="${CRI.searchType == 'tca'? 'selected':'' }"/> >제목 + 내용 + 주소</option>
		</select>
			
		<input type="text" name="keyword" id="keywordInput" value="${CRI.keyword }"	>
		<button id="searchBtn" class="btn">검색</button>
		<button id="newBtn" class="btn">글추가</button>
	</div>
		
	<!-- paging -->	
	<div class="paging">
		<ul class="pagination">
			<c:if test="${PAGEMAKER.prev }">
				<li>
					<a href="list.po${PAGEMAKER.makeSearch(0) }">&laquo;</a>
					<a href="list.po${PAGEMAKER.makeSearch(PAGEMAKER.startPage-1)}"><</a>
				</li>
			</c:if>
			
			<c:forEach begin="${PAGEMAKER.startPage }" end="${PAGEMAKER.endPage }" var="idx">
				<li <c:out value="${PAGEMAKER.cri.page == idx? 'class= active': '' }"/>>
					<a href="list.po${PAGEMAKER.makeSearch(idx) }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${PAGEMAKER.next && PAGEMAKER.endPage > 0 }">
				<li>
					<a href="list.po${PAGEMAKER.makeSearch(PAGEMAKER.endPage + 1) }">></a>
					<a href="list.po${PAGEMAKER.makeSearch(PAGEMAKER.end()) }">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>

	<footer class="footer">
		<p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
	</footer>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			
			$("#searchBtn").on("click", function() {
				
				self.location = "list.po" +
				"${PAGEMAKER.makeQuery(1)}" + 
				"&searchType=" + $("select option:selected").val() +
				"&keyword=" + encodeURIComponent($("#keywordInput").val());
			});
			
			$("#newBtn").on("click", function() {
				self.location = "writeProduct.jsp";
			});
		});
	</script>
</body>

</html>
