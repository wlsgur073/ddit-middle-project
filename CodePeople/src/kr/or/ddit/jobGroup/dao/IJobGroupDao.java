package kr.or.ddit.jobGroup.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.jobGroup.vo.JobGroupVO;

public interface IJobGroupDao {
	public List<JobGroupVO> selectJobGroupList() throws SQLException;
}
