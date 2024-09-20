<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    	int result = request.getAttribute("result") == null? 
    			0 : (Integer)request.getAttribute("result");
    	int memNo = request.getAttribute("memNo") == null?
    			0 : (Integer)request.getAttribute("memNo");
    	int hrNo = request.getAttribute("hrNo") == null?
    			0 : (Integer)request.getAttribute("hrNo");
    	int comNo = request.getAttribute("comNo") == null?
    			0 : (Integer)request.getAttribute("comNo");
    		System.out.print("js의 " + result);
    		if(result == 0){
   
    //비회원인 경우
    %>
			{
			  "memCode" : "0",
			  "memNo" : "0",
			  "hrNo" : "0",
			  "comNo" : "0"
			}		
	<%
    		}else if(result == 1){
	//개인회원인 경우
	%>
			{ 
			  "memCode" : "1",
			  "memNo" : "<%=memNo %>",
			  "hrNo" : "<%=hrNo %>",
			  "comNo" : "0"
			 }
	<%
    		}else if(result == 2){
	// 기업을 등록한 기업회원인 경우   		
	%>
			{ 
			  "memCode" : "2",
			  "memNo" : "<%=memNo %>",
			  "hrNo" : "0",
			  "comNo" : "<%=comNo %>"
			 }
	<% 
			}else if(result == 3){
	//기업을 등록하지 않은 기업회원인 경우
	%>
			{ 
			  "memCode" : "2",
			  "memNo" : "<%=memNo %>",
			  "hrNo" : "0",
			  "comNo" : "0"
			}
	<%
			}
	%>