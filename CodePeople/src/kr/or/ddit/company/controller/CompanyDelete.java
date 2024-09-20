package kr.or.ddit.company.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class CompanyDelete
 */
@WebServlet("/CompanyDelete.do")
public class CompanyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyDelete() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int comNo = 0;
		int cnt = 0;
		
		comNo = Integer.parseInt(request.getParameter("comNo"));
		
		System.out.println(comNo);
		
		ICompanyService companyservice = CompanyServiceImpl.getInstance();
		
		cnt = companyservice.deleteCompany(comNo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/jsp/SSsuccessCheck.jsp").forward(request, response);
		
	}

}
