<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
int result = (int)(request.getAttribute("result"));
 %>   
    

<%
if (result>0){
%>
{"result" : "등록 성공 "}
<%	
}else if(result==0){	
%>
{"result" : "이미 등록된 자격정보 입니다."}

<% 	
}
%>	
