package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SHA256;

@WebServlet("/MemberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
//		HttpSession session = req.getSession();
		
		int res = 0;
		String myPage = "";
		MemberVO vo = new MemberVO();
		IMemberService service = MemberServiceImpl.getInstance();
		
		try {
			BeanUtils.populate(vo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String memOrignlPw = (String)(req.getParameter("memOrignlPw"));
		String memPw = SHA256.getSHA256(memOrignlPw);
		vo.setMemPw(memPw);
		
		if(vo.getMemCode() == 1){				// 개인회원
			myPage = "myPagePerson.html";
		} else if (vo.getMemCode() == 2){		// 기업회원
			myPage = "myPageCompany.html";
		} else if(vo.getMemCode() == 3){		// 관리자
			myPage = "myPageAdmin.html";
		}
		
//		System.out.println("입력값 체크 = " + vo.getMemId());
		System.out.println("입력값 체크 = " + vo.getMemTel());
		System.err.println("마이페이지 링크 값 체크 = " + myPage);
		
		
		res = service.updateMember(vo);
		
		if(res > 0) {
			resp.setContentType("application/json");
			resp.getWriter().print("{\"myPage\": \"" + myPage + "\"}");
		} else {
			System.err.println("MemberUpdate 서블릿에 에러가 발생했습니다.");
		}
		
	}

}
