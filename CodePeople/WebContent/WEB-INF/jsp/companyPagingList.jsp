<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CompanyVO> list = (List<CompanyVO>) request.getAttribute("companyPagingList");
%>

[
	
<%
	for(int i = 0; i < list.size(); i++){
		if(i > 0){
			out.print(",");
		}
		CompanyVO vo = list.get(i);
		
		Integer provCodeNo = vo.getProvCodeNo();
		Integer cityCodeNo = vo.getCityCodeNo();
		String comIntro = vo.getComIntro();
		String comDetail = vo.getComDetail();
		Integer comNo = vo.getComNo();
		Integer memNo = vo.getMemNo();
		Integer jgCodeNo = vo.getJgCodeNo();
		String comNm = vo.getComNm();
		String comDate = vo.getComDate();
		Integer comCnt = vo.getComCnt();
		String comHpg = vo.getComHpg();
		Integer comFav = vo.getComFav();
		Integer comSal = vo.getComSal();
%>

		
			{	
				"provCodeNo" : "<%=provCodeNo%>",
				"cityCodeNo" : "<%=cityCodeNo%>",
				"comIntro" : "<%=comIntro%>",
				"comDetail" : "<%=comDetail%>",
				"comNo" : "<%=comNo%>",
				"memNo" : "<%=memNo%>",
				"jgCodeNo" : "<%=jgCodeNo%>",
				"comNm" : "<%=comNm%>",
				"comDate" : "<%=comDate%>",
				"comCnt" : "<%=comCnt%>",
				"comHpg" : "<%=comHpg%>",
				"comFav" : "<%=comFav%>",
				"comSal" : "<%=comSal%>"
			}

		
<%		
		
	}
%>

]