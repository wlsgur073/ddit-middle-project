package kr.or.ddit.jobTitle.service;

import java.util.List;

import kr.or.ddit.jobTitle.vo.JobTitleVO;


public interface IJobTitleService {

	public List<JobTitleVO> selectJobTitleList(int jgCodeNo);
}
