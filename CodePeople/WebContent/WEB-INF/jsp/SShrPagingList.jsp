<%@page import="kr.or.ddit.cmm.vo.HRPagingVO"%>
<%@page import="kr.or.ddit.hr.vo.HRVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<HRVO> list = (List<HRVO>) request.getAttribute("hrPagingList");
    HRPagingVO pagingVO = (HRPagingVO) request.getAttribute("hrPagingVO");
%>

{  "hrInfo" :

	[
	
		<%
			for(int i = 0; i < list.size(); i++){
				if(i > 0){
					out.print(",");
				}
				HRVO vo = list.get(i);
				
				Integer hrNo = vo.getHrNo();
				Integer memNo = vo.getMemNo();
				Integer jgCodeNo = vo.getJgCodeNo();
				Integer jtCodeNo = vo.getJtCodeNo();
				Integer plCodeNo = vo.getPlCodeNo();
		%>

		
			{	
				"hrNo" : "<%=hrNo%>",
				"memNo" : "<%=memNo%>",
				"jgCodeNo" : "<%=jgCodeNo%>",
				"jtCodeNo" : "<%=jtCodeNo%>",
				"plCodeNo" : "<%=plCodeNo%>"
			}

		
<%		
		
	}
%>



],

		
		"pageCount" : "<%=pagingVO.getPageSize() %>",
		"countPerPage" : "<%=pagingVO.getCountPerPage() %>",
		"firstPage" : "<%=pagingVO.getFirstPageNo() %>",
		"firstRecord" : "<%=pagingVO.getFirstRecNo() %>",
		"lastPage" : "<%=pagingVO.getLastPageNo() %>",
		"lastRecord" : "<%=pagingVO.getLastRecNo() %>",
		"totalCount" : "<%=pagingVO.getTotalCount() %>",
		"totalPageCount" : "<%=pagingVO.getTotalPageCount() %>",
		"currentPage" : "<%=pagingVO.getCurrentPageNo() %>"
}