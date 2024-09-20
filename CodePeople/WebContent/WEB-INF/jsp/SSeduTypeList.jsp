<%@page import="kr.or.ddit.edu.vo.EduCodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	List<EduCodeVO> list = (List<EduCodeVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		EduCodeVO vo = list.get(i);
		Integer eduCodeNo = vo.getEduCodeNo();
		String eduCodeNm = vo.getEduCodeNm();
%>

		
			{	
				"eduCodeNo" : "<%=eduCodeNo%>",
"eduCodeNm" : "<%=eduCodeNm%>"
			}

		
<%		
		
	}
%>

]


