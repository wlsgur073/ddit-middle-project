<%@page import="kr.or.ddit.cmm.vo.JobOpeningPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.jobOpening.vo.JobOpeningVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("jobOpeningCardPagingList");

	JobOpeningPagingVO pagingVO = (JobOpeningPagingVO) request.getAttribute("PagingVO");
%>
{
	"joInfo" :		
			[
				
			<%
				for(int i = 0; i < list.size(); i++){
					if(i > 0){
				out.print(",");
					}
					Map<String, Object> vo = list.get(i);
					
					String rnum = String.valueOf(vo.get("RNUM"));
					String comNm = String.valueOf(vo.get("COM_NM"));
					String comIntro = String.valueOf(vo.get("COM_INTRO"));
					String joTitle = String.valueOf(vo.get("JO_TITLE"));
					String joSdate = String.valueOf(vo.get("JO_SDATE"));
					String joEdate = String.valueOf(vo.get("JO_EDATE"));
					String jgCodeNm = String.valueOf(vo.get("JG_CODE_NM"));
					String jtCodeNm = String.valueOf(vo.get("JT_CODE_NM"));
					String joSalTypeNm = String.valueOf(vo.get("JO_SAL_TYPE_NM"));
					
			%>
			
					
						{	
							"rnum" : "<%=rnum%>",
							"comNm" : "<%=comNm%>",
							"comIntro" : "<%=comIntro%>",
							"joTitle" : "<%=joTitle%>",
							"joSdate" : "<%=joSdate%>",
							"joEdate" : "<%=joEdate%>",
							"jgCodeNm" : "<%=jgCodeNm%>",
							"jtCodeNm" : "<%=jtCodeNm%>",
							"joSalTypeNm" : "<%=joSalTypeNm%>"
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