<%@page import="kr.or.ddit.cmm.vo.BoardPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
     List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("boardPagingList");

	 BoardPagingVO pagingVO = (BoardPagingVO) request.getAttribute("boardPagingVO");
%>
{
	"boInfo" :		
			[
			
				<%
					for(int i=0; i<list.size(); i++){
						if(i>0) out.print(",");
						
						Map<String, Object> vo = list.get(i);
						
						String boardNo = String.valueOf(vo.get("BOARD_NO"));
						String boardCodeNo = String.valueOf(vo.get("BOARD_CODE_NO"));
						String boardTitle = String.valueOf(vo.get("BOARD_TITLE"));
						String boardHit = String.valueOf(vo.get("BOARD_HIT"));
						String boardLike = String.valueOf(vo.get("BOARD_LIKE"));
						String boardRepl = String.valueOf(vo.get("BOARD_REPL"));
						String boardCont = String.valueOf(vo.get("BOARD_CONT"));
						String boardDate = String.valueOf(vo.get("BOARD_DATE"));
						String memId = String.valueOf(vo.get("MEM_ID"));
				%>
						{
							"boardNo" : "<%=boardNo%>",
							"boardCodeNo" : "<%=boardCodeNo%>",
							"boardTitle" : "<%=boardTitle%>",
							"boardHit" : "<%=boardHit%>",
							"boardLike" : "<%=boardLike%>",
							"boardRepl" : "<%=boardRepl%>",
							"boardCont" : "<%=boardCont%>",
							"boardDate" : "<%=boardDate%>",
							"memId" : "<%=memId%>"
			
			
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

