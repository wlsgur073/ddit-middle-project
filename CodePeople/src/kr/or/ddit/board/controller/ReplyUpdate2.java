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

@WebServlet("/ReplyUpdate2.do")
public class ReplyUpdate2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");

		IBoardService boardService = BoardServiceImpl.getInstance();

		HttpSession session = req.getSession();

//		MemberVO loginMember = (MemberVO) session.getAttribute("memberVO");

		Integer repNo = req.getParameter("repNo") == null?
				0 : Integer.parseInt(req.getParameter("repNo"));

		// 鍮꾪쉶�썝 �뙎湲��닔�젙 沅뚰븳 �뾾�쓬
//		if (loginMember == null) {
//			
//			System.out.println("비회원은 댓글 수정을 할 수 없습니다!!!");
//			
//			req.setAttribute("result", 0);
//
//			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
//
//		} else {

			ReplyVO replyVO = new ReplyVO();

//			replyVO.setMemNo(loginMember.getMemNo());
			
			// 댓글 수정 테스트를 위한 더미
			replyVO.setMemNo(1);
			replyVO.setRepNo(repNo);

			// �옄�떊�씠 �옉�꽦�븳 �뙎湲��씤 寃쎌슦 �닔�젙 沅뚰븳 �엳�쓬
//			if (CheckRight.hasReplyRight(replyVO)) {
//
				String repCont = req.getParameter("repCont") == null?
						"" : (String) req.getParameter("repCont");
				replyVO.setRepCont(repCont);
//
				int result = boardService.replyUpdate(replyVO);
//
				req.setAttribute("result", result);
//
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
//
//				// �떎瑜� �궗�엺�씠 �옉�꽦�븳 �뙎湲� �닔�젙 沅뚰븳 �뾾�쓬
//			} else {
//
//				req.setAttribute("result", 0);
//
//				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
//			}
		}

//	}

	/*
	 * private static final long serialVersionUID = 1L;
	 * 
	 */
	/*
	 * public ReplyUpdate() { super(); // TODO Auto-generated constructor stub }
	 * 
	 */
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * request.setCharacterEncoding("UTF-8");
	 * 
	 * ReplyVO vo = new ReplyVO(); vo.setRepCont(request.getParameter("repCont"));
	 * vo.setRepNo(Integer.parseInt(request.getParameter("repCont")));
	 * 
	 * IBoardService service = BoardServiceImpl.getInstance();
	 * 
	 * int rnum = service.replyUpdate(vo);
	 * 
	 * request.setAttribute("replyUpdate", rnum);
	 * 
	 * request.getRequestDispatcher("/WEB-INF/jsp/BoardInsert.jsp").forward(request,
	 * response); }
	 */

}
