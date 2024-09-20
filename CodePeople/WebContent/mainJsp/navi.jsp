<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.hr.vo.HRMyInfoVO"%>
<%@page import="kr.or.ddit.hr.service.HRServiceImpl"%>
<%@page import="kr.or.ddit.hr.service.IHRService"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<% 


MemberVO loginMember = session.getAttribute("memVO") == null?
            null : (MemberVO)session.getAttribute("memVO");
String hrName ="";

     int memCode = loginMember.getMemCode();
     
     System.out.println(memCode);
     if(memCode == 1) {
     IMemberService memberService = MemberServiceImpl.getInstance();
        int memNo = loginMember.getMemNo();
       
        IHRService hrService = HRServiceImpl.getInstance();
        int hrNo = hrService.getHrNo(memNo);

        
        int checkNew = hrService.checkNew(memNo);
        
        if(checkNew == 0){
        	
        }else{
        
         HRMyInfoVO myInfoVO =  hrService.selectMyInfo(memNo);
         hrName = myInfoVO.getMemNm();    
        }
       }
     System.out.println(hrName);  
           
     
	



int result =  (int)request.getAttribute("result");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(result==-1){
%>
<script type="text/javascript">
alert('해당 권한이 없습니다.');
location.href="/CodePeople/mainJsp/mainHR.jsp";
</script>
<%		
}else if(result==1){
%>	
<script type="text/javascript">
alert('내 인재 정보 등록');
location.href="/CodePeople/rehearsal/addHrForm.html"
</script>
<%	
}else if(result==2){
%>	
<script type="text/javascript">
alert('이미 등록된 정보가 있어, 인재정보 관리로 이동합니다.');
location.href="/CodePeople/HRMyInfo.do"
</script>	
<%	
}else if(result==3){
%>
<script type="text/javascript">
alert('환영합니다 ! 유능한 인재는 찾으셨나요? \n프리미엄 서비스를 통해 더 큰 혜택을 누리세요 ! ');
location.href="/CodePeople/mainJsp/myPageCompany.jsp"
</script>
<%	
}else if(result==4){
%>
<script type="text/javascript">
	alert('환영합니다 ! <%=hrName%>님 :)');
	location.href="/CodePeople/mainJsp/myPagePerson.jsp"
</script>
<% 
}else if(result==5){
%>
<script type="text/javascript">
alert('관리자 페이지 입니다 ^^ 오늘도 루팡 ~ ');
location.href="/CodePeople/mainJsp/myPageAdmin.jsp"
</script>

<%		
}
%>








</body>
</html>