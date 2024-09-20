package kr.or.ddit.jobOpening.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.jobOpening.service.IJobOpeningService;
import kr.or.ddit.jobOpening.service.JobOpeningServiceImpl;
import kr.or.ddit.jobOpening.vo.ApplyVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/Apply.do")
public class Apply extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		HttpSession session = req.getSession();
		
		MemberVO loginMember = (MemberVO) session.getAttribute("memVO");
		
		if(loginMember == null) {
			
			req.setAttribute("result", 0);
			
			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			
		}else {
			
			System.out.println("로그인 멤버 있음");
			
			Integer memCode = loginMember.getMemCode();
			Integer memNo = loginMember.getMemNo();
			
			if(memCode == 1) {
				
				IMemberService memberService = MemberServiceImpl.getInstance();
				
				int hrNo = memberService.getHrNo(memNo);
				
				int joNo = req.getParameter("joNo") == null?
						0 : Integer.parseInt(req.getParameter("joNo"));
				
				int jtNo = jobOpeningService.getJtCodeNo(joNo);
				
				ApplyVO applyVO = new ApplyVO();
				
				applyVO.setHrNo(hrNo);
				applyVO.setJoNo(joNo);
				applyVO.setJtNo(jtNo);
				
				int result = jobOpeningService.applyJobOpening(applyVO);
				
				req.setAttribute("result", result);
				
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			
			}else {
				System.out.println("기업회원은 지원할 수 없습니다.");
			}
			
		}
	}
}
