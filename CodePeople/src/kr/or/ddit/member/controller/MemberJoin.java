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

@WebServlet("/MemberJoin.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("UTF-8");
		
		int res = 0;
		MemberVO vo = new MemberVO();
		
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
		
		// 1. service 객체 생성
		IMemberService service = MemberServiceImpl.getInstance();
		
//		System.out.println(vo.getMemCode());
		// 2. service메서드 호출하기 - 결과값 받기
		// 기업회원은  HR테이블에 INSERT할 필요가 없음
		if(vo.getMemCode() == 1) {
			res = service.joinPerson(vo);
		} else {
			res = service.joinCompany(vo);
		}
		
		
		// 3. 결과값 request에 저장
		req.setAttribute("res", res);
		
		// 4. jsp로 forward하기
		req.getRequestDispatcher("/WEB-INF/jsp/joinTest.jsp").forward(req, resp);
	}

}
