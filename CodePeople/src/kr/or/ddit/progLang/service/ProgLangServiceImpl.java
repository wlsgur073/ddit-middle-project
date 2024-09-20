package kr.or.ddit.progLang.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.progLang.dao.IProgLangDao;
import kr.or.ddit.progLang.dao.ProgLangDaoImpl;
import kr.or.ddit.progLang.vo.PLHRVO;
import kr.or.ddit.progLang.vo.ProgLangVO;

public class ProgLangServiceImpl implements IProgLangService{

	private IProgLangDao dao;
	private static IProgLangService service;
	
	private ProgLangServiceImpl() {
		dao = ProgLangDaoImpl.getInstance();
	}
	public static IProgLangService getInstance() {
		if(service == null) {
			service = new ProgLangServiceImpl();
		}
		return service;
	}	

	@Override
	public List<ProgLangVO> selectProgLangList() {
		List<ProgLangVO> list = null;
		try {
			list = dao.selectProgLangList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int insertPl(HRInfoVO hrInfoVO) {
		int cnt = 0;
		try {
			cnt = dao.insertPl(hrInfoVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<ProgLangVO> selectPl(int hrNo) {
		List<ProgLangVO> plList =  null;
		try {
			plList = dao.selectPl(hrNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		
		return plList;
	}
	
	
	
	@Override
	public int deletePl(PLHRVO plhrvo) {
		int cnt = 0;
		try {
			cnt = dao.deletePl(plhrvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
