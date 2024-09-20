package kr.or.ddit.jobGroup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.jobGroup.service.IJobGroupService;
import kr.or.ddit.jobGroup.service.JobGroupServiceImpl;
import kr.or.ddit.jobGroup.vo.JobGroupVO;

@WebServlet("/jobGroupList.do")
public class JobGroupList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobGroupService jobGroupService = JobGroupServiceImpl.getInstance();
		
		List<JobGroupVO> list = jobGroupService.selectJobGroupList();
		
		if(list == null) {
			System.out.println("null");
			System.exit(0);
		}
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SSjobGroupList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
