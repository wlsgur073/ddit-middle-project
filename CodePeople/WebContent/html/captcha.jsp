<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> <html> <head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>reCAPTCHA 테스트</title>
 <script src='https://www.google.com/recaptcha/api.js'>
 </script>
  <script type="text/javascript"> 
  /* 서브밋 전에 리캡챠 체크 여부 를 확인합니다. */ 
  function FormSubmit() { 
	  if (grecaptcha.getResponse() == ""){ 
		  alert("리캡챠를 체크해야 합니다."); 
		  return false; 
		  } else { return true; } 
	  } 
  </script> 
  </head> 
  <body> 
  <br/> 
  <form name="testForm" method="post" action="" onsubmit="return FormSubmit();">
   이름 : <input type="text" name="name" /><br />
    전화번호 : <input type="text" name="tel" /><br />
     <input type="submit" name="submit" value="제출">
     <br />
     <br/> 
     <div class="g-recaptcha" data-sitekey="6LdMUdwcAAAAAGOxxD9DJc2VAA3DiQJWPImbZYgb">
     </div> 
     </form> 
     </body> 
     </html>