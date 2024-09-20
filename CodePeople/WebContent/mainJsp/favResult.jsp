<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
int result = (int)(request.getAttribute("result"));
 %>   
    

<%
if (result>0){
%>
{"result" : "요청 완료"}
<%	
}else if(result==0){	
%>
{"result" : "요청 실패"}

<% 	
}else if(result==-2){
%>	
{"result" : "이미 관심 등록 하셨습니다."}
<% 	
}else if(result ==-3){
%>	
{"result" : "관심 등록 기록이 없습니다."}	
<% 	
}else{
%>
{"result" : "해당 권한이 없습니다."}
<% 
}
%>

