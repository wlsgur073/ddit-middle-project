package kr.or.ddit.company.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.company.service.CompanyServiceImpl;
import kr.or.ddit.company.service.ICompanyService;
import kr.or.ddit.company.vo.ComFavVO;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class DeleteFavCompany
 */
@WebServlet("/DeleteFavCompany.do")
public class DeleteFavCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFavCompany() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO loginMember = session.getAttribute("memVO") == null ? null : (MemberVO) session.getAttribute("memVO");

		if (loginMember == null) {

			request.setAttribute("result", -1);
			request.getRequestDispatcher(prefix + "favResult" + suffix).forward(request, response);

		} else {

			int memCode = loginMember.getMemCode();
			if (memCode == 1) {

				IMemberService memberService = MemberServiceImpl.getInstance();
				int memNo = loginMember.getMemNo();
				
				// ȸ���� ȸ�縦 ����� ȸ������ ���� Ȯ��
				IHRService hrservice = HRServiceImpl.getInstance();
				int hrNo = memberService.getHrNo(memNo);
				
				if (hrservice.getHrNo(memNo) == 0) {
					request.setAttribute("result", -1);
					request.getRequestDispatcher(prefix + "favResult" + suffix).forward(request, response);

				} else {

					// �������κ��� �� �޾ƿ���
					int comNo = Integer.parseInt(request.getParameter("comNo"));
					// ��ü�� �ʿ��� ������ ����
					ComFavVO comFavVO = new ComFavVO();

					ICompanyService companyservice = CompanyServiceImpl.getInstance();

					comFavVO.setComNo(comNo);
					comFavVO.setHrNo(hrNo);

					// ������ ��������� ��Ͽ��� Ȯ��
					int checkFav = companyservice.checkFavCompany(comFavVO);

					if (checkFav > 0) {
						int cnt = companyservice.deleteFavCompany(comFavVO);
						request.setAttribute("result", cnt);
						request.getRequestDispatcher(prefix + "favResult" + suffix).forward(request, response);

					} else {

						request.setAttribute("result", -3);
						request.getRequestDispatcher(prefix + "favResult" + suffix).forward(request, response);
					}
				}
			} else {

				System.out.println("mem2");
				request.setAttribute("result", -1);
				request.getRequestDispatcher(prefix + "favResult" + suffix).forward(request, response);

			}
		}

	
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
