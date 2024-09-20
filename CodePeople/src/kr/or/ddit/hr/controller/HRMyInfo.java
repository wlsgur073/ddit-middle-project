package kr.or.ddit.hr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.certification.service.CertServiceImpl;
import kr.or.ddit.certification.service.ICertService;
import kr.or.ddit.certification.vo.CertificationVO;
import kr.or.ddit.edu.service.EduServiceImpl;
import kr.or.ddit.edu.service.IEduService;
import kr.or.ddit.edu.vo.EduVO;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRCrrVO;
import kr.or.ddit.hr.vo.HRMyInfoVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.progLang.service.IProgLangService;
import kr.or.ddit.progLang.service.ProgLangServiceImpl;
import kr.or.ddit.progLang.vo.ProgLangVO;

/**
 * Servlet implementation class HRMyInfo
 */
@WebServlet("/HRMyInfo.do")
public class HRMyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	


	String prefix = "/mainJsp/";
	String suffix = ".jsp";
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HRMyInfo() {
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
        IMemberService memberService = MemberServiceImpl.getInstance();
        int memNo = loginMember.getMemNo();
		
		
//		int memNo = request.getAttribute("memNo");
		IHRService hrService = HRServiceImpl.getInstance();
		System.out.println(memNo);
		int hrNo = hrService.getHrNo(memNo);		
		System.out.println(hrNo);
		
		
		//get basic list 
		HRMyInfoVO myInfoVO =  hrService.selectMyInfo(memNo);

		
		
		//get certification list
		ICertService certService = CertServiceImpl.getInstance();
		List<CertificationVO> certList =certService.selectCert(hrNo);
		
		//get programlanguqge list
		IProgLangService plService = ProgLangServiceImpl.getInstance();
		List<ProgLangVO> plList = plService.selectPl(hrNo);
		
		//get career List
		List<HRCrrVO> crrList = hrService.selectCrr(hrNo);
		
		
		//get education list
		IEduService eduService = EduServiceImpl.getInstance();
		List<EduVO> eduList = eduService.selectEdu(hrNo);
		
		System.out.println(certList);
		
		System.out.println(plList);
		
		System.out.println(crrList);
		
		System.out.println(eduList);
		
		

		
		request.setAttribute("memNo", memNo);
		request.setAttribute("hrNo", hrNo);
		
		if(myInfoVO ==null) {
			request.setAttribute("infoFlag", 0);
		}else {
			request.setAttribute("infoFlag", 1);
				
			request.setAttribute("myInfoVO", myInfoVO);
		}
		
		
		
		if(certList.size()==0) {
			request.setAttribute("certListSize", 0);
		}else {
			request.setAttribute("certListSize", certList.size());
			request.setAttribute("certList", certList);
		}
		
		
		if(plList.size()==0) {
			request.setAttribute("plListSize", 0);
		}else {
			request.setAttribute("plListSize", plList.size());
			request.setAttribute("plList", plList);
		}
		
		if(crrList.size()==0) {
			request.setAttribute("crrListSize", 0);
		}else {
			request.setAttribute("crrListSize", crrList.size());
			request.setAttribute("crrList", crrList);
		}
		
		if(eduList.size()==0) {
			request.setAttribute("eduListSize", 0);
		}else {
			request.setAttribute("eduListSize", eduList.size());
			request.setAttribute("eduList", eduList);
		}
				

		
		request.getRequestDispatcher(prefix+"hrMyInfo"+suffix).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
