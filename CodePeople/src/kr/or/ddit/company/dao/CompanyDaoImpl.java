package kr.or.ddit.company.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cmm.vo.CompanyPagingVO;
import kr.or.ddit.company.vo.ComFavVO;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CompanyDaoImpl implements ICompanyDao{
	
	private String nameSpace = "company.";
	private SqlMapClient smc;
	private static ICompanyDao dao;
	private CompanyDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ICompanyDao getInstance() {
		if(dao == null) {
			dao = new CompanyDaoImpl();
		}
		return dao;
	}

	@Override
	public int getTotalCompanyCount() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalCompanyCount");
		return cnt;
	}

	@Override
	public List<CompanyVO> companyPagingList(CompanyPagingVO companyPagingVO) throws SQLException {
		List<CompanyVO> list = null;
		list = (List<CompanyVO>)smc.queryForList(nameSpace + "companyPagingList", companyPagingVO);
		return list;
	}

	@Override
	public int companyInsert(CompanyVO companyVO) throws SQLException {
		Object obj = null;
		int cnt = 0;
		
		obj = smc.insert(nameSpace + "companyInsert" , companyVO);
		if(obj == null) {
			cnt = 1;
		} else {
			cnt = 0;
		}
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> companyDetailList(int comNo) throws SQLException {
		List<Map<String, Object>> list = null;
		
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "companyDetailList", comNo);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> companyJOList(int comNo) throws SQLException {
		List<Map<String, Object>> list = null;
		
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "companyJOList", comNo);
		
		return list;
	}

	@Override
	public int companyJOCount(int comNo) throws SQLException {
		int cnt = 0;
		
		cnt = (int)smc.queryForObject(nameSpace + "companyJOCount", comNo);
		
		return cnt;
	}

	@Override
	public int companyReviewCount(int comNo) throws SQLException {
		int cnt = 0;
		
		cnt = (int)smc.queryForObject(nameSpace + "companyReviewCount", comNo);
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> companayReview(int comNo) throws SQLException {
		List<Map<String, Object>> list = null;
		
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "companyReview", comNo);
		
		return list;
	}

	@Override
	public int addFavCompany(ComFavVO comFavVO) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update(nameSpace + "addFavCompany", comFavVO);
		
		return cnt;
	}

	@Override
	public int deleteFavCompany(ComFavVO comFavVO) throws SQLException {
		int cnt = 0;
		
		cnt = (int)smc.delete(nameSpace + "deleteFavCompany", comFavVO);
		
		return cnt;
	}

	@Override
	public CompanyVO getCompany(int comNo) throws SQLException {
		CompanyVO cv = null;
		cv = (CompanyVO)smc.queryForObject(nameSpace + "getCompany", comNo);
		return cv;
	}

	@Override
	public int updateCompany(CompanyVO companyVO) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update(nameSpace + "updateCompany", companyVO);
		
		return cnt;
	}

	@Override
	public int companyCount(int memNo) throws SQLException {
		int cnt = 0;
		
		cnt = (int) smc.queryForObject(nameSpace + "companyCount", memNo); 
		
		return cnt;
	}

	@Override
	public int deleteCompany(int comNo) throws SQLException {
		int cnt = 0;
		
		cnt = (int) smc.delete(nameSpace + "deleteCompany", comNo);
		
		return cnt;
	}

	@Override
	public int checkFavCompany(ComFavVO comFavVO) throws SQLException {
		int cnt = 0;
		
		cnt = (int) smc.queryForObject(nameSpace + "checkFavCompany", comFavVO);
		
		return cnt;
	}

	@Override
	public List<CompanyVO> getFolCompany(int hrNo) throws SQLException {
		
		List<CompanyVO> folComList = null;
		folComList =  smc.queryForList(nameSpace + "getFolCompany", hrNo);
		return folComList;
	}


@Override
public List<CompanyVO> getFavCompany(int hrNo) throws SQLException {
	List<CompanyVO> favComList = null;
	favComList =  smc.queryForList(nameSpace + "getFavCompany", hrNo);
	return favComList;
}

}
