package kr.or.ddit.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.company.vo.CompanyVO;

/**
 * Servlet implementation class CompanyInfo
 */
@WebServlet("/CompanyInfo.do")
public class CompanyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int comNo = 0;
		
		CompanyVO companyVO = null;
		
		comNo = (int) request.getAttribute("comNo");
		
		ICompanyService companyservice = CompanyServiceImpl.getInstance();
		
		companyVO = companyservice.getCompany(comNo);
		
		request.setAttribute("companyInfo", companyVO);
		
		request.getRequestDispatcher("/CodePeople/mainJsp/companyInsert.jsp").forward(request, response);
	}

}
