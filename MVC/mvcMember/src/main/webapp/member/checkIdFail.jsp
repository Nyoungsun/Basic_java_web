<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: Pretendard-Regular;
	text-align: center;
	font-size: 16px;
}

input[type="button"], input[type="submit"] {
	font-family: Pretendard-Regular;
	font-size: 14px;
	color: #fff;
	padding: 5px;
	border: none;
	background: #1B2021;
	cursor: pointer;
}

input[type="submit"]:hover {
	color: #1B2021;
	background-color: #fff;
	transition: all 0.3s ease;
}

input[type="text"] {
	font-family: Pretendard-Regular;
	padding: 5px;
	font-size: 14px;
	color: #1B2021;
	border: 1px solid #e0e0e0;
	background-color: #fff;
}
</style>
</head>
<body>
	<form action="/mvcMember/member/checkId.do">
		<h2>${param.id }사용 불가</h2>
		<h3>다시 입력</h3>
		<input type="text" name="id">&nbsp;<input type="submit" value="중복 체크">
	</form>
</body>
</html>