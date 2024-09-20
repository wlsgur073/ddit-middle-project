package kr.or.ddit.company.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.company.vo.CompanyVO;

/**
 * Servlet implementation class CompanyInfo
 */
@WebServlet("/CompanyUpdate.do")
public class CompanyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CompanyVO companyVO = new CompanyVO();
		
		int cnt = 0;
		
		try {
			BeanUtils.populate(companyVO, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		ICompanyService companyservice = CompanyServiceImpl.getInstance();
		
		System.out.println(companyVO.getJgCodeNo());
		
		cnt = companyservice.updateCompany(companyVO);
		
		System.out.println(cnt);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/jsp/SSsuccessCheck.jsp").forward(request, response);
	}

}
