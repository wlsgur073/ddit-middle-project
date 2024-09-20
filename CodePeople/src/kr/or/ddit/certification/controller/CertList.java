package kr.or.ddit.certification.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.certification.service.CertServiceImpl;
import kr.or.ddit.certification.service.ICertService;
import kr.or.ddit.certification.vo.CertificationVO;

@WebServlet("/CertList.do")
public class CertList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ICertService certService = CertServiceImpl.getInstance();
		
		List<CertificationVO> list = certService.selectCertList();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SScertList.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
