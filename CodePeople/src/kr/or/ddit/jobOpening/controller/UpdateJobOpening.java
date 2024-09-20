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
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/UpdateJobOpening.do")
public class UpdateJobOpening extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		int joNo = req.getParameter("joNo") == null?
				0 : Integer.parseInt(req.getParameter("joNo"));
		
		HttpSession session = req.getSession();
		
		MemberVO loginMember = (MemberVO)session.getAttribute("memVO");
		
		req.setAttribute("joNo", joNo);
		
		int result = 0;
		
		if(loginMember == null) {
			result = 3;
			req.setAttribute("result", result);
			req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
		}else {
			int memNo = loginMember.getMemNo();
			
			if(memNo == jobOpeningService.checkJobOpeningRight(joNo)) {
				
				resp.setCharacterEncoding("UTF-8");
				
				JobOpeningVO vo = new JobOpeningVO();
				
				try {
					BeanUtils.populate(vo, req.getParameterMap());
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				
				
				System.out.println(vo.getJoTitle());
				System.out.println(vo.getComNo());
				System.out.println(vo.getJoRank());
				System.out.println(vo.getJoSdate());
				System.out.println(vo.getJoEdate());
				System.out.println(vo.getCityCodeNo());
				System.out.println(vo.getJoLink());
				System.out.println(vo.getJoMthd());
				
				result = jobOpeningService.updateJobOpening(vo);
				
				System.out.println("result : " + result);
				
				if(result > 0) {
					result = 4;
				}else {
					result = 5;
				}
				
				req.setAttribute("result", result);
				
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
				
			}else {			
				System.out.println("수정권한이 없습니다");
				req.setAttribute("result", 6);
				req.getRequestDispatcher("/WEB-INF/jsp/result.jsp").forward(req, resp);
			}
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
