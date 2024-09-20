<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) session.getAttribute("memVO");
	int num = (int) request.getAttribute("num");
	if(num > 0){
		
%>
	{
		"flag" : "ok"
	}
<% } else {%>
{
	"flag" : "no",
	"error" : "잘못 입력하셨거나, 존재하지 않는 계정입니다."
}
<%
	}
%>