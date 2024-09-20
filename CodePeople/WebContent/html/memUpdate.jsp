<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	int memCode = 0; // 비회원
	String myPage = "";
	
	if(vo.getMemCode() == 1){				// 개인회원
		memCode = vo.getMemCode();
		myPage = "/CodePeople/html/myPagePerson.html";
	} else if (vo.getMemCode() == 2){		// 기업회원
		memCode = vo.getMemCode();
		myPage = "/CodePeople/html/myPageCompany.html";
	} else if(vo.getMemCode() == 3){		// 관리자
		memCode = vo.getMemCode();
		myPage = "/CodePeople/html/myPageAdmin.html";
	}

%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>회원정보 수정</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/CodePeople/js/jquery-3.6.0.min.js"></script>
  <script src="/CodePeople/js/jquery.serializejson.min.js"></script>
  
  <link rel="stylesheet" href="/CodePeople/css/main.css">
	<link rel="stylesheet" href="/CodePeople/css/memInfo.css">

  <script src="/CodePeople/js/join.js"></script>
  
  <style>
    .zipInput{
      display: flex;
    }
  .form-control.zip{
    width: 50%;
    margin: 0px;
    margin-right: 10px;
  }
  </style>
	<script>
	$(function () {
	  $(".list-group .memInfo").click(function (e) {
		    let submenu = $(this).next("ul");

		    if (submenu.is(":visible")) {
		      submenu.slideUp();
		    } else {
		      submenu.slideDown();
		    }
		  });
	});
	</script>
</head>

<body>
	<!-- 헤더 -->
	<div id="header">
		<!-- 헤더 메인 메뉴 바 -->
		<div id="header-container">
			<!-- 좌측 메뉴 -->
			<div id="header-left-menu">
				<!-- 로고 -->
				<a href="" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
				<div class="divider"></div>
				<!-- 통합 검색창 -->
				<div id="search-box">
					<div id="search-item">
						<i class="fas fa-search item" style="width:15.3px; height:19px;"> </i>
						<input class="" type="text" style="height:19px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" placeholder="통합검색">
					</div>
				</div>
			</div>
			<!-- 우측 메뉴 -->
			<div id="header-right-menu">
				<!-- 메인 메뉴 링크 -->
				<div id="header-link-box">
					<a class="header-link" href="/CodePeople/rehearsal/mainHr.html">인재</a>
					<a class="header-link" href="/CodePeople/rehearsal/company.html">기업</a>
					<a class="header-link" href="/CodePeople/rehearsal/mainJo.html">채용</a>
					<a class="header-link" href="/CodePeople/rehearsal/mainBoard.html">커뮤니티</a>
					<a class="header-link" href="<%=myPage%>">마이페이지</a>
					</div>
				<div class="divider"></div>
				<!-- 로그인버튼 -->
				<a href="/CodePeople/html/home.html"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
			</div>
		</div>
	</div>
	<!-- 바디 -->
	<div id="body">

		<div id="body-container">
			<!-- 마이페이지 좌측 메뉴바 -->
			<div class="nav-left-bar nav-my">
				<div class="nav-sticky">
					<ul class="list-group">
						<li class="list-group-item "><a class="nav-link" href="#cv">이력서</a></li>
						<li class="list-group-item"><a class="nav-link"	href="#fav-company">관심기업</a></li>
						<li class="list-group-item"><a class="nav-link"	href="#fav-jo">관심공고</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">유료서비스</a></li>
						<li class="list-group-item"><a class="nav-link memInfo">회원정보</a>
							<ul class="infoList">
								<li class="list-group-item"><a class="nav-link"
									href="/CodePeople/html/memUpdate.jsp">회원정보수정</a></li>
								<li class="list-group-item"><a class="nav-link"
									href="/CodePeople/html/memDelete.jsp">회원탈퇴</a></li>
								<li class="list-group-item"><a class="nav-link"
									href="/CodePeople/html/memCertification.html">재직증명신청</a></li>
							</ul></li>
					</ul>
				</div>
			</div>

			<!-- 바디 콘텐츠 -->
			<div id="content">
				<!-- 마이페이지 -->
				<!-- 회원정보 수정 -->
				<div id="cv" class="content-box search-result jo my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">회원정보 수정</h1>
							<br>
						</div>
						<p>수정할 내용을 아래 기재란에 입력해 주세요.</p>
					</div>

					<div class="card card-cv" style="padding: 0px;">

						<form class="card-body card-right" id="memberUpdateForm">
							<div class="mb-3 mt-3">
								<label>아이디</label> <br>
								 <input type="text" class="form-control" id="memId" name="memId" placeholder="<%=vo.getMemId() %>" value="<%=vo.getMemId() %>" readonly>
							</div>

							<div class="mb-3 mt-3">
								<label>비밀번호</label> <br> 
								<label class="la2" for="memPw">
									*&nbsp;비밀번호는 8~16자로 영문 대 소문자, 숫자, 특수문자로 이루어져야 합니다.
									 </label>
									 <input type="password" class="form-control" id="pass" name="memOrignlPw" required>
									 <span class="error_next_box green" id="pswd1Msg-green" style="display: none" aria-live="assertive">
									  나쁘지않네요.
									   </span>
									 <span class="error_next_box" id="pswd1Msg" style="display: none;" aria-live="assertive"> 
									 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
								</span>
							</div>

							<div class="mb-3 mt-3">
								<label>비밀번호 재확인</label> <br>
								 <input type="password" class="form-control" id="pass2" required>
								  <span class="error_next_box" id="pswd2Msg" style="display: none;" aria-live="assertive">
								  비밀번호가 일치하지 않습니다.
								  </span>
								  <span class="error_next_box green" id="pswd2Msg-green" style="display: none" aria-live="assertive">
								  비밀번호가 일치합니다!
								</span>
							</div>

							<div class="mb-3">
								<label>전화번호</label>
								<input type="tel" class="form-control" id="tel" name="memTel" required>
								<span class="error_next_box" id="telMsg" style="display: none;" aria-live="assertive">
								휴대폰 번호를 다시 확인해 주세요.
								</span>
							</div>

							<div class="mb-3 mt-3">
								<label>이메일 주소</label> <br>
								<input type="email" class="form-control" id="email" name="memEmail" required>
								<span class="error_next_box" id="emailMsg" style="display:none;" aria-live="assertive">이메일 주소를 다시 확인해 주세요.</span>
							</div>

							<div class="mb-3 mt-3">
								<label>생년월일</label> <br>
								<input type="date" class="form-control" id="memBir" name="memBir" required>
							</div>

							<div class="mb-3 zip">
								<label>우편번호</label>
								<div class="zipInput">
									<input type="text" class="form-control zip" id="postCode" readonly>
									<input type="button" onclick="proc();" value="우편번호 검색" />
								</div>

							</div>
							<div class="mb-3">
								<label>주소1</label>
								<input type="text" class="form-control" id=roadAddress readonly>
							</div>

							<div class="mb-3">
								<label>주소2</label>
								<input type="text" class="form-control" id="detailAddress">
							</div>

							<div class="mb-3">
								<input type="hidden" class="form-control" id=cityCodeNo name="cityCodeNo">
							</div>
							<div class="mb-3">
								<input type="hidden" class="form-control" id="provCodeNo" name="provCodeNo">
							</div>

							<input type="hidden" class="form-control" id="memCode" name="memCode" value="<%=vo.getMemCode() %>" readonly>

							<button type="button" class="btn btn-outline-primary" id="memberUpdateBtn">수정하기</button>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	</div>

	<!--  풋터-->
	<div id="footer">
		<div id="footer-container"></div>
	</div>


</body>

</html>