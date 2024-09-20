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
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/BoardInsert.do")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		BoardVO vo = new BoardVO();
		
		HttpSession session = request.getSession();
		MemberVO mv = session.getAttribute("memVO") == null?
				null : (MemberVO)session.getAttribute("memVO");
		
		if(mv != null) {
			
			Integer memNo = mv.getMemNo();
			
			try {
				BeanUtils.populate(vo, request.getParameterMap());
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			
			Integer boardCodeNo = vo.getBoardCodeNo();
			
			      if(boardCodeNo == 1) {
				vo.setBoardCodeNo(2);
			}else if(boardCodeNo == 2) {
				vo.setBoardCodeNo(3);
			}else if(boardCodeNo == 3) {
				vo.setBoardCodeNo(5);
			}else if(boardCodeNo == 4) {
				vo.setBoardCodeNo(4);
			}else if(boardCodeNo == 5) {
				vo.setBoardCodeNo(1);
			}
			
			System.out.println(vo);
			
			vo.setMemNo(memNo);
			
			IBoardService service = BoardServiceImpl.getInstance();
			
			
			int num =service.boardInsert(vo);
			
			
			request.setAttribute("boardinsert", num);
			
			request.getRequestDispatcher("/WEB-INF/jsp/BoardInsert.jsp").forward(request, response);
			
		}
		
		
	}

}






