package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.cmm.vo.BoardPagingVO;

@WebServlet("/BoardPagingList.do")
public class BoardPagingList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		BoardPagingVO boardPagingVO = new BoardPagingVO();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				0 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		
		int boardCode = req.getParameter("boardCode") == null ?
				1 : Integer.parseInt(req.getParameter("boardCode"));
		
		
		req.setAttribute("currentPageNo", currentPageNo);
		req.setAttribute("boardCode", boardCode);
		
		
		int totalCount = 0;
		
		switch(boardCode) {
		case 1:
			totalCount = boardService.countQuestionBoard();
			break;
		case 2:
			totalCount = boardService.countLifeBoard();
			break;
		case 3:
			totalCount = boardService.countBlahBoard();
			break;
		case 4:
			totalCount = boardService.countMeetUpBoard();
			break;
		case 5:
			totalCount = boardService.countCareerBoard();
			break;
		default:
			break;
		}
		
		
		boardPagingVO.setCurrentPageNo(currentPageNo);
		
		boardPagingVO.setTotalCount(totalCount);
		
		List<Map<String,Object>> boardPagingList = null;
		
		switch(boardCode) {
		case 1:
			boardPagingList = boardService.QuestionBoardPagingList(boardPagingVO);
			break;
		case 2:
			boardPagingList = boardService.LifeBoardPagingList(boardPagingVO);
			break;
		case 3:
			boardPagingList = boardService.blahBoardPagingList(boardPagingVO);
			break;
		case 4:
			boardPagingList = boardService.MeetUpBoardPagingList(boardPagingVO);
			break;
		case 5:
			boardPagingList = boardService.CareerBoardPagingList(boardPagingVO);
			break;
		default:
			break;
		}
		
		req.setAttribute("boardPagingList", boardPagingList);
		
		req.setAttribute("boardPagingVO", boardPagingVO);
		
		
		
		req.getRequestDispatcher("/mainJsp/EachBoard.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
