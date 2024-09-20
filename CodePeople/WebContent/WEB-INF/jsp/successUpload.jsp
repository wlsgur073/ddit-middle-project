<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 @font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
		.my-box-item p {
			padding: 0px 14px;
			font-size: 0.8em;
			color: darkgray;
		}
    body{
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-image: url("/CodePeople/images/home.jpg");
      background-repeat: no-repeat;
    }
</style>
</head>
<body>
<div class="modal fade" id="pass_form" tabindex="-1" aria-labelledby="searchPassLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              <p class="modal-title" id="searchPassLabel">업로드가 성공적으로 전송되었습니다!</p>
            </div>
           
          </div>
        </div>
      </div>
</body>
</html>