package kr.or.ddit.company.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cmm.vo.CompanyPagingVO;
import kr.or.ddit.company.vo.ComFavVO;
import kr.or.ddit.company.vo.CompanyVO;

public interface ICompanyService {
	
	public int getTotalCompanyCount();
	
	public List<CompanyVO> companyPagingList(CompanyPagingVO companyPagingVO);

	public int companyInsert(CompanyVO companyVO);

	public List<Map<String, Object>> companyDetailList(int comNo);
	
	public List<Map<String, Object>> companyJOList(int comNo);
	
	public int companyJOCount(int comNo);
	
	public int companyReviewCount(int comNo);
	
	public List<Map<String, Object>> companyReview(int comNo);
	
	public int addFavCompany(ComFavVO comFavVO);

	public int deleteFavCompany(ComFavVO comFavVO);
	
	public CompanyVO getCompany(int comNo);
	
	public int updateCompany(CompanyVO companyVO);

	public int deleteCompany(int comNo);
	
	public int companyCount(int memNo);
	
	public int checkFavCompany(ComFavVO comFavVO);
	
	public List<CompanyVO> getFolCompany(int hrNo);

	public List<CompanyVO> getFavCompany(int hrNo);
}
