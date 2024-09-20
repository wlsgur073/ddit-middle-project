<%@page import="kr.or.ddit.certification.vo.CertificationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<CertificationVO> list = (List<CertificationVO>) request.getAttribute("list");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
			CertificationVO vo = list.get(i);
			Integer certCodeNo = vo.getCertCodeNo();
			String certCodeNm = vo.getCertCodeNm();
%>

		
			{	
				"certCodeNo" : "<%=certCodeNo%>",
				"certCodeNm" : "<%=certCodeNm%>"
			}

		
<%		
		
	}
%>

]