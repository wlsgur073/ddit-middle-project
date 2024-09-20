package kr.or.ddit.jobGroup.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.jobGroup.vo.JobGroupVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class JobGroupDaoImpl implements IJobGroupDao{
	
	private String nameSpace = "jobGroup.";
	
	private SqlMapClient smc;
	private static IJobGroupDao dao;
	private JobGroupDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IJobGroupDao getInstance() {
		if(dao == null) {
			dao = new JobGroupDaoImpl();
		}
		return dao;
	}


	@Override
	public List<JobGroupVO> selectJobGroupList() throws SQLException {
		List<JobGroupVO> list = null;
		list = (List<JobGroupVO>) smc.queryForList(nameSpace + "selectJobGroupList");
		return list;
	}


}
