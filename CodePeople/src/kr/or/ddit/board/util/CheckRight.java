package kr.or.ddit.board.util;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;

public class CheckRight {
	
	public static boolean hasBoardRight(BoardVO checkVO) {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		int hasRight = boardService.checkBoardRight(checkVO);
		
		return hasRight == 1;
		
	}
	
	public static boolean hasReplyRight(ReplyVO checkVO) {
		
		IBoardService boardService = BoardServiceImpl.getInstance();
		
		int hasRight = boardService.checkReplyRight(checkVO);
		
		return hasRight == 1;
	}
	
}
