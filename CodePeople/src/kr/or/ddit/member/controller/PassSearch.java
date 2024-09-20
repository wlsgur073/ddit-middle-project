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

@WebServlet("/PassSearch.do")
public class PassSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
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
		
		req.setAttribute("memId", vo.getMemId());
		System.out.println(vo.getMemId());
		
		cnt = service.searchPass(vo);

		System.out.println("cnt = "+ cnt);
		if(cnt > 0) {
			req.getRequestDispatcher("/WEB-INF/jsp/setPassword.jsp").forward(req, resp);
//			resp.sendRedirect("/WEB-INF/jsp/setPassword.jsp");
			
		} else {
			resp.setContentType("application/json");
			resp.getWriter().print("{\"cnt\": \"" + cnt + "\"}");		
		}
		
	}

}
