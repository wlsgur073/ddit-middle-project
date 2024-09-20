package kr.or.ddit.company.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

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
 * Servlet implementation class CompanyInsert
 */
@WebServlet("/CompanyInsert.do")
public class CompanyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CompanyVO companyVO = new CompanyVO();
		
		request.setCharacterEncoding("utf-8");
		
		int cnt = 0;
		
		ICompanyService companyService = CompanyServiceImpl.getInstance();

		try {
			BeanUtils.populate(companyVO, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		cnt = companyService.companyInsert(companyVO);
		
		//���� ���а��� boardinsert���� ��� ó��
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/jsp/SSsuccessCheck.jsp").forward(request, response);
		
		
	}

}
