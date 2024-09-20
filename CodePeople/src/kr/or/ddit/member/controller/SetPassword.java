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

@WebServlet("/SetPassword.do")
public class SetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int cnt = 0;
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMemberService service = MemberServiceImpl.getInstance();
	
		cnt = service.setPassword(vo);
		
		resp.setContentType("application/json");
		if(cnt > 0) {
			resp.getWriter().print("{\"flag\": \"true\",");
			resp.getWriter().print("\"result\": \"비밀번호가 성공적으로 재설정되었습니다.\"}");
		} else {
			resp.getWriter().print("{\"error\": \"setPassword 서블릿에서 발생한 오류입니다.\"}");
		}
	}

}
