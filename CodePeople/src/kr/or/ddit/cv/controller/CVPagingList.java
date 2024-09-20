package kr.or.ddit.cv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.CVPagingVO;
import kr.or.ddit.cv.service.CVServiceImpl;
import kr.or.ddit.cv.service.ICVService;
import kr.or.ddit.cv.vo.CVVO;

@WebServlet("/CVPagingList.do")
public class CVPagingList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CVPagingVO cvPagingVO = new CVPagingVO();
		
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				0 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		ICVService cvService = CVServiceImpl.getInstance();
		
		int totalCount = cvService.getTotalCVCount();
		
		cvPagingVO.setCurrentPageNo(currentPageNo);
		
		cvPagingVO.setTotalCount(totalCount);
		
		List<CVVO> cvPagingList = cvService.cvPagingList(cvPagingVO);
		
		req.setAttribute("cvPagingList", cvPagingList);
		
		req.getRequestDispatcher("/WEB-INF/jsp/cvPagingList.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
