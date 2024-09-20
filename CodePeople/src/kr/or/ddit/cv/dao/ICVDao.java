package kr.or.ddit.cv.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cmm.vo.CVPagingVO;
import kr.or.ddit.cv.vo.CVVO;

public interface ICVDao {

	
	public int getTotalCVCount() throws SQLException;
	
	public List<CVVO> cvPagingList(CVPagingVO cvPagingVO) throws SQLException;
	
	public List<CVVO> selectCV(int hrNo) throws SQLException;

}
