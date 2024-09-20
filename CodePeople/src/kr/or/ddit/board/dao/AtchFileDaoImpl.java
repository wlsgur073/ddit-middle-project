package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AtchFileDaoImpl implements IAtachFileDao {
	
	private String nameSpace = "atchFile.";
	private static IAtachFileDao dao;
	private SqlMapClient smc;
	
	private AtchFileDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IAtachFileDao getInstance() {
		if(dao == null) {
			dao = new AtchFileDaoImpl();
		}
		return dao;
	}

	@Override
	public int atachFileInsert(AtchFileVO atchFileVO) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert(nameSpace + "atachFileInsert", atchFileVO);
			
			if(obj == null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int atachFileDetailInsert(AtchFileVO atchFileVO) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert(nameSpace + "atachFileDetailInsert", atchFileVO);
			
			if(obj == null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<AtchFileVO> atchFileListGet(AtchFileVO atchFileVO) {
		List<AtchFileVO> list = new ArrayList<>();
		
		try {
			list = smc.queryForList(nameSpace + "atchFileListGet", atchFileVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public AtchFileVO atchFileDetailGet(AtchFileVO atchFileVO) {
		
		AtchFileVO fileVO = null;
		
		try {
			fileVO = (AtchFileVO) smc.queryForObject(nameSpace + "atchFileDetailGet");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return fileVO;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
