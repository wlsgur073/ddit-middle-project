package kr.or.ddit.jobGroup.service;

import java.util.List;

import kr.or.ddit.jobGroup.dao.IJobGroupDao;
import kr.or.ddit.jobGroup.dao.JobGroupDaoImpl;
import kr.or.ddit.jobGroup.vo.JobGroupVO;

public class JobGroupServiceImpl implements IJobGroupService{

	private IJobGroupDao dao;
	private static IJobGroupService service;
	
	private JobGroupServiceImpl() {
		dao = JobGroupDaoImpl.getInstance();
	}
	public static IJobGroupService getInstance() {
		if(service == null) {
			service = new JobGroupServiceImpl();
		}
		return service;
	}	

	@Override
	public List<JobGroupVO> selectJobGroupList() {
		List<JobGroupVO> list = null;
		try {
			list = dao.selectJobGroupList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
