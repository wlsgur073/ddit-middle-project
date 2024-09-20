<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int res = (Integer) request.getAttribute("res");
	
	if(res > 0){
%>
{
	"flag" : "true"
}

<% } else { %>
{
	"flag" : "false",
	"error" : "sql문 joinMember의 반환값이 0입니다."
}
<%
	}
%>