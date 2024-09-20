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

@WebServlet("/UpdateReplyRept.do")
public class UpdateReplyRept extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		Integer repNo = req.getParameter("repNo") == null?
				0 : Integer.parseInt(req.getParameter("repNo"));
		
		System.out.println(repNo);
		
		int result = boardService.addReplyRept(repNo);
		
		req.setAttribute("result", result);
		
		req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
		
	}
}
