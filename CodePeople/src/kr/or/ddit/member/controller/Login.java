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

@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	doPost(req,resp);
    } 
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
		
		memVO = service.loginMember(memVO);
		
		int num = 0;
		if(memVO != null)
			num = 1;
		// 1. 아이디  PW로 회원 조회
		// 2. 회원이 있다면  VO 반환 아니면  NULL반환
		// 3. NULL  이 아닐 시 VO에서 MEM_NO를 뽑아서 세션에 저장 / 및MEM_CODE_NO도 세션에 저장
		// 4. 해당작업 완료 후 INDEX로 보냄
		
//		MemberVO memVO = new MemberVO();
		
		System.out.println(memVO);
		
		req.setAttribute("num", num);
		session.setAttribute("memVO", memVO);
		
		
		req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
	}

}
