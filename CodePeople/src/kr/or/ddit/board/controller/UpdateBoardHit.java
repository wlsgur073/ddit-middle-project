package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/UpdateBoardHit.do")
public class UpdateBoardHit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		BoardVO boardVO = new BoardVO();
		
		Integer boardNo = req.getParameter("boardNo") == null?
				0 : Integer.parseInt(req.getParameter("boardNo"));
		Integer boardCodeNo = req.getParameter("boardCodeNo") == null?
				0 : Integer.parseInt(req.getParameter("boardCodeNo"));
		
		boardVO.setBoardNo(boardNo);
		boardVO.setBoardCodeNo(boardCodeNo);
		
		int result = boardService.addBoardHit(boardVO);
		
		req.setAttribute("result", result);
		
		req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
		
	}
}
