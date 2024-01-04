package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg")); 
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		int end = pg * 5;
		int start = end - 4;
		
		Map<String, Object> listMap = new HashMap<>(); 
		listMap.put("start", start);
		listMap.put("end", end);
		
		List<BoardDTO> boardList = boardDAO.boardList(listMap); 
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg); 
		boardPaging.setPageBlock(3); // 페이지 버튼 개수
		boardPaging.setPageSize(5); // 한 페이지에 몇 개씩 나타낼 것인지
		boardPaging.setTotalArticle(boardDAO.totalArticle()); //글개수
		boardPaging.makePaging();

		request.setAttribute("pg", pg);
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardPaging", boardPaging);
		return "/board/boardList.jsp";
	}

}
