<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
int result = (int)(request.getAttribute("result"));
 %>   
    

<%
if (result>0){
%>
{"result" : "��û �Ϸ�"}
<%	
}else if(result==0){	
%>
{"result" : "��û ����"}

<% 	
}else if(result==-2){
%>	
{"result" : "�̹� ���� ��� �ϼ̽��ϴ�."}
<% 	
}else if(result ==-3){
%>	
{"result" : "���� ��� ����� �����ϴ�."}	
<% 	
}else{
%>
{"result" : "�ش� ������ �����ϴ�."}
<% 
}
%>

