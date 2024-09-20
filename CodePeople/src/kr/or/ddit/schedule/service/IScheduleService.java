package kr.or.ddit.schedule.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.schedule.vo.ScheduleVO;


public interface IScheduleService {

	public List<ScheduleVO> joScheduleList();
	public List<ScheduleVO> getClipCal(HRVO hrVO);
	public List<ScheduleVO> getFavCal(HRVO hrVO);
	public List<ScheduleVO> getMyCal(HRVO hrVO);
}
