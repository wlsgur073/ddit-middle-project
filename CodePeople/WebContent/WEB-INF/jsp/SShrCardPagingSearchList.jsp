
<%@page import="kr.or.ddit.cmm.vo.HRPagingVO"%>
<%@page import="kr.or.ddit.hr.vo.HRCardVO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<HRCardVO > list = (List<HRCardVO>) request.getAttribute("hrCardSearchList");
	HRPagingVO pagingVO = (HRPagingVO) request.getAttribute("hrPagingVO");

%>
{  "hrInfo" :

	[

<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		HRCardVO vo = list.get(i);

		Integer hrNo = vo.getHrNo();
		String memNm = vo.getMemNm();
		String jtCodeNm = vo.getJtCodeNm();
		String plCodeNm = vo.getPlCodeNm();
		String hrCurrCom = vo.getHrCurrCom();
		
%>

	{
		"hrNo"  : "<%=hrNo%>",
		"memNm" : "<%=memNm%>",
		"jtCodeNm" : "<%=jtCodeNm%>",
		"plCodeNm" : "<%=plCodeNm%>",
		"hrCurrCom" : "<%=hrCurrCom%>"
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

