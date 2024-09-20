package kr.or.ddit.hr.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.dao.IHRDao;
import kr.or.ddit.hr.dao.HRDaoImpl;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRCrrVO;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.hr.vo.HRSearchVO;
import kr.or.ddit.hr.vo.HRVO;

public class HRServiceImpl implements IHRService{

	private IHRDao dao;
	private static IHRService service;
	
	private HRServiceImpl() {
		dao = HRDaoImpl.getInstance();
	}

	

	public static IHRService getInstance() {
		if(service == null) {
			service = new HRServiceImpl();
		}
		return service;
	}

	
	@Override
	public int getHrNo(int memNo) {
		int hrNo = 0;
		try {
			hrNo = dao.getHrNo(memNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hrNo;
	}
	
	
	@Override
	public int getTotalHRCount() {
		int cnt = 0;
		try {
			cnt = dao.getTotalHRCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<HRVO> hrPagingList(HRPagingVO hrPagingVO) {
		List<HRVO> list = null;
		try {
			list = dao.hrPagingList(hrPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	@Override
	public List<HRCardVO> hrCardPagingList(HRPagingVO hrPagingVO) {
		List<HRCardVO> list = null;
		try {
			list = dao.hrCardPagingList(hrPagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<HRCardVO> hrCardPagingSearchList(HRSearchVO hrSearchVO) {
		List<HRCardVO> list = null;
		try {
			list = dao.hrCardPagingSearchList(hrSearchVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int getTotalCardSearchCount(HRSearchVO hrSearchVO) {
		int cnt = 0;
		try {
			cnt = dao.getTotalCardSearchCount(hrSearchVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	@Override
	public int addFavHr(HRFavVO hrFavVO) {
		int cnt = 0;
		try {
			cnt = dao.addFavHr(hrFavVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	@Override
	public int deleteFavHr(HRFavVO hrFavVO) {
	int cnt = 0;
	try {
		cnt = dao.deleteFavHr(hrFavVO);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return cnt;
	}
	
	
	@Override
	public int updateJobInfo(HRInfoVO hrInfoVO) {
	int cnt = 0;
	try {
		cnt = dao.updateJobInfo(hrInfoVO);
	} catch (SQLException e) {
		e.printStackTrace();
	}
			return cnt;
	}
	
	
	
	
	
	@Override
	public int insertCrr(HRInfoVO hrInfoVO) {
		int cnt = 0;
		try {
			int crrNo = dao.insertCrr(hrInfoVO);
			
			hrInfoVO.setCrrNo(crrNo);
			
			System.out.println(hrInfoVO.getCrrNo());
			cnt = dao.insertCrrHR(hrInfoVO);
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public int updateCrr(HRInfoVO hrInfoVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	@Override
	public List<HRCrrVO> selectCrr(int hrNo) {
		List<HRCrrVO> crrList = null;
    	try {
			crrList = dao.selectCrr(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return crrList;
	}
	
	
	@Override
	public int hrCntUp(int hrNo) {
	
		int cnt = 0;
		try {
			cnt = dao.hrCntUp(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public HRMyInfoVO selectMyInfo(int memNo) {
		
		HRMyInfoVO myInfoVO = null;
		try {
			myInfoVO = dao.selectMyInfo(memNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return myInfoVO;
	}
	
	@Override
	public int deleteCrr(HRInfoVO hrInfoVO) {
	
		int cnt = 0;
		try {
			int flag = dao.deleteCrr(hrInfoVO);
			
			if(flag>0) {
				cnt = dao.deleteCrrHR(hrInfoVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return cnt;
	}
	
	
	@Override
	public int getMemNo(int hrNo) {
	int memNo = 0;
	try {
		memNo = dao.getMemNo(hrNo);
	} catch (SQLException e) {
		
		e.printStackTrace();
	};
		
		return memNo;
	}
	
	
	@Override
	public int checkFavHr(HRFavVO hrFavVO) {
	int cnt = 0;
	   try {
		cnt = dao.checkFavHr(hrFavVO);
	} catch (SQLException e) {

		e.printStackTrace();
	}
		return cnt;
	}
	
	@Override
	public int checkNew(int memNo) {
		int cnt = 0;
		try {
			cnt = dao.checkNew(memNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<HRCardVO> getFolHR(int comNo) {
	
		List<HRCardVO> folHRList = null;
		try {
			folHRList = dao.getFolHR(comNo);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return folHRList;
	}
	
	@Override
	public List<HRCardVO> getFavHR(int comNo) {
	
		List<HRCardVO> favHRList = null;
		try {
			favHRList = dao.getFavHR(comNo);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return favHRList;
	}
	
	
	
	@Override
	public List<HRMyInfoVO> selectApplyHRByJo(int joNo) {
		List<HRMyInfoVO> list = null;
		try {
			list = dao.selectApplyHRByJo(joNo);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}
}
