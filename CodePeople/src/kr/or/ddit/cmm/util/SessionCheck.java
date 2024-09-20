package kr.or.ddit.cmm.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class SessionCheck {
	
	public static boolean isLoginMember(HttpSession session) {
		MemberVO memVO = (MemberVO) session.getAttribute("memVO");
		System.out.println(memVO);
		return session.getAttribute("memVO") != null;
	}
	
	public static int getMemNo(HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO) session.getAttribute("memVO");
		System.out.println(loginMember.getMemNo());
		return loginMember.getMemNo();
	}  
	
	public static int getMemCode(HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		System.out.println(loginMember.getMemCode());
		return loginMember.getMemCode();
	}
	
	public static int getHrNo(HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		int memNo = loginMember.getMemNo();
		IMemberService memberService = MemberServiceImpl.getInstance();
		if(loginMember.getMemCode() == 1) {
			return memberService.getHrNo(memNo);
		}
		return 0;
	}
	
	public static int hasComNo(HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		int memNo = loginMember.getMemNo();
		IMemberService memberService = MemberServiceImpl.getInstance();
		if(loginMember.getMemCode() == 2) {
			return memberService.checkRegisterdCorp(memNo);
		}
		return 0;
	}
	
	public static int getComNo(HttpSession session, HttpServletRequest request) {
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		int memNo = loginMember.getMemNo();
		IMemberService memberService = MemberServiceImpl.getInstance();
		if(loginMember.getMemCode() == 2) {
			int check = memberService.checkRegisterdCorp(memNo);
			if(check > 0) {
				return memberService.getComNo(memNo);
			}
		}
		return 0;
	}
	
}
