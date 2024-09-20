package kr.or.ddit.progLang.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.progLang.vo.PLHRVO;
import kr.or.ddit.progLang.vo.ProgLangVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ProgLangDaoImpl implements IProgLangDao{
	
	private String nameSpace = "progLang.";
	
	private SqlMapClient smc;
	private static IProgLangDao dao;
	private ProgLangDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IProgLangDao getInstance() {
		if(dao == null) {
			dao = new ProgLangDaoImpl();
		}
		return dao;
	}


	@Override
	public List<ProgLangVO> selectProgLangList() throws SQLException {
		List<ProgLangVO> list = null;
		list = (List<ProgLangVO>) smc.queryForList(nameSpace + "selectProgLangList");
		return list;
	}

	@Override
	public int insertPl(HRInfoVO hrInfoVO) throws SQLException {
		int cnt =0;
		cnt = smc.update(nameSpace+"insertPl",hrInfoVO);
		return cnt;
	}
	
	@Override
	public List<ProgLangVO> selectPl(int hrNo) throws SQLException {
		List<ProgLangVO> plList = null;
		plList = (List<ProgLangVO>)smc.queryForList(nameSpace+"selectPl",hrNo);
		return plList;
	}
	
	@Override
	public int deletePl(PLHRVO plhrvo) throws SQLException {
	int cnt = 0;
	cnt = smc.delete(nameSpace+"deletePl", plhrvo);
		return cnt;
	}
}
