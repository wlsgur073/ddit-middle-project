<%@page import="kr.or.ddit.jobTitle.vo.JobTitleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<JobTitleVO> list = (List<JobTitleVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		JobTitleVO vo = list.get(i);
		Integer jtCodeNo = vo.getJtCodeNo();
		String jtCodeNm = vo.getJtCodeNm();
		Integer jgCodeNo = vo.getJgCodeNo();
%>

		
			{	
				"jtCodeNo" : "<%=jtCodeNo%>",
				"jtCodeNm" : "<%=jtCodeNm%>",
				"jgCodeNo" : "<%=jgCodeNo%>"
			}

		
<%		
		
	}
%>

]


    