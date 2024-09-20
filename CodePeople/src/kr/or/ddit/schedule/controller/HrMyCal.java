package kr.or.ddit.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.hr.vo.HRVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.schedule.service.ScheduleServiceImpl;
import kr.or.ddit.schedule.vo.ScheduleVO;

@WebServlet("/HrMyCal.do")
public class HrMyCal extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HRVO hrVO = new HRVO(); 
		
		HttpSession session = req.getSession();
		
		MemberVO memVO = (MemberVO)session.getAttribute("memVO");
		
		if(memVO != null) {
			int memNo = memVO.getMemNo();
			IMemberService memberService = MemberServiceImpl.getInstance();
			
			int hrNo = memberService.getHrNo(memNo);
			
			hrVO.setHrNo(hrNo);
			hrVO.setMemNo(memNo);
			
			IScheduleService scheduleService = ScheduleServiceImpl.getInstance();
			List<ScheduleVO> myCal = scheduleService.getMyCal(hrVO);
			
			req.setAttribute("myCal", myCal);
			
			System.out.println(myCal == null);
			
			req.getRequestDispatcher("/mainJsp/myHrCalendar.jsp").forward(req, resp);
		}else {
			System.out.println("HrMyCal 에서 로그인멤버를 찾을 수 없음");
			IScheduleService scheduleService = ScheduleServiceImpl.getInstance();
			List<ScheduleVO> joScheduleList = scheduleService.joScheduleList();
			
			req.setAttribute("joScheduleList", joScheduleList);
			
			System.out.println(joScheduleList == null);
			
			req.getRequestDispatcher("/mainJsp/myCalendar.jsp").forward(req, resp);
		}
	}

}
