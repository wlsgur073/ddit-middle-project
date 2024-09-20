package kr.or.ddit.cv.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cmm.vo.CVPagingVO;
import kr.or.ddit.cv.vo.CVVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CVDaoImpl implements ICVDao{
	
	private String nameSpace = "cv.";
	
	private SqlMapClient smc;
	private static ICVDao dao;
	private CVDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ICVDao getInstance() {
		if(dao == null) {
			dao = new CVDaoImpl();
		}
		return dao;
	}

	@Override
	public int getTotalCVCount() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalCVCount");
		return cnt;
	}

	@Override
	public List<CVVO> cvPagingList(CVPagingVO cvPagingVO) throws SQLException {

		List<CVVO> list = null;
		list = (List<CVVO>)smc.queryForList(nameSpace + "cvPagingList", cvPagingVO);
		return list;
	}

	@Override
	public List<CVVO> selectCV(int hrNo) throws SQLException {
		List<CVVO> CVList = null;
		CVList = (List<CVVO>)smc.queryForList(nameSpace+"selectCV",hrNo);
		return CVList;
	}

}
