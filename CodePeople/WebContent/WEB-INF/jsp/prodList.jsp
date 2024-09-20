<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.vo.prodVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
     List<prodVO> list = (List<prodVO>) request.getAttribute("prodList");
     
%>



	<%
		for(int i=0; i<list.size(); i++){
			if(i>0){ 
				out.print(",");
			}
			prodVO vo = list.get(i);
			
			Integer prodNo = vo.getProdNo();
			String prodNm = vo.getProdNm();
			Integer prodPrice = vo.getProdPrice();
			Integer prodPeriod = vo.getProdPeriod();
			Integer prodType = vo.getProdType();
					
	%>
{


"prodNo" : "<%=prodNo%>",
"prodNm" : "<%=prodNm%>",
"prodPrice" : "<%=prodPrice%>",
"prodPeriod" : "<%=prodPeriod%>",
"prodType" : "<%=prodType%>"

 
}

<%
		}

%>

