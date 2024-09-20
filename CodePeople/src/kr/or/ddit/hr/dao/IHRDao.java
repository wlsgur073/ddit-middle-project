package kr.or.ddit.hr.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.controller.HRMyInfo;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRCrrVO;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.hr.vo.HRSearchVO;
import kr.or.ddit.hr.vo.HRVO;

public interface IHRDao {

	

	public int getTotalHRCount() throws SQLException;
	
	public List<HRVO> hrPagingList(HRPagingVO hrPagingVO) throws SQLException;
	
	public List<HRCardVO> hrCardPagingList(HRPagingVO hrPagingVO) throws SQLException;
	
	public List<HRCardVO> hrCardPagingSearchList(HRSearchVO hrSearchVO) throws SQLException;
	
	public int getTotalCardSearchCount(HRSearchVO hrSearchVO) throws SQLException;
	
	public int addFavHr(HRFavVO hrFavVO) throws SQLException;

	public int deleteFavHr(HRFavVO hrFavVO) throws SQLException;
	
	public int updateJobInfo(HRInfoVO hrInfoVO) throws SQLException;

	
	
	public int insertCrr(HRInfoVO hrInfoVO) throws SQLException;

	public int updateCrr (HRInfoVO hrInfoVO) throws SQLException;
	
	public int insertCrrHR(HRInfoVO hrInfoVO) throws SQLException;
	
	public List<HRCrrVO> selectCrr(int hrNo) throws SQLException;
	
	public int hrCntUp (int hrNo) throws SQLException;
	
	public int getHrNo(int memNo) throws SQLException;
	
	public HRMyInfoVO selectMyInfo(int memNo) throws SQLException;
	
	public List<HRMyInfoVO> selectApplyHRByJo(int joNo) throws SQLException;
	
	public int deleteCrrHR (HRInfoVO hrInfoVO) throws SQLException;
	
	public int deleteCrr (HRInfoVO hrInfoVO) throws SQLException;

	public int getMemNo(int hrNo) throws SQLException;

	public int checkFavHr(HRFavVO hrFavVO) throws SQLException; 
	
	public int checkNew(int memNo) throws SQLException;
	
	
	public List<HRCardVO> getFolHR (int comNo) throws SQLException;
	
	public List<HRCardVO> getFavHR (int comNo) throws SQLException;
	
	

}
