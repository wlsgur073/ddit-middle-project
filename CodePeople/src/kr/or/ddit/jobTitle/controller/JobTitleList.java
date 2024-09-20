package kr.or.ddit.jobTitle.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.jobTitle.service.IJobTitleService;
import kr.or.ddit.jobTitle.service.JobTitleServiceImpl;
import kr.or.ddit.jobTitle.vo.JobTitleVO;

@WebServlet("/jobTitleList.do")
public class JobTitleList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobTitleService jobTitleService = JobTitleServiceImpl.getInstance();
		
		int jgCodeNo = req.getParameter("jobGroupOptionNo") == null ?
				0 : Integer.parseInt(req.getParameter("jobGroupOptionNo"));
		
		List<JobTitleVO> list = jobTitleService.selectJobTitleList(jgCodeNo);
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SSjobTitleList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
