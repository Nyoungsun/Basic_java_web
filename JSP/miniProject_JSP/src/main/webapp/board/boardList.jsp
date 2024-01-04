<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.coyote.http2.Http2AsyncUpgradeHandler"%>
<%@page import="board.bean.BoardPaging"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.dao.BoardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//DB
BoardDAO boardDAO = BoardDAO.getInstance();

//세션
String id = (String) session.getAttribute("id");

//검색어
String colName = request.getParameter("colName");
String colValue = request.getParameter("colValue");

//페이징
int pg = Integer.parseInt(request.getParameter("pg")); 

int end = pg * 5;
int start = end - 4;

Map<String, Object> listMap = new HashMap<>(); 
listMap.put("start", start);
listMap.put("end", end);
listMap.put("colName", colName);
listMap.put("colValue", colValue);

Map<String, Object> countMap = new HashMap<>(); 
countMap.put("colName", colName);
countMap.put("colValue", colValue);

BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg); 
boardPaging.setPageBlock(3); // 페이지 버튼 개수
boardPaging.setPageSize(5); // 한 페이지에 몇 개씩 나타낼 것인지
boardPaging.setTotalArticle(boardDAO.totalArticle(countMap)); //글개수
boardPaging.makePaging();

//글목록
List<BoardDTO> boardList = boardDAO.boardList(listMap); 
%>

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

	<table border="1" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
		<tr>
			<th>글번호</th>
			<th width="1000">제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<%
		if (boardList != null) { 
			for (BoardDTO boardDTO : boardList) {
		%>
		<tr>
			<td class="center"><%=boardDTO.getSeq()%></td>
			<td><a onclick="sessionCheck('<%=id%>', <%=boardDTO.getSeq()%>)">
					<%=boardDTO.getSubject()%></a></td>
			<td class="center"><%=boardDTO.getId()%></td>
			<td class="center"><%=boardDTO.getHit()%></td>
			<td class="center"><%=new SimpleDateFormat("yyyy.MM.dd.").format(boardDTO.getLogtime())%></td>
		</tr>
		<%}%>
	<%} else {%>
		<tr>
			<td class="center" colspan='5'>게시글이 없습니다.</td>
		</tr>
	<%} %>
		</table>
	<div id="pageButton">
		<%=boardPaging.getPagingHTML()%>
	</div>
	<form name="Search" method="get" action="./boardList.jsp">
	<div id="search">
		<select id="colName" name="colName">
			<option value="" 		<%="".equals(colName) ? "selected" : ""%>>		        </option>
			<option value="id"  	<%="id".equals(colName) ? "selected" : ""%>>      작성자</option>
			<option value="subject" <%="subject".equals(colName) ? "selected" : ""%>>   제목</option>
			<option value="seq" 	<%="seq".equals(colName) ? "selected" : ""%>>     글번호</option>
		</select> 
		<input type="text" id="colValue" name="colValue" value=<%=(colValue==null) ? "" : colValue%>>
		<input type="hidden" name="pg" value="<%=pg%>">
		<input type="submit" value="검색">
	</div>
	</form>
	<script>
	
		function boardPaging(pg) {
			var colName = document.getElementById("colName").value;
			var colValue = document.getElementById("colValue").value;
			
			if(colName == "" || colValue == "") {
				location.href = "boardList.jsp?pg=" + pg;
			} else {
				document.Search.submit();
			}
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