package kr.or.ddit.progLang.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.progLang.vo.PLHRVO;
import kr.or.ddit.progLang.vo.ProgLangVO;

public interface IProgLangDao {
	public List<ProgLangVO> selectProgLangList() throws SQLException;
	
	public int insertPl(HRInfoVO hrInfoVO) throws SQLException;
	
	public List<ProgLangVO> selectPl(int hrNo) throws SQLException;
	
	public int deletePl(PLHRVO plhrvo) throws SQLException;
}
