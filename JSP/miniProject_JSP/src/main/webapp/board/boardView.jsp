<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int seq = Integer.parseInt(request.getParameter("seq"));

BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO dto = boardDAO.boardView(seq);

String subject = dto.getSubject();
String content = dto.getContent();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="../css/logoStyle.css">
<link rel="stylesheet" href="../css/boardViewStyle.css">

</head>
<body>
	<div class="wrap" onclick="location.href='../index.jsp'">
		<div class="menu">LET'S HAVE SOME FUN THIS MOMENT</div>
		<div class="container">
			<div class="menu-mask">LET'S HAVE SOME FUN THIS MOMENT</div>
		</div>
	</div>

	<table border="1" cellpadding="10" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<td id="subject" colspan="6"><%=subject%></td>
		</tr>
		<tr>
			<th>글번호</th>
			<td><%=seq%></td>
			<th>작성자</th>
			<td><%=dto.getId()%></td>
			<th>조회수</th>
			<td><%=dto.getHit()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6" height='200'>
				<div id='prewrap'><%=content%></div>
			</td>
		</tr>
	</table>
	<div id="center">
		<input type="button" name="write" value="목록" onclick='history.go(-1)'>
	</div>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
	<script>
	const container = document.querySelector(".container");

	document.body.addEventListener("mousemove", e => {
	  const x = e.clientX;
	  const y = e.clientY - 35;
	  gsap.to(container, {
	    y: y
	  });
	  gsap.to(".menu-mask", {
	    y: -y
	  });
	});
	</script>
</body>
</html>