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

@WebServlet("/EachBoardPaging.do")
public class EachBoardPaging extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		BoardPagingVO boardPagingVO = new BoardPagingVO();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				1 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		int boardCode = req.getParameter("boardCode") == null ?
				1 : Integer.parseInt(req.getParameter("boardCode"));
		
		System.out.println(currentPageNo + " : �쁽�옱�럹�씠吏�");
		System.out.println(boardCode + " : 寃뚯떆�뙋醫낅쪟");
		String boardName = "";
		
		int totalCount = 0;
		
		switch(boardCode) {
		case 1:
			totalCount = boardService.countLifeBoard();
			boardName = "회사생활";
			break;
		case 2:
			totalCount = boardService.countBlahBoard();
			boardName = "사는 얘기";
			break;
		case 3:
			totalCount = boardService.countCareerBoard();
			boardName = "이직 커리어";
			break;
		case 4:
			totalCount = boardService.countMeetUpBoard();
			boardName = "스터디 모임";
			break;
		case 5:
			totalCount = boardService.countQuestionBoard();
			boardName = "Q&A";
			break;
		default:
			break;
		}
		
		
		boardPagingVO.setCurrentPageNo(currentPageNo);
		
		boardPagingVO.setTotalCount(totalCount);
		
		List<Map<String,Object>> boardPagingList = null;
		
		switch(boardCode) {
		case 1:
			boardPagingList = boardService.LifeBoardPagingList(boardPagingVO);
			break;
		case 2:
			boardPagingList = boardService.blahBoardPagingList(boardPagingVO);
			break;
		case 3:
			boardPagingList = boardService.CareerBoardPagingList(boardPagingVO);
			break;
		case 4:
			boardPagingList = boardService.MeetUpBoardPagingList(boardPagingVO);
			break;
		case 5:
			boardPagingList = boardService.QuestionBoardPagingList(boardPagingVO);
			break;
		default:
			break;
		}
		
		req.setAttribute("boardPagingList", boardPagingList);
		
		System.out.println(boardPagingList == null);
		
		req.setAttribute("boardPagingVO", boardPagingVO);
		req.setAttribute("currentPageNo", currentPageNo);
		req.setAttribute("boardName", boardName);
		req.setAttribute("boardCode", boardCode);
		
//		req.getRequestDispatcher("/WEB-INF/jsp/BoardPagingList.jsp").forward(req, resp);
		req.getRequestDispatcher("/mainJsp/EachBoard.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
