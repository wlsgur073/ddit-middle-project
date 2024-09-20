package kr.or.ddit.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao{
	
	SqlMapClient smc;
	private static IMemberDao memberDao;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	public static IMemberDao getInstance() {
		if(memberDao == null) {
			memberDao = new MemberDaoImpl();
		}
		return memberDao;
	}
	
	@Override
	public String selectById(String inputId) throws SQLException {
		
		return (String) smc.queryForObject("member.selectById", inputId);
	}
	
	@Override
	public MemberVO loginMember(MemberVO vo) throws SQLException {
		
		return (MemberVO) smc.queryForObject("member.loginMember", vo);
	}
	
	@Override
	public int joinPerson(MemberVO vo) throws SQLException {
		return (Integer) smc.insert("member.joinPerson", vo);
	}
	@Override
	public int joinCompany(MemberVO vo) throws SQLException {
		return (Integer) smc.insert("member.joinCompany", vo);
	}
	@Override
	public int joinHr(int memNo) throws SQLException {
		Object obj = null;
		obj = smc.insert("member.joinHr", memNo);
		int cnt = obj == null ? 1 : 0;
		return cnt;
	}
	
	@Override
	public int updateMember(MemberVO vo) throws SQLException {
		
		return smc.update("member.updateMember", vo);
	}
	@Override
	public int deleteMember(MemberVO vo) throws SQLException {
		return smc.delete("member.deleteMember", vo);
	}
	@Override
	public int getHrNo(int memNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject("member.getHrNo", memNo);
		return cnt;
	}
	@Override
	public int getComNo(int memNo) throws SQLException {
		int cnt = 0;
		
		cnt = (int)smc.queryForObject("member.getComNo", memNo);
		
		
		return cnt;
	}
	
	@Override
	public int checkRegisterdCorp(int memNo) throws SQLException {
		int cnt = 0;
		cnt = (int)smc.queryForObject("member.checkRegisterdCorp", memNo);
		return cnt;
	}
	@Override
	public String searchId(MemberVO vo) throws SQLException {
		
		return (String) smc.queryForObject("member.searchId", vo);
	}
	@Override
	public int searchPass(MemberVO vo) throws SQLException {
		return (int) smc.queryForObject("member.searchPass", vo);
	}
	@Override
	public int setPassword(MemberVO vo) throws SQLException {
		
		return smc.update("member.setPassword", vo);
	}
	
}
