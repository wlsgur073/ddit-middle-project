package kr.or.ddit.schedule.service;

import java.util.List;

import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.schedule.dao.IScheduleDao;
import kr.or.ddit.schedule.dao.ScheduleDaoImpl;
import kr.or.ddit.schedule.vo.ScheduleVO;

public class ScheduleServiceImpl implements IScheduleService{

	private IScheduleDao dao;
	private static IScheduleService service;
	
	private ScheduleServiceImpl() {
		dao = ScheduleDaoImpl.getInstance();
	}
	public static IScheduleService getInstance() {
		if(service == null) {
			service = new ScheduleServiceImpl();
		}
		return service;
	}
	@Override
	public List<ScheduleVO> joScheduleList() {
		List<ScheduleVO> list = null;
		try {
			list = dao.joScheduleList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ScheduleVO> getClipCal(HRVO hrVO) {
		List<ScheduleVO> list = null;
		try {
			list = dao.getClipCal(hrVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ScheduleVO> getFavCal(HRVO hrVO) {
		List<ScheduleVO> list = null;
		try {
			list = dao.getFavCal(hrVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ScheduleVO> getMyCal(HRVO hrVO) {
		List<ScheduleVO> list = null;
		try {
			list = dao.getMyCal(hrVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	

}
