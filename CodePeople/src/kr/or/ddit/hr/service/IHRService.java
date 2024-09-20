package kr.or.ddit.hr.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRCrrVO;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.hr.vo.HRSearchVO;
import kr.or.ddit.hr.vo.HRVO;

public interface IHRService {
	

	public int getTotalHRCount();
	
	public List<HRVO> hrPagingList(HRPagingVO hrPagingVO);

	public List<HRCardVO> hrCardPagingList(HRPagingVO hrPagingVO); 
	
	public List<HRCardVO> hrCardPagingSearchList(HRSearchVO hrSearchVO);
	
	public int getTotalCardSearchCount(HRSearchVO hrSearchVO);
	
	public int addFavHr(HRFavVO hrFavVO);

	public int deleteFavHr(HRFavVO hrFavVO);

	public int updateJobInfo(HRInfoVO hrInfoVO);
	
	
	
	public int insertCrr(HRInfoVO hrInfoVO);

	public int updateCrr (HRInfoVO hrInfoVO);
	
	public List<HRCrrVO> selectCrr(int hrNo);
	

	public int hrCntUp (int hrNo);
	
	public int getHrNo(int memNo);
	
	public HRMyInfoVO selectMyInfo(int memNo);
	
	public List<HRMyInfoVO> selectApplyHRByJo(int joNo);
	
	public int deleteCrr (HRInfoVO hrInfoVO);

	public int checkFavHr(HRFavVO hrFavVO);
	
	public int getMemNo(int hrNo);
	
	public int checkNew(int memNo);
	
	public List<HRCardVO> getFolHR (int comNo);
	
	public List<HRCardVO> getFavHR (int comNo);
}