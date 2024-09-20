package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		BoardVO vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		Integer boardCodeNo = vo.getBoardCodeNo();
		
		if (boardCodeNo == 1) {
			vo.setBoardCodeNo(2);
		} else if (boardCodeNo == 2) {
			vo.setBoardCodeNo(3);
		} else if (boardCodeNo == 3) {
			vo.setBoardCodeNo(5);
		} else if (boardCodeNo == 4) {
			vo.setBoardCodeNo(4);
		} else if (boardCodeNo == 5) {
			vo.setBoardCodeNo(1);
		}
		 System.out.println(vo.getBoardCodeNo());
		
		System.out.println(vo.getBoardNo()); 
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		int cnt = service.boardUpdate(vo);
		System.out.println("������ vo ���� cnt�� ���� ��" + cnt);
		
		request.setAttribute("boardinsert", cnt);
		
		System.out.println("update ������ cnt��" + cnt);
		
		request.getRequestDispatcher("/WEB-INF/jsp/BoardInsert.jsp").forward(request, response);
		
		
		
	}

}
