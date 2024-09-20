package kr.or.ddit.jobGroup.service;

import java.util.List;

import kr.or.ddit.jobGroup.vo.JobGroupVO;

public interface IJobGroupService {

	public List<JobGroupVO> selectJobGroupList();
}
