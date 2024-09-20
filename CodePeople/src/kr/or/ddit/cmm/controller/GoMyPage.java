package kr.or.ddit.cmm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class GoMyPage
 */
@WebServlet("/GoMyPage.do")
public class GoMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoMyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���� ��ü���� ��������.
				HttpSession session = request.getSession();
		        MemberVO loginMember = session.getAttribute("memVO") == null?
		                    null : (MemberVO)session.getAttribute("memVO");
		        
		        if(loginMember == null) {    	
		           request.setAttribute("result", -1);
		           request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);

		        }else {

		            int memCode = loginMember.getMemCode();
		            if(memCode == 2) {
		            	   request.setAttribute("result", 3);
		                   request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
		            }else if(memCode ==1 ){
		            		 request.setAttribute("result", 4);
		                	 request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
		               	  
		                  
		            }else {
		            	//관리자 계정   
		           	 request.setAttribute("result", 5);
                	 request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
               	  
                
		            }
		        }			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
