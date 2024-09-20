
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.certification.service.CertServiceImpl"%>
<%@page import="kr.or.ddit.certification.service.ICertService"%>
<%@page import="kr.or.ddit.certification.vo.CertHRVO"%>
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
int certCodeNo = Integer.parseInt(request.getParameter("certCodeNo"));




CertHRVO certhrvo = new CertHRVO();
certhrvo.setHrNo(hrNo);
certhrvo.setCertCodeNo(certCodeNo);
ICertService service = CertServiceImpl.getInstance();

 int cnt = service.deleteCert(certhrvo);
 
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