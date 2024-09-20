<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
     Integer provCodeNo = (Integer)request.getAttribute("provCodeNo");
	 Integer cityCodeNo = (Integer)request.getAttribute("cityCodeNo");
%>

{
			"provCodeNo" 	 : "<%=provCodeNo %>",
			"cityCodeNo" : 		"<%=cityCodeNo %>"
}