<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    	int result = (Integer)request.getAttribute("result");
    		System.out.print("js의 " + result);
    		if(result > 0){
   
    %>
		{"flag" : "success",
		"memCode" : "1"}		

	<%
    		}else if(result == -1){
    		
	%>
			{"flag" : "fail",
			 "memCode" : "0"}
	<%
    		}else{
	%>    		
			{"flag" : "fail",
			"memCode" : "1"}
	<% }%>