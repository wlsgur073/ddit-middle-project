<%@page import="kr.or.ddit.progLang.vo.ProgLangVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProgLangVO> progList = (List<ProgLangVO>) request.getAttribute("progList");

%>

[
	
<%
	for(int i = 0; i < progList.size(); i++){
		if(i > 0){
			out.print(",");
		}
		ProgLangVO vo = progList.get(i);
		Integer plCodeNo = vo.getPlCodeNo();
		String plCodeNm = vo.getPlCodeNm();
%>

		
			{	
				"plCodeNo" : "<%=plCodeNo%>",
				"plCodeNm" : "<%=plCodeNm%>"
			}

		
<%		
		
	}
%>

]


    