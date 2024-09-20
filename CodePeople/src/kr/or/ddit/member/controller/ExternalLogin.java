package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/ExternalLogin.do")
public class ExternalLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberVO memVO = new MemberVO();
		HttpSession session = req.getSession();
		IMemberService service = MemberServiceImpl.getInstance();
		
		try {
			BeanUtils.populate(memVO, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
//		memVO = service.loginMember(memVO);
		
		memVO.setMemId(memVO.getMemNm());
		memVO.setMemCode(1);
		memVO.setMemIsApi(1);
		
		session.setAttribute("memVO", memVO);
		
		resp.setContentType("application/json");
		resp.getWriter().print("{\"flag\": \"true\"}");
	}

}
