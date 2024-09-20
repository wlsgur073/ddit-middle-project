package kr.or.ddit.hr.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class ResisterHRInfo
 */
@WebServlet("/RegiHRInfo.do")
public class RegiHRInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegiHRInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//세션 객체에서 꺼내오기.
		HttpSession session = request.getSession();
        MemberVO loginMember = session.getAttribute("memVO") == null?
                    null : (MemberVO)session.getAttribute("memVO");
        
        if(loginMember == null) {    	
           request.setAttribute("result", -1);
           request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);

        }else {

            int memCode = loginMember.getMemCode();
            
            if(memCode == 2) {
            	   request.setAttribute("result", -1);
                   request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
            }else {
            	  IMemberService memberService = MemberServiceImpl.getInstance();
                  int memNo = loginMember.getMemNo();
                  
                  IHRService hrService = HRServiceImpl.getInstance();
                  int hrNo = hrService.getHrNo(memNo);
                  
                  int checkNew = hrService.checkNew(memNo);
                  
                  //이력서 등록이 처음인가 구분하기  -> 처음이면
                  if(checkNew == 0) {
                	  request.setAttribute("result", 1);
                      request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
                	  
                  }else {
                	 request.setAttribute("result", 2);
                	 request.getRequestDispatcher(prefix+"navi"+suffix).forward(request, response);
               	  
                  }
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
