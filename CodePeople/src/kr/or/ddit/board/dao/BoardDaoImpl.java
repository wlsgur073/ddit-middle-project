package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.cmm.vo.BoardPagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class BoardDaoImpl implements IBoardDao{
	
	private String nameSpace = "board.";
	private SqlMapClient smc;
	private static IBoardDao dao;
	private BoardDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IBoardDao getInstance() {
		if(dao == null) {
			dao = new BoardDaoImpl();
		}
		return dao;
	}

	@Override
	public int getTotalBoardCount() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalBoardCount");  
	    return cnt;
	}

	@Override
	public List<BoardVO> boardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<BoardVO> list = null;
		list = (List<BoardVO>)smc.queryForList(nameSpace + "boardPagingList", boardPagingVO);
		return list;
	}

	@Override
	public List<Map<String, Object>> selectAll() throws SQLException {
		
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "selectAll");
		
		return list;
	}

	@Override
	public int boardInsert(BoardVO vo) throws SQLException {
		return (Integer)smc.insert(nameSpace + "boardInsert", vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) throws SQLException {
			int cnt = 0;
			
			cnt = smc.update(nameSpace + "boardUpdate", vo);
			
		return cnt;
	}

	@Override
	public int boardDelete(BoardVO vo) throws SQLException {
		
		int cnt = 0;
		cnt = smc.delete(nameSpace + "boardDelete", vo);
		
		return cnt;
	}
	
	@Override
	public List<Map<String, Object>> replySelect() throws SQLException {
		
		List<Map<String, Object>> list = null;
		list = smc.queryForList(nameSpace + "replySelect");
		
		return list;
	}	
	
	
	
	@Override
	public List<Map<String, Object>> QuestionBoardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "QuestionBoardPagingList", boardPagingVO);
		return list;
	}

	@Override
	public int countQuestionBoard() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "countQuestionBoard");  
	    return cnt;
	}
	@Override
	public List<Map<String, Object>> LifeBoardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "LifeBoardPagingList", boardPagingVO);
		return list;
	}
	
	@Override
	public int countLifeBoard() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "countLifeBoard");  
		return cnt;
	}
	@Override
	public List<Map<String, Object>> blahBoardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "blahBoardPagingList", boardPagingVO);
		return list;
	}
	
	@Override
	public int countBlahBoard() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "countBlahBoard");  
		return cnt;
	}
	@Override
	public List<Map<String, Object>> MeetUpBoardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "MeetUpBoardPagingList", boardPagingVO);
		return list;
	}
	
	@Override
	public int countMeetUpBoard() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "countMeetUpBoard");  
		return cnt;
	}
	@Override
	public List<Map<String, Object>> CareerBoardPagingList(BoardPagingVO boardPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "CareerBoardPagingList", boardPagingVO);
		return list;
	}
	
	@Override
	public int countCareerBoard() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "countCareerBoard");  
		return cnt;
	}

	@Override
	public int replyInsert(ReplyVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.insert(nameSpace + "replyInsert", vo);  
		return cnt;
	}

	@Override
	public int replyUpdate(ReplyVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "replyUpdate", vo);
		
		return cnt;
	}
	
		@Override
	public int checkBoardRight(BoardVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "checkBoardRight", vo);  
		return cnt;
	}

	@Override
	public int checkReplyRight(ReplyVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "checkReplyRight", vo);  
		return cnt;
	}

	@Override
	public int replyDelete(int repNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.delete(nameSpace + "replyDelete", repNo);  
		return cnt;
	}

	@Override
	public int addBoardHit(BoardVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "addBoardHit", vo);  
		return cnt;
	}

	@Override
	public int addBoardRept(BoardVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "addBoardRept", vo);  
		return cnt;
	}

	@Override
	public int addBoardLike(BoardVO vo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "addBoardLike", vo);  
		return cnt;
	}

	@Override
	public int addReplyRept(int repNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "addReplyRept", repNo);  
		return cnt;
	}

	@Override
	public int addReplyLike(int repNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "addReplyLike", repNo);  
		return cnt;
	}

	@Override
	public List<Map<String, Object>> replyCommentSelect() throws SQLException {
		List<Map<String, Object>> list = null;
		
		list = smc.queryForList(nameSpace + "replyCommentSelect");
		
		return list;
	}
	

}






