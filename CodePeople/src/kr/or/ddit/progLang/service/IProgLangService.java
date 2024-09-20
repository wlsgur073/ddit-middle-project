package kr.or.ddit.progLang.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.progLang.vo.PLHRVO;
import kr.or.ddit.progLang.vo.ProgLangVO;

public interface IProgLangService {

	public List<ProgLangVO> selectProgLangList();
	
	public int insertPl(HRInfoVO hrInfoVO) ;

	public List<ProgLangVO> selectPl(int hrNo);
	
	public int deletePl(PLHRVO plhrvo) ;


}
