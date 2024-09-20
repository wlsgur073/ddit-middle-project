package kr.or.ddit.member.dao;

import java.sql.SQLException;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {
	
	// �븘�씠�뵒 以묐났 寃��궗
	public String selectById(String inputId) throws SQLException;
	
	// 濡쒓렇�씤 
	public MemberVO loginMember(MemberVO vo) throws SQLException;
	
	// �쉶�썝媛��엯 (媛쒖씤/�쉶�궗)
	public int joinPerson(MemberVO vo) throws SQLException;
	public int joinCompany(MemberVO vo) throws SQLException;
	public int joinHr(int memNo) throws SQLException;
	
	// �쉶�썝�젙蹂� �닔�젙
	public int updateMember(MemberVO vo) throws SQLException;
	
	// �쉶�썝�젙蹂� �궘�젣
	public int deleteMember(MemberVO vo) throws SQLException;
	
	// �씤�옱踰덊샇 議고쉶
	public int getHrNo(int memNo) throws SQLException;
	
	public int getComNo(int memNo) throws SQLException;
	
	public int checkRegisterdCorp(int memNo) throws SQLException;
	
	public String searchId(MemberVO vo) throws SQLException;
	public int searchPass(MemberVO vo) throws SQLException;
	public int setPassword(MemberVO vo) throws SQLException;
}
