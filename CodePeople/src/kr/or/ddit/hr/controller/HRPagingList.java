package kr.or.ddit.hr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRVO;

@WebServlet("/HRPagingList.do")
public class HRPagingList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HRPagingVO hrPagingVO = new HRPagingVO();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				0 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		IHRService hrService = HRServiceImpl.getInstance();
		
		int totalCount = hrService.getTotalHRCount();
		
		hrPagingVO.setCurrentPageNo(currentPageNo);
		
		hrPagingVO.setTotalCount(totalCount);
		
		List<HRVO> hrPagingList = hrService.hrPagingList(hrPagingVO);
		
		req.setAttribute("hrPagingList", hrPagingList);
		
		req.getRequestDispatcher("/WEB-INF/jsp/hrPagingList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
