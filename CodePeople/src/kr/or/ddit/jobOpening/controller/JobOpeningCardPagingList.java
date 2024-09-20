package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.JobOpeningPagingVO;
import kr.or.ddit.jobOpening.service.IJobOpeningService;
import kr.or.ddit.jobOpening.service.JobOpeningServiceImpl;
import kr.or.ddit.jobOpening.vo.JobOpeningVO;

@WebServlet("/JobOpeningCardPagingList.do")
public class JobOpeningCardPagingList extends HttpServlet{

	String prefix = "/WEB-INF/jsp/";
	String suffix = ".jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JobOpeningPagingVO jobOpeningPagingVO = new JobOpeningPagingVO();
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				1 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		int totalCount = jobOpeningService.getTotalJobOpeningCount();
		
		jobOpeningPagingVO.setCurrentPageNo(currentPageNo);
		
		jobOpeningPagingVO.setTotalCount(totalCount);
		
		List<Map<String, Object>> jobOpeningCardPagingList = jobOpeningService.jobOpeningCardList(jobOpeningPagingVO);
		
		req.setAttribute("jobOpeningCardPagingList", jobOpeningCardPagingList);
		
		req.setAttribute("PagingVO", jobOpeningPagingVO);
		
		req.getRequestDispatcher("/mainJsp/mainJO.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
