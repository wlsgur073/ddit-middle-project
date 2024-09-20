package kr.or.ddit.progLang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.progLang.service.IProgLangService;
import kr.or.ddit.progLang.service.ProgLangServiceImpl;
import kr.or.ddit.progLang.vo.ProgLangVO;

@WebServlet("/progLangList.do")
public class ProgLangList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IProgLangService progLangService = ProgLangServiceImpl.getInstance();
		
		List<ProgLangVO> progList = progLangService.selectProgLangList();
		
		if(progList == null) {
			System.out.println("null");
			System.exit(0);
		}
		
		req.setAttribute("progList", progList);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SSprogLangList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
