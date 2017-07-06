<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Daum 우편번호 서비스 API 테스트</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function SearchAddr() {
		
		var width = 600; //팝업의 너비
		var height = 700; //팝업의 높이
		var themeObj = {
				   //bgColor: "", //바탕 배경색
				   searchBgColor: "#0B65C8", //검색창 배경색
				   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
				   //pageBgColor: "", //페이지 배경색
				   //textColor: "", //기본 글자색
				   queryTextColor: "#FFFFFF", //검색창 글자색
				   //postcodeTextColor: "", //우편번호 글자색
				   //emphTextColor: "", //강조 글자색
				   //outlineColor: "" //테두리
				};
		
		new daum.Postcode({
			
		    width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
		    height: height,
		    theme: themeObj,
		    
			oncomplete : function(data) {
		
				alert(data.address);
				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zonecode').value = data.zonecode;
                document.getElementById('postcode').value = data.postcode; //5자리 새우편번호 사용
                document.getElementById('address').value = data.address;
                document.getElementById('address2').value = data.addressEnglish;
            }
		}).open({
		    left: (window.screen.width / 2) - (width / 2),
		    top: (window.screen.height / 2) - (height / 2)
		});
	}
</script>
</head>
<body>
	<form method="get" action="">
		<input type="button" value="주소검색" onClick="SearchAddr()"> <input
			type="submit" value="클릭">
	</form>

	6자리 우편번호 <input type="text" id="zonecode" name="zonecode" readonly><br>
	5자리 우편번호 <input type="text" id="postcode" name="postcode" readonly><br>
	주소 <input type="text" id="address" name="address" readonly><br>
	영문주소 <input type="text" id="address2" name="address2" readonly><br>
</body>
</html>