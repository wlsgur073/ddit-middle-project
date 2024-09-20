package kr.or.ddit.edu.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.edu.vo.EduVO;
import kr.or.ddit.hr.vo.HRInfoVO;

public interface IEduService {

	public List<EduVO> selectEduCodeList();
	
	
	public int insertEdu(HRInfoVO hrInfoVO);

	public int updateEdu (HRInfoVO hrInfoVO);
	
	public List<EduVO> selectEdu(int hrNo);
	
	public int deleteEdu (HRInfoVO hrInfoVO);
}
