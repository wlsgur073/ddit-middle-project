package kr.or.ddit.jobTitle.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.jobTitle.vo.JobTitleVO;


public interface IJobTitleDao {
	public List<JobTitleVO> selectJobTitleList(int jgCodeNo) throws SQLException;
}
