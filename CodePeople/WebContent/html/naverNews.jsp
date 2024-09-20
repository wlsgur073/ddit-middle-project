<%-- 	var json = <%= sb.toString() %>
	if(json.items == null){
		var flag = flase;
	} else {
		var flag = true;
		var items = json.items;
		var news = [];
	<% for(int i = 0; i > 3; i++){ %>
		news[i] = items.pop();
		var title = news.title;
		var link = news.link;
		var date = news.date;
	<% } %>
		console.log(link);
		$('#newsLink').attr('href',link);
		$('#newsTitle').attr('href',title);
		$('#newsDate').attr('href',date);
	}
	
	
	 --%>
	
	

<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@page 
import="java.io.BufferedReader" 
import= "java.io.InputStreamReader" 
import= "java.net.HttpURLConnection" 
import= "java.net.URL" 
import= "java.net.URLEncoder" 
%>
<%! StringBuffer sb; 
BufferedReader br;%>
<%
String clientId = "W4evpc4AcMh_0HsM7eU1";// 애플리케이션 클라이언트 아이디값"; 
String clientSecret = "pZoEohhS7O";// 애플리케이션 클라이언트 시크릿값";\ 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head> 
<body> 
<% 
int display = 3; // 검색결과갯수. 최대100개 
try { 
	String text = URLEncoder.encode("삼성전자", "UTF-8"); 
	String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text+"&display="+display; 
	URL url = new URL(apiURL); 
	HttpURLConnection con = (HttpURLConnection) url.openConnection();

	con.setRequestMethod("GET"); 
	con.setRequestProperty("X-Naver-Client-Id", clientId); 
	con.setRequestProperty("X-Naver-Client-Secret", clientSecret); 
	int responseCode = con.getResponseCode(); 
	BufferedReader br; 
	if (responseCode == 200) { 
		br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8")); 
		} else { 
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8")); 
			} 
	sb = new StringBuffer(); 
	String line; 
	while ((line = br.readLine()) != null) { 
			sb.append(line + "\n");; 
			} 
	br.close(); 
	con.disconnect();
} catch (Exception e) { 
	System.out.println(e);
} 
%> 

<script>

var json = <%= sb.toString() %>;
console.log(json);

</script>
</body> 
</html>