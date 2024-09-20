package kr.or.ddit.prov.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.prov.vo.CityVO;
import kr.or.ddit.prov.vo.ProvVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ProvDaoImpl implements IProvDao{
	
	private String nameSpace = "prov.";
	private SqlMapClient smc;
	private static IProvDao dao;
	private ProvDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IProvDao getInstance() {
		if(dao == null) {
			dao = new ProvDaoImpl();
		}
		return dao;
	}


	@Override
	public List<CityVO> selectCityList() throws SQLException {
		List<CityVO> list = null;
		list = (List<CityVO>) smc.queryForList(nameSpace + "selectCityList");
		return list;
	}

	@Override
	public List<ProvVO> selectProvList(int city_code_no) throws SQLException {
		List<ProvVO> list = null;
		list = (List<ProvVO>) smc.queryForList(nameSpace + "selectProvList", city_code_no);
		return list;
	}

	@Override
	public int convertToCityNo(String cityCodeNm) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "convertToCityNo", cityCodeNm);
		return cnt;
	}

	@Override
	public int convertToProvNo(HashMap<String, Object> map) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject(nameSpace + "convertToProvNo", map);
		return cnt;
	}


}
