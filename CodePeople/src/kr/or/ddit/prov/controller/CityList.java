package kr.or.ddit.prov.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prov.service.IProvService;
import kr.or.ddit.prov.service.ProvServiceImpl;
import kr.or.ddit.prov.vo.CityVO;

@WebServlet("/CityList.do")
public class CityList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IProvService provService = ProvServiceImpl.getInstance();
		
		List<CityVO> list = provService.selectCityList();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/jsp/SScityList.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
