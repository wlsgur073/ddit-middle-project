package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Namespace;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class boardDelete
 */
@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("boardNo"));
		
		// 실험을 위해 추가된 코드, boardCodeNo를 파라미터로 받아와야 함
		
		
		
		int boardCodeNo = request.getParameter("boardCodeNo") == null?
				3	:	Integer.parseInt(request.getParameter("boardCodeNo"));
		if (boardCodeNo == 1) {
			boardCodeNo = 2;
		} else if (boardCodeNo == 2) {
			boardCodeNo = 3;
		} else if (boardCodeNo == 3) {
			boardCodeNo = 5;
		} else if (boardCodeNo == 4) {
			boardCodeNo = 4;
		} else if (boardCodeNo == 5) {
			boardCodeNo = 1;
		}
		System.out.println("������ " + request.getParameter("boardNo"));
		System.out.println("������ " + num);
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		BoardVO vo = new BoardVO();
		
		vo.setBoardNo(num);
		
		vo.setBoardCodeNo(boardCodeNo);
		
		int cnt = service.boardDelete(vo);
		
		
		
		request.setAttribute("boardinsert", cnt);
		
		request.getRequestDispatcher("/WEB-INF/jsp/BoardInsert.jsp").forward(request, response);
	
	}

}


















