<%@page import="kr.or.ddit.prov.vo.CityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CityVO> list = (List<CityVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		CityVO vo = list.get(i);
		Integer cityCodeNo = vo.getCityCodeNo();
		String cityCodeNm = vo.getCityCodeNm();
%>

		
			{	
				"cityCodeNo" : "<%=cityCodeNo%>",
				"cityCodeNm" : "<%=cityCodeNm%>"
			}

		
<%		
		
	}
%>

]