package kr.or.ddit.member.service;

import java.sql.SQLException;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {

	/**
	 * �븘�씠�뵒 以묐났 �솗�씤�쓣 �쐞�븳 硫붿꽌�뱶
	 * @param inputId
	 * @return �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 爰쇰궡�삩 �븘�씠�뵒 媛�
	 */
	public String selectById(String inputId);
	
	/**
	 * 濡쒓렇�씤�쓣 �쐞�븳 硫붿꽌�뱶
	 * @param memId
	 * @param memPw
	 * @return MemberVO
	 */
	public MemberVO loginMember(MemberVO vo);
	
	/**
	 * �쉶�썝媛��엯�씠 �꽦怨듭쟻�씠硫� �뼇�닔, �떎�뙣�븯硫� 0瑜� 諛섑솚�븯�뒗 硫붿꽌�뱶
	 * @param vo
	 * @return int
	 * @throws SQLException
	 */
	public int joinPerson(MemberVO vo);
	public int joinCompany(MemberVO vo);
	public int joinHr(int memNo);

	/**
	 * �쉶�썝 �젙蹂� �닔�젙
	 * @param vo
	 * @return �꽦怨� �뼇�닔, �떎�뙣 �쓬�닔
	 */
	public int updateMember(MemberVO vo);

	public int deleteMember(MemberVO vo);
	
	// �씤�옱踰덊샇 議고쉶
	public int getHrNo(int memNo);
	
	public int getComNo(int memNo);
	
	public int checkRegisterdCorp(int memNo);
	
	public String searchId(MemberVO vo);
	public int searchPass(MemberVO vo);
	public int setPassword(MemberVO vo);
}
