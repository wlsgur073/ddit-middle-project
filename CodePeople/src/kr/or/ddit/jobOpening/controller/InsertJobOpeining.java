package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.jobOpening.service.IJobOpeningService;
import kr.or.ddit.jobOpening.service.JobOpeningServiceImpl;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/InsertJobOpeining.do")
public class InsertJobOpeining extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		HttpSession session = req.getSession();
		
		int result = 0;
		
		MemberVO loginMember = session.getAttribute("memVO") == null?
				null : (MemberVO)session.getAttribute("memVO");
		
		if(loginMember == null) {
			
			// result.jsp에서 result를 -1로 셋팅해서 보내면
			// res.memCode 가 0이 나옵니다
			req.setAttribute("result", -1);
			
			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			
		}else {
			
			int memCode = loginMember.getMemCode();
			
			if(memCode == 2) {
				
				IMemberService memberService = MemberServiceImpl.getInstance();
				
				int memNo = loginMember.getMemNo();
				
				int check = memberService.checkRegisterdCorp(memNo);
				
				if(check > 0) {
					
					int comNo = memberService.getComNo(memNo);
					
					resp.setCharacterEncoding("UTF-8");
					
					JobOpeningVO vo = new JobOpeningVO();
					
					try {
						BeanUtils.populate(vo, req.getParameterMap());
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
					
					vo.setComNo(comNo);
					
					System.out.println(vo.getJoTitle());
					System.out.println(vo.getComNo());
					System.out.println(vo.getJoRank());
					System.out.println(vo.getJoSdate());
					System.out.println(vo.getJoEdate());
					System.out.println(vo.getCityCodeNo());
					System.out.println(vo.getJoLink());
					System.out.println(vo.getJoMthd());
					
					result = jobOpeningService.insertJobOpening(vo);
					
					System.out.println("result : " + result);
					
					req.setAttribute("result", result);
					
					req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
				}
				
				
			}else {			
				req.setAttribute("result", 0);
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			}
		}
		

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
