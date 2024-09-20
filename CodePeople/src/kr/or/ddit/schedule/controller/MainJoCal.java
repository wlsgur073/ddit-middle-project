package kr.or.ddit.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.schedule.service.ScheduleServiceImpl;
import kr.or.ddit.schedule.vo.ScheduleVO;

@WebServlet("/MainJoCal.do")
public class MainJoCal extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IScheduleService scheduleService = ScheduleServiceImpl.getInstance();
		List<ScheduleVO> joScheduleList = scheduleService.joScheduleList();
		
		req.setAttribute("joScheduleList", joScheduleList);
		
		System.out.println(joScheduleList == null);
		
		req.getRequestDispatcher("/mainJsp/myCalendar.jsp").forward(req, resp);
	}

}
