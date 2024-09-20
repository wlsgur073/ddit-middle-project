package kr.or.ddit.cmm.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/CheckRight.do")
public class CheckRight extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
        MemberVO loginMember = session.getAttribute("memVO") == null?
                null : (MemberVO)session.getAttribute("memVO");
        IMemberService memberService = MemberServiceImpl.getInstance();
        
        System.out.println(loginMember == null);
        
        req.setAttribute("result", 0);
        req.setAttribute("hrNo", 0);
        req.setAttribute("memNo", 0);
        req.setAttribute("comNo", 0);
        
        if(loginMember == null) {
            
            req.setAttribute("result", 0);
            
            req.getRequestDispatcher("/WEB-INF/jsp/CheckRight.jsp").forward(req, resp);
            
        }else {
            
            int memCode = loginMember.getMemCode();
            int memNo = loginMember.getMemNo();
            
            req.setAttribute("memNo", memNo);
            
            if(memCode == 2) {
            	
                int check = memberService.checkRegisterdCorp(memNo);
                if(check > 0) {
                    int comNo = memberService.getComNo(memNo);
                    req.setAttribute("comNo", comNo);
                	req.setAttribute("result", 2);
                	req.getRequestDispatcher("/WEB-INF/jsp/CheckRight.jsp").forward(req, resp);
                }else {
                	req.setAttribute("result", 3);
                	req.getRequestDispatcher("/WEB-INF/jsp/CheckRight.jsp").forward(req, resp);
                }
            }else if(memCode == 1) {
            	int hrNo = memberService.getHrNo(memNo);
            	req.setAttribute("hrNo", hrNo);
            	req.setAttribute("result", 1);
            	req.getRequestDispatcher("/WEB-INF/jsp/CheckRight.jsp").forward(req, resp);
            }
        }
	}
}
