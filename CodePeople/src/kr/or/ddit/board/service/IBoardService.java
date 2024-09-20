package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.cmm.vo.BoardPagingVO;

public interface IBoardService {
	
	public int getTotalBoardCount();
	
	public List<BoardVO> boardPagingList(BoardPagingVO boardPagingVO);
	
	//게시글 리스트
	public List<Map<String, Object>> selectAll();
	
	//게시글 등록
	public int boardInsert(BoardVO vo);
	
	//게시글 수정
	public int boardUpdate(BoardVO vo);
	
	//게시글 삭제
	public int boardDelete(BoardVO vo);
	
	//댓글 리스트
	public List<Map<String, Object>> replySelect();
	
	//댓글 등록
	public int replyInsert(ReplyVO vo);
	
	//댓글 수정
	public int replyUpdate(ReplyVO vo);
	
	//댓글 삭제
	public int replyDelete(int repNo);
	
	//대댓글 리스트 
	public List<Map<String, Object>> replyCommentSelect();
	
	public List<Map<String, Object>> QuestionBoardPagingList(BoardPagingVO boardPagingVO);
	
	public int countQuestionBoard();
	public List<Map<String, Object>> LifeBoardPagingList(BoardPagingVO boardPagingVO);
	
	public int countLifeBoard();
	public List<Map<String, Object>> blahBoardPagingList(BoardPagingVO boardPagingVO);
	
	public int countBlahBoard();
	public List<Map<String, Object>> MeetUpBoardPagingList(BoardPagingVO boardPagingVO);
	
	public int countMeetUpBoard();
	public List<Map<String, Object>> CareerBoardPagingList(BoardPagingVO boardPagingVO);
	
	public int countCareerBoard();	
	
	public int checkBoardRight(BoardVO vo);
	
	public int checkReplyRight(ReplyVO vo);
	
	public int addBoardHit(BoardVO vo);
	
	public int addBoardRept(BoardVO vo);
	
	public int addBoardLike(BoardVO vo);
	
	public int addReplyRept(int repNo);
	
	public int addReplyLike(int repNo);
	
	
}
