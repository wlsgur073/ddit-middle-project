<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("replyList");
    
    %>
    
    [
    
		<%
    	for(int i = 0; i<list.size(); i++){
			if(i>0) out.print(",");    		
		
			Map<String, Object> vo = list.get(i);
			
			String repNo = String.valueOf(vo.get("repNo"));
			String boardNo = String.valueOf(vo.get("boardNo"));
			String repLike = String.valueOf(vo.get("repLike"));
			String repCont = String.valueOf(vo.get("repCont"));
			String repDate = String.valueOf(vo.get("repDate"));
			String repRept = String.valueOf(vo.get("repRept"));
			String memId = String.valueOf(vo.get("memId"));
			System.out.println(repNo);
			
			if(repLike.equals("0")){
				repLike = "좋아요";
			}
			if(repRept.equals("0")){
				repRept = "신고";
			}
			
			
		%> 
		{   
			"repNo" 	 : "<%=repNo %>",
			"boardNo" 	 : "<%=boardNo %>",
			"repLike" 	 : "<%=repLike %>",
			"repCont" 	 : "<%=repCont %>",
			"repDate" 	 : "<%=repDate %>",
			"repRept" 	 : "<%=repRept %>",
			"memId" 	 : "<%=memId %>"

		}
		<%
		
    	}
		
		%>    
    
    
    ]
    
    
    
    
