<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
     List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("boardList");
%>

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
			
			if(boardLike.equals("0")){
				boardLike = "좋아요";
			}
			if(boardRepl.equals("0")){
				boardRepl = "댓글";
			}
			
	%>
{
			"boardNo" 	 	 : "<%=boardNo %>",
			"boardCodeNo" 	 : "<%=boardCodeNo %>",
			"boardTitle" 	 : "<%=boardTitle %>",
			"boardHit"   	 : "<%=boardHit %>",
			"boardLike" 	 : "<%=boardLike %>",
			"boardRepl"  	 : "<%=boardRepl %>",
			"boardCont"  	 : "<%=boardCont %>",
			"boardDate" 	 : "<%=boardDate %>",
			"memId"      	 : "<%=memId %>"


}

<%
		}

%>
]
