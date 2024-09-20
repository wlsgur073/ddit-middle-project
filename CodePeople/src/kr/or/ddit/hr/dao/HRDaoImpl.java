package kr.or.ddit.hr.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRCrrVO;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.hr.vo.HRSearchVO;
import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class HRDaoImpl implements IHRDao{
	
	private String nameSpace = "hr.";
	
	private SqlMapClient smc;
	private static IHRDao dao;
	private HRDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IHRDao getInstance() {
		if(dao == null) {
			dao = new HRDaoImpl();
		}
		return dao;
	}

	@Override
	public int getHrNo(int memNo) throws SQLException {
		int hrNo = 0;
		hrNo = (int)smc.queryForObject(nameSpace + "getHrNo",memNo);
		return hrNo;
	
	
	}
	
	
	@Override
	public int getTotalHRCount() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalHRCount");
		return cnt;
	}

	@Override
	public List<HRVO> hrPagingList(HRPagingVO hrPagingVO) throws SQLException {

		List<HRVO> list = null;
		list = (List<HRVO>)smc.queryForList(nameSpace + "hrPagingList", hrPagingVO);
		return list;
	}
	

	@Override
	public List<HRCardVO> hrCardPagingList(HRPagingVO hrPagingVO) throws SQLException {
		List<HRCardVO> list = null;
		list = (List<HRCardVO>)smc.queryForList(nameSpace + "hrCardPagingList", hrPagingVO);
		return list;
	}

	
	@Override
	public List<HRCardVO> hrCardPagingSearchList(HRSearchVO hrSearchVO) throws SQLException {
		List<HRCardVO> list = null;
		list = (List<HRCardVO>)smc.queryForList(nameSpace + "hrCardPagingSearchList", hrSearchVO);
		return list;
	}
	
	   @Override
	public int getTotalCardSearchCount(HRSearchVO hrSearchVO) throws SQLException {
		int cnt = 0;
		cnt = (int) smc.queryForObject(nameSpace +"getTotalCardSearchCount",hrSearchVO);
		return cnt;
	}
	   
	   
	   @Override
	public int addFavHr(HRFavVO hrFavVO) throws SQLException {
		int cnt = 0;
		cnt = (int) smc.update(nameSpace+"addFavHr", hrFavVO);
		   return cnt;
	}
	   
	   
	   @Override
	public int deleteFavHr(HRFavVO hrFavVO) throws SQLException {
		   int cnt = 0;
		   cnt = (int)smc.delete(nameSpace+"deleteFavHr", hrFavVO);
	 return cnt;
	}

	   
	   
	    @Override
	    public int updateJobInfo(HRInfoVO hrInfoVO) throws SQLException {
	    	int cnt = 0;
	    	cnt = (int)smc.update(nameSpace+"updateJobInfo",hrInfoVO);
	    	return cnt;
	    }
	    
		@Override
		public int insertCrr(HRInfoVO hrInfoVO) throws SQLException {
			int crrNo = 0;
			crrNo = (int)smc.insert(nameSpace+"insertCrr",hrInfoVO);
	    	return crrNo;
		}
		
		//
		@Override
		public int insertCrrHR(HRInfoVO hrInfoVO) throws SQLException {
			int cnt = 0;
			Object obj = null;
			cnt = (int)smc.update(nameSpace+"insertCrrHR",hrInfoVO);
			
			cnt = obj == null ? 1 : 0;
			return cnt;
		}
	    
	    @Override
	    public int updateCrr(HRInfoVO hrInfoVO) throws SQLException {
	    	int cnt = 0;
	    	cnt = (int)smc.update(nameSpace+"updateCrr",hrInfoVO);
	    	return cnt;
	    }
	    
	    @Override
	    public List<HRCrrVO> selectCrr(int hrNo) throws SQLException {
	    	List<HRCrrVO> crrList = null;
	    	crrList = smc.queryForList(nameSpace+"selectCrr",hrNo);
	    	return crrList;
	    }
	    
	    
	    @Override
	    public int hrCntUp(int hrNo) throws SQLException {
	    	int cnt=0;
	    	cnt = smc.update(nameSpace+"hrCntUp",hrNo);
	    	return cnt;
	    }
	    
	    
	    @Override
	    public HRMyInfoVO selectMyInfo(int memNo) throws SQLException {
	    
	    	HRMyInfoVO myInfoVO = null;
	    	myInfoVO = (HRMyInfoVO)smc.queryForObject(nameSpace+"selectMyInfo",memNo);
	    	return myInfoVO;
	    }
	    
	    @Override
	    public int deleteCrr(HRInfoVO hrInfoVO) throws SQLException {
	    	int cnt = 0;
	    	cnt = smc.delete(nameSpace+"deleteCrr", hrInfoVO);
	    	
	    	return cnt;
	    }
	    
	    @Override
	    public int deleteCrrHR(HRInfoVO hrInfoVO) throws SQLException {
	    
	    	int cnt = 0;
	    	
	    	cnt = smc.delete(nameSpace+"deleteCrrHR", hrInfoVO);
	    	return cnt;
	    }
	    
	    @Override
	    public int getMemNo(int hrNo) throws SQLException {
	    
	    	int memNo = 0;
	    	memNo = (int) smc.queryForObject(nameSpace+"getMemNo", hrNo);
	    	return memNo;
	    }
	    
	    @Override
	    public int checkFavHr(HRFavVO hrFavVO) throws SQLException {
	    	int cnt = 0;
	    	cnt = (int) smc.queryForObject(nameSpace+"checkFavHr", hrFavVO);
	    	return cnt;
	    }
	    
	    @Override
	    public int checkNew(int memNo) throws SQLException {
	    	int cnt = 0;
	    	cnt = (int) smc.queryForObject(nameSpace+"checkNew",memNo);
	    	return cnt;
	    }
	    
	    @Override
	    public List<HRCardVO> getFolHR(int comNo) throws SQLException {
	    	List<HRCardVO> folHRList = null;
	    	folHRList = smc.queryForList(nameSpace+"getFolHR", comNo);
	    
	    	return folHRList;
	    }
	    
	    
	    @Override
	    public List<HRCardVO> getFavHR(int comNo) throws SQLException {
	    	List<HRCardVO> favHRList = null;
	    	favHRList = smc.queryForList(nameSpace+"getFavHR", comNo);
	    
	    	return favHRList;
	    }
	    
	    @Override
	    public List<HRMyInfoVO> selectApplyHRByJo(int joNo) throws SQLException {
	    	List<HRMyInfoVO> list = null;
	    	list = smc.queryForList(nameSpace+"selectApplyHRByJo",joNo);
	    	return list;
	    }
	    
	    
}
