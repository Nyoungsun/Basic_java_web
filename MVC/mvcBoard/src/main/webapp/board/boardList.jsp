<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.coyote.http2.Http2AsyncUpgradeHandler"%>
<%@page import="board.bean.BoardPaging"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.dao.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link rel="stylesheet" href="../css/boardListStyle.css">
<link rel="stylesheet" href="../css/logoStyle.css">
</head>
<body>
	<div class="wrap" onclick="location.href='../index.jsp'">
		<div class="menu">LET'S HAVE SOME FUN THIS MOMENT</div>
		<div class="container">
			<div class="menu-mask">LET'S HAVE SOME FUN THIS MOMENT</div>
		</div>
	</div>

	<table border="1" cellpadding="5" cellspacing="0" frame="hsides"
		rules="rows">
		<tr>
			<th>글번호</th>
			<th width="1000">제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="boardList" items="${boardList }">
			<tr>
				<td class="center">${boardList.seq }</td>
				<td><a> ${boardList.subject }</a></td>
				<td class="center">${boardList.id }</td>
				<td class="center">${boardList.name }</td>
				<td class="center">${boardList.logtime }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="pageButton">${boardPaging.getPagingHTML() }</div>
	<script>
	
		function boardPaging(pg) {
				location.href = "boardList.do?pg=" + pg;
		}
		
		function sessionCheck(id, seq) {
			if (id == 'null') {
				alert("먼저 로그인하세요.");
				location.href="../index.jsp"
			} else {
				location.href="./boardView.jsp?seq=" + seq;
			}
		}
	</script>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
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