<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
int result = (int)(request.getAttribute("result"));
 %>   
    

<%
if (result>0){
%>
{"result" : "��� ���� "}
<%	
}else if(result==0){	
%>
{"result" : "�̹� ��ϵ� �ڰ����� �Դϴ�."}

<% 	
}
%>	
