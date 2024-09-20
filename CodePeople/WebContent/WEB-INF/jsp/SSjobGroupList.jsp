<%@page import="kr.or.ddit.jobGroup.vo.JobGroupVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<JobGroupVO> list = (List<JobGroupVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		JobGroupVO vo = list.get(i);
		Integer jgCodeNo = vo.getJgCodeNo();
		String jgCodeNm = vo.getJgCodeNm();
%>

		
			{	
				"jgCodeNo" : "<%=jgCodeNo%>",
				"jgCodeNm" : "<%=jgCodeNm%>"
			}

		
<%		
		
	}
%>

]


