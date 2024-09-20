package kr.or.ddit.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;

/**
 * Servlet implementation class CompanyDetailList
 */
@WebServlet("/CompanyDetailList.do")
public class CompanyDetailList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyDetailList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int comNo = Integer.parseInt(request.getParameter("comNo"));
		
		List<Map<String, Object>> listCD = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> listJO = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> listReview = new ArrayList<Map<String,Object>>();
		
		int jOCheck = 0;
		int reviewCheck = 0;
		
		ICompanyService companyservice = CompanyServiceImpl.getInstance();
		
		//JO, Review 체크
		jOCheck = companyservice.companyJOCount(comNo);
		reviewCheck = companyservice.companyReviewCount(comNo);
		
		//쿼리 받기
		listCD = companyservice.companyDetailList(comNo);
		listJO = companyservice.companyJOList(comNo);
		listReview = companyservice.companyReview(comNo);
		
		//JOCount 체크(JO가 NULL일시 cnt = 0 만 전송)
		if(jOCheck == 0) {
			request.setAttribute("companyJOCount", jOCheck);
		} else {
			request.setAttribute("companyJOCount", jOCheck);
			request.setAttribute("companyJOList", listJO);
		}
		
		//ReviewCount 체크(Review가 NULL일시 cnt = 0 만 전송)
		if(reviewCheck == 0) {
			request.setAttribute("companyReviewCount", reviewCheck);
		} else {
			request.setAttribute("companyReviewCount", reviewCheck);
			request.setAttribute("companyReviewList", listReview);
		}
		
		request.setAttribute("companyDetail", listCD);
		
		request.getRequestDispatcher("/WEB-INF/jsp/companyDetail.jsp").forward(request, response);
		
	}


}
