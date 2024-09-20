package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/MemberDelete.do")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		int res = 0;
		MemberVO vo = new MemberVO();
		String memId = req.getParameter("memId");
		String memOrignlPw = req.getParameter("memOrignlPw");
		vo.setMemId(memId);
		vo.setMemOrignlPw(memOrignlPw);
		
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		res = service.deleteMember(vo);
		
		resp.setContentType("application/json");
		if(res > 0) {
			resp.getWriter().print("{\"flag\": \"true\",");
			resp.getWriter().print("\"success\": \"회원탈퇴가 성공적으로 완료되었습니다!\"}");
		} else {
			resp.getWriter().print("{\"flag\": \"false\",");
			resp.getWriter().print("\"error\": \"입력하신 비밀번호와 계정 비밀번호가 일치하지 않습니다.\"}");
		}
	}

}
