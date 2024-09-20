package kr.or.ddit.edu.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.edu.vo.EduVO;
import kr.or.ddit.hr.vo.HRInfoVO;

public interface IEduDao {
	public List<EduVO> selectEduCodeList() throws SQLException;
	
	
	
	public int insertEdu(HRInfoVO hrInfoVO) throws SQLException;

	public int updateEdu (HRInfoVO hrInfoVO) throws SQLException;
	
	public int insertEduHR(HRInfoVO hrInfoVO) throws SQLException;
	
	public List<EduVO> selectEdu(int hrNo) throws SQLException;
	
	public int deleteEdu(HRInfoVO hrInfoVO)  throws SQLException;
	
	public int deleteEduHR(HRInfoVO hrInfoVO) throws SQLException;
	
	
}
