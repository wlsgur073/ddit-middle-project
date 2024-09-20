package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IprodService;
import kr.or.ddit.prod.service.prodServiceImpl;
import kr.or.ddit.prod.vo.prodVO;

@WebServlet("/ProdList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("prodNo"));
		
		System.out.println(pno);
		
		request.setCharacterEncoding("utf-8");
		
		IprodService service = prodServiceImpl.getInstance();
		
		List<prodVO> list = null;
		
		list = service.selectProd(pno);
		
		System.out.println(list);
		
		request.setAttribute("prodList", list);
		
		request.getRequestDispatcher("/WEB-INF/jsp/prodList.jsp").forward(request, response);
	}


}
