<%@page import="kr.or.ddit.prov.vo.ProvVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProvVO> list = (List<ProvVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		ProvVO vo = list.get(i);
		Integer provCodeNo = vo.getProvCodeNo();
		Integer cityCodeNo = vo.getCityCodeNo();
		String provCodeNm = vo.getProvCodeNm();
%>

		
			{	
				"provCodeNo" : "<%=provCodeNo%>",
				"cityCodeNo" : "<%=cityCodeNo%>",
				"provCodeNm" : "<%=provCodeNm%>"
			}

		
<%		
		
	}
%>

]