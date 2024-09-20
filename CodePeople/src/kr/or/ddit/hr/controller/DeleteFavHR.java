package kr.or.ddit.hr.controller;

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
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRFavVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class DeleteFavHR
 */
@WebServlet("/DeleteFavHR.do")
public class DeleteFavHR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
	
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFavHR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        MemberVO loginMember = session.getAttribute("memVO") == null?
                    null : (MemberVO)session.getAttribute("memVO");

            if(loginMember == null) {
                request.setAttribute("result", -1);
                request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);

            }else {
		
            	  int memCode = loginMember.getMemCode();
                  if(memCode == 2) {
		
                	  IMemberService memberService = MemberServiceImpl.getInstance();
                      int memNo = loginMember.getMemNo();
                      
                      //memNo로 comNo가져오기
                      int comNo = memberService.getComNo(memNo);
                      
                      //회원이 회사를 등록한 회원인지 여부 확인
                      ICompanyService comService = CompanyServiceImpl.getInstance();
                      int comCnt = comService.companyCount(memNo);
                      
                      //회사등록이 되어 있지 않은 경우
                      if(comCnt == 0) {
                    	  request.setAttribute("result", -1 );
                    	  request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);                    	  
                      }else {
                     
	                      //페이지로부터 값 받아오기
	                  	int hrNo = Integer.parseInt(request.getParameter("hrNo"));
			
	                	
	                  	//객체에 필요한 데이터 세팅
	                	HRFavVO hrFavVO = new HRFavVO();
	                	hrFavVO.setComNo(comNo);
	                	hrFavVO.setHrNo(hrNo);
	               
	                	//기존에 관심인재로 등록여부 등록 확인
	                	IHRService hrService = HRServiceImpl.getInstance();
	                	int checkFav = hrService.checkFavHr(hrFavVO);
	                	if(checkFav== 0) {
	             		   request.setAttribute("result", -3);
	                       request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);
		          
	                	}else {
	     
	            		int cnt = hrService.deleteFavHr(hrFavVO);
                	
                	
            		   request.setAttribute("result", cnt);
                       request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);
	                	}
	                }
                  }else {
                      request.setAttribute("result", -1);
                      request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);
                  	
                  }
              }
              
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}

}
