package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet("/JobOpeningCardSearchList.do")
public class JobOpeningCardSearchList extends HttpServlet{
	String prefix = "/WEB-INF/jsp/";
	String suffix = ".jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		JobOpeningPagingVO jobOpeningPagingVO = new JobOpeningPagingVO();
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		HashMap jobOpeningSearchVO = new HashMap();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				0 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		if(req.getParameter("JG_CODE_NO") != null) {
			jobOpeningSearchVO.put("JG_CODE_NO", String.valueOf(req.getParameter("JG_CODE_NO")));
		}
		if(req.getParameter("JT_CODE_NO") != null) {
			jobOpeningSearchVO.put("JT_CODE_NO", String.valueOf(req.getParameter("JT_CODE_NO")));
		}
		if(req.getParameter("PL_CODE_NO") != null) {
			jobOpeningSearchVO.put("PL_CODE_NO", String.valueOf(req.getParameter("PL_CODE_NO")));
		}
		if(req.getParameter("SAL_TYPE") != null) {
			jobOpeningSearchVO.put("SAL_TYPE", String.valueOf(req.getParameter("SAL_TYPE")));
		}
		if(req.getParameter("PROV_CODE_NO") != null) {
			jobOpeningSearchVO.put("PROV_CODE_NO", String.valueOf(req.getParameter("PROV_CODE_NO")));
		}
		if(req.getParameter("CITY_CODE_NO") != null) {
			jobOpeningSearchVO.put("CITY_CODE_NO", String.valueOf(req.getParameter("CITY_CODE_NO")));
		}
		if(req.getParameter("STATE") != null) {
			jobOpeningSearchVO.put("STATE", String.valueOf(req.getParameter("STATE")));
		}
		
		int searchTotalCount = jobOpeningService.getTotalJobOpeningSearchCount(jobOpeningSearchVO);
		
		System.out.println(searchTotalCount);
		
		jobOpeningPagingVO.setCurrentPageNo(currentPageNo);
		
		jobOpeningPagingVO.setTotalCount(searchTotalCount);
		
		jobOpeningSearchVO.put("FIRST_REC_NO", jobOpeningPagingVO.getFirstRecNo());
		
		jobOpeningSearchVO.put("LAST_REC_NO", jobOpeningPagingVO.getLastRecNo());
		
		System.out.println(jobOpeningPagingVO.getFirstRecNo());
		
		System.out.println(jobOpeningPagingVO.getLastRecNo());
		
		List<Map<String, Object>> jobOpeningCardSearchList = jobOpeningService.jobOpeningCardSearchList(jobOpeningSearchVO);
		
		req.setAttribute("jobOpeningCardPagingList", jobOpeningCardSearchList);
		
		req.setAttribute("PagingVO", jobOpeningPagingVO);
		
		req.getRequestDispatcher(prefix + "jobOpeningCardPagingList" + suffix).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}}
