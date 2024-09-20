package kr.or.ddit.hr.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRVO;

/**
 * Servlet implementation class HRCardPagingList
 */
@WebServlet("/HRCardPagingList.do")
public class HRCardPagingList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String prefix = "/WEB-INF/jsp/";
	String suffix = ".jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HRCardPagingList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//�럹�씠吏� 泥섎━�븯�뒗 媛앹껜 留뚮뱾
		HRPagingVO hrPagingVO = new HRPagingVO();
		
		//�꽌鍮꾩뒪 媛앹껜 �깮
		IHRService hrService = HRServiceImpl.getInstance();
		
		//�럹�씠吏� 泥섎━ ( request �뿉�꽌 �쁽�옱�럹�씠吏� 媛믪쓣 媛��졇�삩�떎) 
		System.out.println(req.getParameter("currentPageNo"));
		
		int currentPageNo = req.getParameter("currentPageNo") == null ? 
				0: Integer.parseInt(req.getParameter("currentPageNo"));
		int totalCount = hrService.getTotalHRCount();
		
		hrPagingVO.setCurrentPageNo(currentPageNo);
		hrPagingVO.setTotalCount(totalCount);
		
		//�럹�씠吏� 泥섎━ �븷 list 媛��졇�삤湲� 
		List<HRCardVO> hrCardPagingList = hrService.hrCardPagingList(hrPagingVO);
		
		req.setAttribute("hrPagingVO", hrPagingVO);
		req.setAttribute("hrCardPagingList", hrCardPagingList);
		
		req.getRequestDispatcher(prefix + "SShrCardPagingList"+suffix).forward(req, resp);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
