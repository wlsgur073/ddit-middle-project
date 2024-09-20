package kr.or.ddit.jobOpening.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cmm.vo.JobOpeningPagingVO;
import kr.or.ddit.jobOpening.dao.IJobOpeningDao;
import kr.or.ddit.jobOpening.dao.JobOpeningDaoImpl;
import kr.or.ddit.jobOpening.vo.ApplyVO;
import kr.or.ddit.jobOpening.vo.JOCardVO;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;
import kr.or.ddit.schedule.vo.ScheduleVO;

public class JobOpeningServiceImpl implements IJobOpeningService{

	private IJobOpeningDao dao;
	private static IJobOpeningService service;
	
	private JobOpeningServiceImpl() {
		dao = JobOpeningDaoImpl.getInstance();
	}
	public static IJobOpeningService getInstance() {
		if(service == null) {
			service = new JobOpeningServiceImpl();
		}
		return service;
	}
	@Override
	public int getTotalJobOpeningCount() {
		int cnt = 0;
		try {
			cnt = dao.getTotalJobOpeningCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<JobOpeningVO> jobOpeningPagingList(JobOpeningPagingVO jobOpeningPagingVO) {
		List<JobOpeningVO> list = null;
		try {
			list = dao.jobOpeningPagingList(jobOpeningPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Map<String, Object>> jobOpeningCardSearchList(HashMap jobOpeningSearchVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.jobOpeningCardSearchList(jobOpeningSearchVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Map<String, Object>> jobOpeningCardList(JobOpeningPagingVO jobOpeningPagingVO) {
		List<Map<String, Object>> list = null;
		try {
			list = dao.jobOpeningCardList(jobOpeningPagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int getTotalJobOpeningSearchCount(HashMap jobOpeningSearchVO) {
		int cnt = 0;
		try {
			cnt = dao.getTotalJobOpeningSearchCount(jobOpeningSearchVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int insertJobOpening(JobOpeningVO jobOpeningVO) {
		int newJoNo = 0;
		int newScheNo = 0;
		int afterScheNo = 0;
		int cnt = 0;
		ScheduleVO scheduleVO = new ScheduleVO();
		try {
			newJoNo = dao.insertJobOpening(jobOpeningVO);
			System.out.println("테스트1 : " + newJoNo);
			newScheNo = dao.insertJoSchedule(jobOpeningVO);
			System.out.println("테스트2 : " + newScheNo);
			
			scheduleVO.setJoNo(newJoNo);
			scheduleVO.setScheNo(newScheNo);
			cnt = dao.insertScheJo(scheduleVO);
			
			System.out.println("테스트3 : " + cnt);
			
			afterScheNo = dao.addJoScheTag(newScheNo);
			System.out.println("테스트4 : " + afterScheNo);
			if(afterScheNo == 0) {
				System.out.println("에러났음");
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newJoNo;
	}
	@Override
	public JOCardVO joCardDetail(int joNo) {
		JOCardVO vo = new JOCardVO();
		try {
			vo = dao.joCardDetail(joNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}
	@Override
	public Integer getJtCodeNo(int joNo) {
		Integer cnt = 0;
		try {
			cnt = dao.getJtCodeNo(joNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int applyJobOpening(ApplyVO applyVO) {
		int cnt = 0;
		try {
			cnt = dao.applyJobOpening(applyVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int insertClip(ApplyVO applyVO) {
		int cnt = 0;
		try {
			dao.insertClip(applyVO);
			System.out.println("insertClip 수행됨");
			int joNo = applyVO.getJoNo();
			cnt = dao.addClip(joNo);
			System.out.println("addClip 수행됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int deleteClip(ApplyVO applyVO) {
		int cnt = 0;
		try {
			dao.deleteClip(applyVO);
			System.out.println("deleteClip 수행됨");
			int joNo = applyVO.getJoNo();
			cnt = dao.subtractClip(joNo);
			System.out.println("subtractClip 수행됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteJobOpening(int joNo){
		int cnt = 0;
		try {
			cnt = dao.deleteJobOpening(joNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int checkJobOpeningRight(int joNo) {
		int cnt = 0;
		try {
			cnt = dao.checkJobOpeningRight(joNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}	

	@Override
	public int updateJobOpening(JobOpeningVO jobOpeningVO) {
		int cnt = 0;
		try {
			cnt = dao.updateJobOpening(jobOpeningVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<JOCardVO> getClipByCom(int comNo) {
		List<JOCardVO> clipCom = null;
		try {
			clipCom = dao.getClipByCom(comNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clipCom;
	}
	
	@Override
	public List<JOCardVO> getClipByHR(int hrNo) {
		List<JOCardVO> clipHR = null;
		try {
			clipHR = dao.getClipByHR(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clipHR;
	}
	
	
	
	@Override
	public List<JOCardVO> getApplyByCom(int comNo) {
		List<JOCardVO> applyCom = null;
		try {
			applyCom = dao.getApplyByCom(comNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return applyCom;
	}
	
	@Override
	public List<JOCardVO> getApplyByHR(int hrNo) {
		List<JOCardVO> applyHR = null;
		try {
			applyHR = dao.getApplyByHR(hrNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return applyHR;
	}
}
