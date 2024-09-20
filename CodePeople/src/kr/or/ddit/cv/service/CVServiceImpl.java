package kr.or.ddit.cv.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cmm.vo.CVPagingVO;
import kr.or.ddit.cv.dao.ICVDao;
import kr.or.ddit.cv.dao.CVDaoImpl;
import kr.or.ddit.cv.vo.CVVO;

public class CVServiceImpl implements ICVService{

	private ICVDao dao;
	private static ICVService service;
	
	private CVServiceImpl() {
		dao = CVDaoImpl.getInstance();
	}
	public static ICVService getInstance() {
		if(service == null) {
			service = new CVServiceImpl();
		}
		return service;
	}
	@Override
	public int getTotalCVCount() {
		int cnt = 0;
		try {
			cnt = dao.getTotalCVCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<CVVO> cvPagingList(CVPagingVO cvPagingVO) {
		List<CVVO> list = null;
		try {
			list = dao.cvPagingList(cvPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	

	@Override
	public List<CVVO> selectCV(int hrNo) {
		List<CVVO> CVList = null;
		try {
			CVList = dao.selectCV(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return CVList;
	}
	
}
