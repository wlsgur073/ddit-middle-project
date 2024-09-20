package kr.or.ddit.company.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cmm.vo.CompanyPagingVO;
import kr.or.ddit.company.vo.ComFavVO;
import kr.or.ddit.company.vo.CompanyVO;

public interface ICompanyDao {
	
	public int getTotalCompanyCount() throws SQLException;
	
	public List<CompanyVO> companyPagingList(CompanyPagingVO companyPagingVO) throws SQLException;

	public int companyInsert(CompanyVO companyVO) throws SQLException;

	public List<Map<String, Object>> companyDetailList(int comNo) throws SQLException;
	
	public List<Map<String, Object>> companyJOList(int comNo) throws SQLException;
	
	public int companyJOCount(int comNo) throws SQLException;
	
	public int companyReviewCount(int comNo) throws SQLException;
	
	public List<Map<String, Object>> companayReview(int comNo) throws SQLException;
	
	public int addFavCompany(ComFavVO comFavVO) throws SQLException;

	public int deleteFavCompany(ComFavVO comFavVO) throws SQLException;

	public CompanyVO getCompany(int comNo) throws SQLException;
	
	public int updateCompany(CompanyVO companyVO) throws SQLException;
	
	public int deleteCompany(int comNo) throws SQLException;
	
	public int companyCount(int memNo) throws SQLException;
	
	public int checkFavCompany(ComFavVO comFavVO) throws SQLException;
	
	public List<CompanyVO> getFolCompany(int hrNo) throws SQLException;

	public List<CompanyVO> getFavCompany(int hrNo) throws SQLException;


}
