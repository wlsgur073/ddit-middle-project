package kr.or.ddit.schedule.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.schedule.vo.ScheduleVO;


public interface IScheduleDao {
	
	public List<ScheduleVO> joScheduleList() throws SQLException;
	public List<ScheduleVO> getClipCal(HRVO hrVO) throws SQLException;
	public List<ScheduleVO> getFavCal(HRVO hrVO) throws SQLException;
	public List<ScheduleVO> getMyCal(HRVO hrVO) throws SQLException;
}
