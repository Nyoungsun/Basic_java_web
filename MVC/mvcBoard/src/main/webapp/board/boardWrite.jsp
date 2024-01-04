<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Writing</title>
</head>
<body>
	<script>
		window.onload = function() {
			alert("작성되었습니다.");
			location.href="/mvcBoard/board/boardList.do?pg=1";
		}
	</script>
</body>
</html>