<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
	div {width: 400px; margin: 0 auto; padding: 0;}
	.input {width: 100%; height: 50px; margin: 5px 0; border: 1px solid #c3c3c3; padding: 8px;font-size: 16px; border-radius: 3px;}
	.submit {width: 100%; height: 50px; line-height: 50px; display: block; background: #03c3c7; text-align: center; color: #fff; margin: 10px 0; font-size: 18px; border-radius: 3px;}
</style>
</head>
<body>


	<div>
		<form action="login_proc.jsp" method="post">
			<input class="input" type="text" name="id" placeholder="아이디 입력" autofocus required><br>
			<input class="input" type="password" name="pw" placeholder="비밀번호 입력" required><br>
			<input class="submit" type="submit" value="로그인">
			<input class="submit" type="reset" value="취소">
		</form>
	</div>
</body>
</html>