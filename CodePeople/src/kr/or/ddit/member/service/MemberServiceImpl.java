package kr.or.ddit.member.service;

import java.sql.SQLException;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{

	private IMemberDao memberDao;
	private static IMemberService memberService;
	
	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(memberService == null) {
			memberService = new MemberServiceImpl();
		}
		return memberService;
	}

	@Override
	public String selectById(String inputId) {
		String memId = "";
		
		try {
			memId = memberDao.selectById(inputId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memId;
	}

	@Override
	public MemberVO loginMember(MemberVO vo) {
		MemberVO memVO = null;
		try {
			memVO = memberDao.loginMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memVO;
	}


	@Override
	public int joinPerson(MemberVO vo) {
		int res = 0;
		int memNO = 0;
		
		Object obj = null;
		try {
			memNO = memberDao.joinPerson(vo);
			obj = memberDao.joinHr(memNO);
			
			if(obj == null) {
				res = 1;
			}else {
				res = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int joinCompany(MemberVO vo) {
		int memNO = 0;
		
		try {
			memNO = memberDao.joinCompany(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memNO;
	}

	@Override
	public int joinHr(int memNo) {
		int res = 0;
		
		try {
			res = memberDao.joinHr(memNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateMember(MemberVO vo) {
		int res = 0;
		
		try {
			res = memberDao.updateMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		int res = 0;
		
		try {
			res = memberDao.deleteMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int getHrNo(int memNo) {
		int cnt = 0;
		try {
			cnt = memberDao.getHrNo(memNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int getComNo(int memNo) {
		int cnt = 0;
		
		try {
			cnt = memberDao.getComNo(memNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int checkRegisterdCorp(int memNo) {
		int cnt = 0;
		
		try {
			cnt = memberDao.checkRegisterdCorp(memNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public String searchId(MemberVO vo) {
		String memId = "";
		
		try {
			memId = memberDao.searchId(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memId;
	}

	@Override
	public int searchPass(MemberVO vo) {
		int cnt = 0;
		
		try {
			cnt = memberDao.searchPass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int setPassword(MemberVO vo) {
		int cnt = 0;
		
		try {
			cnt = memberDao.setPassword(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
