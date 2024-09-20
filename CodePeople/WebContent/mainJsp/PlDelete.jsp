<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.progLang.service.ProgLangServiceImpl"%>
<%@page import="kr.or.ddit.progLang.service.IProgLangService"%>
<%@page import="kr.or.ddit.progLang.vo.PLHRVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

MemberVO loginMember = session.getAttribute("memVO") == null?
        null : (MemberVO)session.getAttribute("memVO");


int hrNo = Integer.parseInt(request.getParameter("hrNo"));
int plCodeNo = Integer.parseInt(request.getParameter("plCodeNo"));




PLHRVO plhrvo = new PLHRVO();
plhrvo.setHrNo(hrNo);
plhrvo.setPlCodeNo(plCodeNo);
 IProgLangService service = ProgLangServiceImpl.getInstance();
 
 int cnt = service.deletePl(plhrvo);
 
 if (cnt > 0){
%>
<script type="text/javascript">
alert("요청 완료");
location.href="/CodePeople/HRMyInfo.do"
</script>
<%
 }else{
%>
<script type="text/javascript">
alert("요청 실패");
location.href="/CodePeople/HRMyInfo.do"
</script>
<%
 }
%>





</body>
</html>