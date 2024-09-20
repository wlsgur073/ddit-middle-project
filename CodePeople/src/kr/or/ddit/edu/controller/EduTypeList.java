package kr.or.ddit.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.edu.service.EduServiceImpl;
import kr.or.ddit.edu.service.IEduService;
import kr.or.ddit.edu.vo.EduVO;

@WebServlet("/EduTypeList.do")
public class EduTypeList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IEduService eduService = EduServiceImpl.getInstance();
		
		List<EduVO> list = eduService.selectEduCodeList();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SSeduTypeList.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
