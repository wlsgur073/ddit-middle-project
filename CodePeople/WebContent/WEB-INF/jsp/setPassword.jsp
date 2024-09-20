<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String) request.getAttribute("memId");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>코드피플 - 비밀번호 재설정</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="/CodePeople/css/serch.css">
	<style>
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
    #content *{
      background: rgb(252, 252, 252);
    }
    #errorSpan, #errorSpan2 {
      display: block;
      margin: 9px 0 -2px;
      font-size: 12px;
      line-height: 14px;
      color: red;
    }
    #okSpan {
      display: block;
      margin: 9px 0 -2px;
      font-size: 12px;
      line-height: 14px;
      color: #08a600;
    }
    .modal-footer{
    padding: 8px;
    }
	</style>
	<script>
		$(function () {
      let passReg = /^[A-Za-z0-9]{6,12}$/;
      
      $("#pass_form").modal("show");
      
      $('#pass').on('keyup', function () {
				passVal = $('#pass').val();

        if (!(passReg.test(passVal))) {
          $("#errorSpan").show();
        } else {
          $("#errorSpan").hide();
        }

        if(passVal == "") $("#errorSpan").hide();
			});

			$("#pass2").on("keyup", function () {
				pass2Val = $(this).val();


				if (pass2Val != passVal) {
					$("#errorSpan2").show();
					$("#okSpan").hide();
				} else {
					$("#errorSpan2").hide();
					$("#okSpan").show();
				}

				if (pass2Val == "") {
					$("#errorSpan2").hide();
					$("#okSpan").hide();
				}


        if(passVal != pass2Val || !(passReg.test(passVal))){
          $("#setPassword").attr("disabled", true);
        } else {
          $("#setPassword").attr("disabled", false);
        }
	});


        $('#setPassword').on('click', function () {
          let memOrignlPw = $('#pass').val();
          let memId = "<%=memId%>";
          $.ajax({
            url: "/CodePeople/SetPassword.do",
            type: "post",
            data: {
              "memOrignlPw" : memOrignlPw,
              "memId" : memId
            },
            dataType: "json",
            success: function (resp) {
              if(resp.flag == "true"){
                alert(resp.result);
                location.href="/CodePeople/rehearsal/home.html";
              } else {
                alert(resp.error);
              }
            },
            error: function (xhr) {
              alert("비밀번호 재설정 버튼 클릭시 에러 상태 : " + xhr.status);
            },
          });
        });

		});
	</script>
</head>

<body>
	
      <div class="modal fade" id="pass_form" tabindex="-1" aria-labelledby="searchPassLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              <p class="modal-title" id="searchPassLabel">비밀번호 재설정</p>
            </div>
            <div class="modal-body">
              <div class="request">
                <div class="basic header">
                  <p>비밀번호를 재설정합니다. <br>
                    비밀번호는 숫자와 영문 포함 형태의 6~12자리 이내로 이루어져야 합니다.</p>
                </div>
                <div class="mb-2">
                  <label for="pass" class="form-label">비밀번호</label>
                  <input type="password" id="pass" name="memOrignlPw" class="form-control" value="" />
                  <span id="errorSpan" style="display: none;" aria-live="assertive">비밀번호는 숫자와 영문 포함 형태의 6~12자리 이내로 이루어져야 합니다.</span>
                </div>
                <div>
                  <label for="pass2" class="form-label">비밀번호 재확인</label>
                  <input type="password" id="pass2" class="form-control" value="" />
                  <span id="errorSpan2" style="display: none;" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
                  <span id="okSpan" style="display: none;" aria-live="assertive" class="mb-3">비밀번호가 일치합니다!</span>
                </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='/CodePeople/rehearsal/home.html'">취소</button>
                  <button type="button" class="btn btn-primary" id="setPassword" disabled>찾기</button>
                </div>
                </div>
          </div>
        </div>
      </div>


	


</body>

</html>