<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>진주투어</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <header class="header">
        <div class="headerTop">
            <a href="main.jsp" class="btn_back" id="menu-toggle"><i class="fa fa-chevron-left"></i></a>
            <h1 class="logo">회원 정보 수정</h1>
        </div>
    </header>
    <section class="section-join">
        <header>
            <h2 class="readonly">회원 정보 수정</h2>
        </header>
        <div class="wrap">
            <form class="input" name="myform" action="" method="get">
                <label for="input-join-name" class="readonly">사용자 이름 변경</label>
                <input type="text" name="name" class="join-name" id="input-join-name" placeholder="사용자 이름 변경">

                <label for="input-join-pw" class="readonly">비밀번호 변경</label>
                <input type="password" name="pw" class="join-pw" id="input-join-pw" placeholder="비밀번호 변경 (6 ~ 15자 이내)">

                <label for="input-pw-check" class="readonly">비밀번호 확인</label>
                <input type="password" name="pw-check" class="pw-check" id="input-pw-check" placeholder="비밀번호 확인">

                <label for="input-email" class="readonly">이메일 변경</label>
                <input type="text" name="email" class="email" id="input-email" placeholder="E-Mail (비밀번호 분실 시 필요합니다.)">

                <div class="wrap-phoneNum">
                    <label for="input-phoneNum1" class="readonly">전화번호 변경</label>
                    <select name="phoneNum1" id="input-phoneNum1">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="017">017</option>
                    </select>
                    <label for="input-phoneNum2" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum2" id="input-phoneNum2">
                    <label for="input-phoneNum3" class="readonly">전화번호 입력</label>
                    <input type="text" name="phoneNum3" id="input-phoneNum3">
                </div>
            </form>

            <a class="join" onClick="javascript:loginCheck();" href="main.jsp">저장</a>
        </div>
    </section>
    <footer class="footer">
        <p>COPYRIGHT JinjuTour ALL RIGHTS RESERVED</p>
    </footer>
</body>

</html>
