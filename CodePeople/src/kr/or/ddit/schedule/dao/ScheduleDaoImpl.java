package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.schedule.vo.ScheduleVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ScheduleDaoImpl implements IScheduleDao{
	
	private String nameSpace = "schedule.";
	private SqlMapClient smc;
	private static IScheduleDao dao;
	private ScheduleDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IScheduleDao getInstance() {
		if(dao == null) {
			dao = new ScheduleDaoImpl();
		}
		return dao;
	}

	@Override
	public List<ScheduleVO> joScheduleList() throws SQLException {
		List<ScheduleVO> list = null;
		list = (List<ScheduleVO>)smc.queryForList(nameSpace + "joScheduleList");
		return list;
	}

	@Override
	public List<ScheduleVO> getClipCal(HRVO hrVO) throws SQLException {
		List<ScheduleVO> list = null;
		list = (List<ScheduleVO>)smc.queryForList(nameSpace + "getClipCal", hrVO);
		return list;
	}

	@Override
	public List<ScheduleVO> getFavCal(HRVO hrVO) throws SQLException {
		List<ScheduleVO> list = null;
		list = (List<ScheduleVO>)smc.queryForList(nameSpace + "getFavCal", hrVO);
		return list;
	}

	@Override
	public List<ScheduleVO> getMyCal(HRVO hrVO) throws SQLException {
		List<ScheduleVO> list = null;
		list = (List<ScheduleVO>)smc.queryForList(nameSpace + "getMyCal", hrVO);
		return list;
	}


}
