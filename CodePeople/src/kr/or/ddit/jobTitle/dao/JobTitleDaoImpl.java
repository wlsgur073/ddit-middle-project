package kr.or.ddit.jobTitle.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class JobTitleDaoImpl implements IJobTitleDao{
	
	private String nameSpace = "jobTitle.";
	
	private SqlMapClient smc;
	private static IJobTitleDao dao;
	private JobTitleDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IJobTitleDao getInstance() {
		if(dao == null) {
			dao = new JobTitleDaoImpl();
		}
		return dao;
	}


	@Override
	public List<JobTitleVO> selectJobTitleList(int jgCodeNo) throws SQLException {
		List<JobTitleVO> list = null;
		list = (List<JobTitleVO>) smc.queryForList("jobTitle.selectJobTitleList", jgCodeNo);
		return list;
	}


}
