package kr.or.ddit.hr.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.cmm.vo.HRPagingVO;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRCardVO;
import kr.or.ddit.hr.vo.HRSearchVO;

/**
 * Servlet implementation class HRCardSearchList
 */
@WebServlet("/HRCardSearchList.do")
public class HRCardSearchList extends HttpServlet {
	String prefix = "/WEB-INF/jsp/";
	String suffix = ".jsp";
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HRCardSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HRSearchVO hrSearchVO = new HRSearchVO();		
		
		try {
			BeanUtils.populate(hrSearchVO, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IHRService hrService =  HRServiceImpl.getInstance();
		
		
		//for the Paging
		int searchTotalCount = hrService.getTotalCardSearchCount(hrSearchVO);
		int currentPageNo = hrSearchVO.getCurrentPageNo();
		
		
		HRPagingVO hrPagingVO = new HRPagingVO();
		
	
		hrPagingVO.setCurrentPageNo(currentPageNo);
		hrPagingVO.setTotalCount(searchTotalCount);
		
		hrSearchVO.setFirstRecNo(hrPagingVO.getFirstRecNo());
		hrSearchVO.setLastRecNo(hrPagingVO.getLastRecNo());
		
		//execute query for the hrCardSearchList
		List<HRCardVO> hrCardSearchList = hrService.hrCardPagingSearchList(hrSearchVO);
		
		//set the Attribute and forward to jsp
		req.setAttribute("hrCardSearchList", hrCardSearchList);
		req.setAttribute("hrPagingVO", hrPagingVO);
		req.getRequestDispatcher(prefix+"SShrCardPagingSearchList"+suffix).forward(req, resp);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
