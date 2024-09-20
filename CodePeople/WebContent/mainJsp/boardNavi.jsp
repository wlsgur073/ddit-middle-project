<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int result = (int)request.getAttribute("result");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<%
	if(result == 10){
%>
<script type="text/javascript">
	alert('요청 완료');
	location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1";
</script>	
	
<%
	}else if(result == 20){
%>
<script type="text/javascript">
	alert('요청 완료');
	location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=2";
</script>
<%
	}else if(result == 30){
%>
<script type="text/javascript">
	alert('요청 완료');
	location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=3";
</script>
<%
	}else if(result == 40){
%>
<script type="text/javascript">
	alert('요청 완료');
	location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=4";
</script>
<%
	}else if(result == 50){
%>
<script type="text/javascript">
	alert('요청 완료');
	location.href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=5";
</script>
<%
	}
%>




</body>

</html>