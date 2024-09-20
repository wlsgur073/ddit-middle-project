package kr.or.ddit.jobTitle.service;

import java.util.List;

import kr.or.ddit.jobTitle.dao.IJobTitleDao;
import kr.or.ddit.jobTitle.dao.JobTitleDaoImpl;
import kr.or.ddit.jobTitle.vo.JobTitleVO;

public class JobTitleServiceImpl implements IJobTitleService{

	private IJobTitleDao dao;
	private static IJobTitleService service;
	
	private JobTitleServiceImpl() {
		dao = JobTitleDaoImpl.getInstance();
	}
	public static IJobTitleService getInstance() {
		if(service == null) {
			service = new JobTitleServiceImpl();
		}
		return service;
	}	

	@Override
	public List<JobTitleVO> selectJobTitleList(int jgCodeNo) {
		List<JobTitleVO> list = null;
		try {
			list = dao.selectJobTitleList(jgCodeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
