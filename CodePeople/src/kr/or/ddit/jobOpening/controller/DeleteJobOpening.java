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
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/DeleteJobOpening.do")
public class DeleteJobOpening extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		int joNo = req.getParameter("joNo") == null?
				0 : Integer.parseInt(req.getParameter("joNo"));
		
		HttpSession session = req.getSession();
		
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		
		int result = 0;
		
		if(loginMember == null) {
			req.setAttribute("result", 0);
			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
		}else {
			int memNo = loginMember.getMemNo();
			
			System.out.println("memNo" + memNo);
			
			if(memNo == jobOpeningService.checkJobOpeningRight(joNo)) {
				
				result = jobOpeningService.deleteJobOpening(joNo);
				
				req.setAttribute("result", result);
				
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
				
			}else {			
				req.setAttribute("result", 0);
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			}
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
