package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/JoinIdCheck.do")
public class JoinIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		// 클라이언트 요청시 전송데이터 받기
		String memId = req.getParameter("id");
		
		// service 객체 실행
		IMemberService service = MemberServiceImpl.getInstance();
		
		String id = service.selectById(memId);
//		String id = "test1234";
		
//		System.out.println("id중복검사 테스트 중 : " + id);
		
		// 결과값 ajax로 바로 보내기
		resp.setContentType("application/json");
		resp.getWriter().print("{\"id\": \"" + id + "\"}");
		
	}
}
