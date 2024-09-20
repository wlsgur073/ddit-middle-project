package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.JobOpeningPagingVO;
import kr.or.ddit.jobOpening.service.IJobOpeningService;
import kr.or.ddit.jobOpening.service.JobOpeningServiceImpl;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;

@WebServlet("/JobOpeningPagingList.do")
public class JobOpeningPagingList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JobOpeningPagingVO jobOpeningPagingVO = new JobOpeningPagingVO();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				0 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		int totalCount = jobOpeningService.getTotalJobOpeningCount();
		
		jobOpeningPagingVO.setCurrentPageNo(currentPageNo);
		
		jobOpeningPagingVO.setTotalCount(totalCount);
		
		List<JobOpeningVO> jobOpeningPagingList = jobOpeningService.jobOpeningPagingList(jobOpeningPagingVO);
		
		req.setAttribute("jobOpeningPagingList", jobOpeningPagingList);
		
		req.getRequestDispatcher("/WEB-INF/jsp/jobOpeningPagingList.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
