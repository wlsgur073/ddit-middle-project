<%@page import="kr.or.ddit.cmm.vo.JobOpeningPagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	JobOpeningPagingVO pagingVO = (JobOpeningPagingVO) request.getAttribute("pagingVO"); 
%>
	{	
		"totalCount" : "<%=pagingVO.getTotalCount()%>",
		"firstPageNo" : "<%=pagingVO.getFirstPageNo()%>",
		"pageSize" : "<%=pagingVO.getPageSize()%>",
		"lastPageNo" : "<%=pagingVO.getLastPageNo()%>",
		"currentPageNo" : "<%=pagingVO.getCurrentPageNo()%>",
		"totalPageCount" : "<%=pagingVO.getTotalPageCount()%>"
	}
