package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class ReplyInsert
 */
@WebServlet("/ReplyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		ReplyVO vo = new ReplyVO();
		
		HttpSession session = request.getSession();
		MemberVO mv = session.getAttribute("memVO") == null?
				null : (MemberVO)session.getAttribute("memVO");
		
		if(mv != null) {
			
			Integer memNo = mv.getMemNo();
			
			vo.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
			vo.setBoardCodeNo(Integer.parseInt(request.getParameter("boardCodeNo")));
			vo.setMemNo(memNo);
			vo.setRepCont((request.getParameter("repCont")));
			
		}
			
		
		
		System.out.println("府敲VO " + vo.getBoardNo());
		System.out.println("府敲VO " + vo.getRepCont());
		System.out.println("府敲VO " + vo.getBoardCodeNo());
		System.out.println("府敲VO " + vo.getMemNo());
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		int rnum = service.replyInsert(vo);
		
		request.setAttribute("boardinsert", rnum);
		
		request.getRequestDispatcher("/WEB-INF/jsp/BoardInsert.jsp").forward(request, response);
		
	
	}

}






