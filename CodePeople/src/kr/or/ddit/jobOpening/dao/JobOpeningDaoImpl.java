package kr.or.ddit.jobOpening.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cmm.vo.JobOpeningPagingVO;
import kr.or.ddit.jobOpening.vo.ApplyVO;
import kr.or.ddit.jobOpening.vo.JOCardVO;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;
import kr.or.ddit.schedule.vo.ScheduleVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class JobOpeningDaoImpl implements IJobOpeningDao{
	
	private String nameSpace = "jobOpening.";
	
	private SqlMapClient smc;
	private static IJobOpeningDao dao;
	private JobOpeningDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IJobOpeningDao getInstance() {
		if(dao == null) {
			dao = new JobOpeningDaoImpl();
		}
		return dao;
	}

	@Override
	public int getTotalJobOpeningCount() throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalJobOpeningCount");
		return cnt;
	}

	@Override
	public List<JobOpeningVO> jobOpeningPagingList(JobOpeningPagingVO jobOpeningPagingVO) throws SQLException {

		List<JobOpeningVO> list = null;
		list = (List<JobOpeningVO>)smc.queryForList(nameSpace + "jobOpeningPagingList", jobOpeningPagingVO);
		return list;
	}

	@Override
	public List<Map<String, Object>> jobOpeningCardList(JobOpeningPagingVO jobOpeningPagingVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "jobOpeningCardList", jobOpeningPagingVO);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> jobOpeningCardSearchList(HashMap jobOpeningSearchVO) throws SQLException {
		List<Map<String, Object>> list = null;
		list = (List<Map<String, Object>>)smc.queryForList(nameSpace + "jobOpeningCardSearchList", jobOpeningSearchVO);
		return list;
	}

	@Override
	public int getTotalJobOpeningSearchCount(HashMap jobOpeningSearchVO) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "getTotalJobOpeningSearchCount", jobOpeningSearchVO);
		return cnt;
	}

	@Override
	public int insertJobOpening(JobOpeningVO jobOpeningVO) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.insert(nameSpace + "insertJobOpening", jobOpeningVO);
		return cnt;
	}

	@Override
	public int insertJoSchedule(JobOpeningVO jobOpeningVO) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.insert(nameSpace + "insertJoSchedule", jobOpeningVO);
		return cnt;
	}

	@Override
	public int addJoScheTag(int scheNo) throws SQLException {
		int cnt = 0;
		Object obj = null;
		obj = smc.insert(nameSpace + "addJoScheTag", scheNo);
		cnt = obj == null? 1 : 0;
		return cnt;
	}

	@Override
	public JOCardVO joCardDetail(int joNo) throws SQLException {
		JOCardVO vo = null;
		vo = (JOCardVO)smc.queryForObject(nameSpace + "joCardDetail", joNo);
		return vo;
	}

	@Override
	public Integer getJtCodeNo(int joNo) throws SQLException {
		Integer cnt = 0;
		cnt = (Integer)smc.queryForObject(nameSpace + "getJtCodeNo", joNo);
		return cnt;
	}

	@Override
	public int applyJobOpening(ApplyVO applyVO) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.insert(nameSpace + "applyJobOpening", applyVO);
		return cnt;
	}

	@Override
	public int insertClip(ApplyVO applyVO) throws SQLException {
		int cnt = 0;
		Object obj = null;
		obj = smc.insert(nameSpace + "insertClip", applyVO);
		cnt = obj == null ? 1 : 0;
		return cnt;
	}

	@Override
	public int deleteClip(ApplyVO applyVO) throws SQLException {
		int cnt = 0;
		cnt = smc.delete(nameSpace + "deleteClip", applyVO);
		return cnt;
	}

	@Override
	public int addClip(int joNo) throws SQLException {
		int cnt = 0;
		cnt = smc.update(nameSpace + "addClip", joNo);
		return cnt;
	}

	@Override
	public int subtractClip(int joNo) throws SQLException {
		int cnt = 0;
		cnt = smc.update(nameSpace + "subtractClip", joNo);
		return cnt;
	}
	
	@Override
	public int deleteJobOpening(int joNo) throws SQLException {
		int cnt = 0;
		cnt = smc.delete(nameSpace + "deleteJobOpening", joNo);
		return cnt;
	}

	@Override
	public int checkJobOpeningRight(int joNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "checkJobOpeningRight", joNo);
		return cnt;
	}
	
	@Override
	public int updateJobOpening(JobOpeningVO jobOpeningVO) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.update(nameSpace + "updateJobOpening", jobOpeningVO);
		return cnt;
	}
	
	@Override
	public List<JOCardVO> getClipByCom(int comNo) throws SQLException {
		List<JOCardVO> clipCom = null;
		clipCom = smc.queryForList(nameSpace+"getClipByCom",comNo);
		return clipCom;
	}
	
	@Override
	public List<JOCardVO> getClipByHR(int hrNo) throws SQLException {
		List<JOCardVO> clipHR = null;
		clipHR = smc.queryForList(nameSpace+"getClipByHR",hrNo);
		return clipHR;
		}
	
	@Override
	public List<JOCardVO> getApplyByCom(int comNo) throws SQLException {
		List<JOCardVO> applyCom = null;
		applyCom = smc.queryForList(nameSpace+"getApplyByCom",comNo);
		return applyCom;
	}
	
	@Override
	public List<JOCardVO> getApplyByHR(int hrNo) throws SQLException {
		List<JOCardVO> applyHR = null;
		applyHR = smc.queryForList(nameSpace+"getApplyByHR",hrNo);
		return applyHR;
		}

	@Override
	public int insertScheJo(ScheduleVO scheduleVO) throws SQLException {
		int cnt = 0;
		Object obj = null;
		obj = smc.insert(nameSpace + "insertScheJo", scheduleVO);
		cnt = obj == null? 1 : 0;
		return cnt;
	}
	

}
