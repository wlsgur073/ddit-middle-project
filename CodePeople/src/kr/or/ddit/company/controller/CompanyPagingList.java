package kr.or.ddit.company.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.CompanyPagingVO;
import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.company.vo.CompanyVO;


@WebServlet("/CompanyPagingList.do")
public class CompanyPagingList extends HttpServlet{
	
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CompanyPagingVO companyPagingVO = new CompanyPagingVO();
		System.out.println("here");
		int currentPageNo = req.getParameter("currentPageNo") == null ?
				1 : Integer.parseInt(req.getParameter("currentPageNo"));
		
		System.out.println("here");
		ICompanyService companyService = CompanyServiceImpl.getInstance();
		
		int totalCount = companyService.getTotalCompanyCount();
		System.out.println(currentPageNo);
		System.out.println(totalCount);
		companyPagingVO.setCurrentPageNo(currentPageNo);
		
		companyPagingVO.setTotalCount(totalCount);

		List<CompanyVO> companyPagingList = companyService.companyPagingList(companyPagingVO);
		
		req.setAttribute("companyPagingList", companyPagingList);
		
		req.setAttribute("companyPagingVO", companyPagingVO);
		
		req.getRequestDispatcher(prefix+"company"+suffix).forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
