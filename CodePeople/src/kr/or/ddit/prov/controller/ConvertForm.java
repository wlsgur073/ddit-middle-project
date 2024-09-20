package kr.or.ddit.prov.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prov.service.IProvService;
import kr.or.ddit.prov.service.ProvServiceImpl;

@WebServlet("/ConvertForm.do")
public class ConvertForm extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IProvService provService = ProvServiceImpl.getInstance();
		
		
		
		String cityCodeNm = req.getParameter("cityCodeNo") == null?
				"" : (String) req.getParameter("cityCodeNo");
		
		int cityCodeNo = provService.convertToCityNo(cityCodeNm);
		
		String provCodeNm = req.getParameter("provCodeNo") == null?
				"" : (String) req.getParameter("provCodeNo");
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("CITY_CODE_NO", cityCodeNo);
		map.put("PROV_CODE_NM", provCodeNm);
		
		int provCodeNo = provService.convertToProvNo(map);
		
		req.setAttribute("provCodeNo", provCodeNo);
		req.setAttribute("cityCodeNo", cityCodeNo);
		
		
		
		
		req.getRequestDispatcher("/WEB-INF/jsp/convertForm.jsp").forward(req, resp);
		
	}
}
