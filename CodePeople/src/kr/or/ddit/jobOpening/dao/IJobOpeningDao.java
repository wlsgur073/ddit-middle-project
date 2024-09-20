package kr.or.ddit.jobOpening.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cmm.vo.JobOpeningPagingVO;
import kr.or.ddit.jobOpening.vo.ApplyVO;
import kr.or.ddit.jobOpening.vo.JOCardVO;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;
import kr.or.ddit.schedule.vo.ScheduleVO;

public interface IJobOpeningDao {

	
	public int getTotalJobOpeningCount() throws SQLException;
	
	public List<JobOpeningVO> jobOpeningPagingList(JobOpeningPagingVO jobOpeningPagingVO) throws SQLException;
	
	public List<Map<String, Object>> jobOpeningCardList(JobOpeningPagingVO jobOpeningPagingVO) throws SQLException;
	
	public List<Map<String, Object>> jobOpeningCardSearchList(HashMap jobOpeningSearchVO) throws SQLException;
	
	public int getTotalJobOpeningSearchCount(HashMap jobOpeningSearchVO) throws SQLException;
	
	// 채용공고를 등록한다, return은 등록한 채용공고 번호
	public int insertJobOpening(JobOpeningVO jobOpeningVO) throws SQLException;
	
	// 일정에 채용공고를 추가한다, return은 등록한 일정번호
	public int insertJoSchedule(JobOpeningVO jobOpeningVO) throws SQLException;
	
	// 채용공고를 관리하는 일정에 채용공고를 추가한다, return은 성공여부, 성공시 1, 실패시 0
	public int insertScheJo(ScheduleVO scheduleVO) throws SQLException;
	
	// 추가한 일정에 태그를 추가한다, return은 등록한 일정번호
	public int addJoScheTag(int scheNo) throws SQLException;
	
	// 채용공고 상세 정보를 반환하는 메서드
	public JOCardVO joCardDetail(int joNo) throws SQLException;
	
	public Integer getJtCodeNo(int joNo) throws SQLException;
	
	public int applyJobOpening(ApplyVO applyVO) throws SQLException;
	
	public int insertClip(ApplyVO applyVO) throws SQLException;
	
	public int deleteClip(ApplyVO applyVO) throws SQLException;
	
	public int addClip(int joNo) throws SQLException;
	
	public int subtractClip(int joNo) throws SQLException;
	
	public int deleteJobOpening(int joNo) throws SQLException;
	
	public int checkJobOpeningRight(int joNo) throws SQLException;
	
	public int updateJobOpening(JobOpeningVO jobOpeningVO) throws SQLException;
	
	public List<JOCardVO> getClipByHR (int hrNo) throws SQLException;
	
	public List<JOCardVO> getClipByCom (int comNo) throws SQLException;
	
	public List<JOCardVO> getApplyByHR (int hrNo) throws SQLException;
	
	public List<JOCardVO> getApplyByCom (int comNo) throws SQLException;
	
	
}
