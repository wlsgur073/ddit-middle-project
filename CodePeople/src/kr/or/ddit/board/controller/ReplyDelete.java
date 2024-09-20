package kr.or.ddit.board.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.util.CheckRight;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
//		HttpSession session = req.getSession();
		
//		MemberVO loginMember = (MemberVO)session.getAttribute("memberVO");
		
		Integer repNo = Integer.parseInt(req.getParameter("repNo"));
		
		System.out.println("삭제 서블릿 " + repNo);
		
		// 鍮꾪쉶�썝 �뙎湲��궘�젣 沅뚰븳 �뾾�쓬
//		if(loginMember == null) {
//			
//			req.setAttribute("result", 0);
//			
//			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
//			
//		}else{
			
			ReplyVO replyVO = new ReplyVO();
			
//			replyVO.setMemNo(loginMember.getMemNo());
			replyVO.setRepNo(repNo);
			
			// �옄�떊�씠 �옉�꽦�븳 �뙎湲��씤 寃쎌슦 �궘�젣 沅뚰븳 �엳�쓬
//			if(CheckRight.hasReplyRight(replyVO)) {
				
			int result = boardService.replyDelete(repNo);
				
			req.setAttribute("result", result);
				
			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
				
			// �떎瑜� �궗�엺�씠 �옉�꽦�븳 �뙎湲� �닔�젙 沅뚰븳 �뾾�쓬
//			}else {
//				
//				req.setAttribute("result", 0);
//				
//				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
//			}
//		}
		
	}
}
