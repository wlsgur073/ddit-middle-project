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
	<title>회원탈퇴</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/CodePeople/css/main.css">
	<link rel="stylesheet" href="/CodePeople/css/memInfo.css">
	<link rel="stylesheet" href="/CodePeople/css/serch.css">

	<script src="/CodePeople/js/join.js"></script>
	<script>
		$(function () {
			let passVal = "";

			$(".list-group .memInfo").click(function (e) {
				let submenu = $(this).next("ul");

				if (submenu.is(":visible")) {
					submenu.slideUp();
				} else {
					submenu.slideDown();
				}
			});

			$('#pass').on('keyup', function () {
				passVal = $('#pass').val();
			});

			$("#pass2").on("keyup", function () {
				pass2Val = $(this).val();


				if (pass2Val != passVal) {
					$("#pswd2Msg").show();
					$("#pswd2Msg-green").hide();
				} else {
					$("#pswd2Msg").hide();
					$("#pswd2Msg-green").show();
				}

				if (pass2Val == "") {
					$("#pswd2Msg").hide();
					$("#pswd2Msg-green").hide();
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
						<input class="" type="text"
							style="height:19px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"
							placeholder="통합검색">
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
						<li class="list-group-item"> <a class="nav-link" href="#fav-company">관심기업</a></li>
						<li class="list-group-item"><a class="nav-link" href="#fav-jo">관심공고</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">유료서비스</a></li>
						<li class="list-group-item"><a class="nav-link memInfo">회원정보</a>
							<ul class="infoList">
								<li class="list-group-item"><a class="nav-link" href="/CodePeople/html/memUpdate.jsp">회원정보수정</a>
								</li>
								<li class="list-group-item"><a class="nav-link" href="/CodePeople/html/memDelete.jsp">회원탈퇴</a></li>
								<li class="list-group-item"><a class="nav-link" href="./memCertification.html">재직증명신청</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<!-- 바디 콘텐츠 -->
			<div id="content">
				<!-- 마이페이지 -->
				<!-- 회원탈퇴 -->
				<div id="cv" class="content-box search-result jo my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">회원탈퇴</h1><br>
						</div>
						<p>지금 탈퇴하면 다시는 저희 사이트에 접속할 수 없습니다. 새로운 회원가입도 불가능합니다.<br>
							저희 사장님이 저를 짤라버릴지도 모릅니다. 이 점 유의하시고 회원탈퇴를 진행하시길 부탁드립니다.</p>
					</div>

					<!-- 검색결과 카드 -->
					<div class="card card-cv" style="padding: 0px;">
						<!-- 비밀번호 확인 -->
						<div class="card-body card-right">
							<div class="mb-3 mt-3">
								<label>비밀번호</label> <br>
								<input type="password" class="form-control" id="pass" name="memOrignlPw" required>
							</div>
							<div class="mb-3 mt-3">
								<label>비밀번호 재확인</label> <br>
								<input type="password" class="form-control" id="pass2" name="pass2" required>
								<span class="error_next_box" id="pswd2Msg" style="display:none;" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
        				<span class="error_next_box green" id="pswd2Msg-green" style="display:none" aria-live="assertive">비밀번호가 일치합니다!</span>
							</div>
							<button type="button" class="btn btn-outline-primary" id="deleteBtn1"><a href="#deleteBtn" data-bs-toggle="modal" data-bs-target="#deleteBtn">탈퇴하기</a></button>

							<div class="modal fade" id="deleteBtn" tabindex="-1" aria-labelledby="searchIdLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											<p class="modal-title" id="searchIdLabel">회원탈퇴</p>
										</div>
										<div class="modal-body">
											<div class="request">
												<div class="basic header">
													<small>
														<p style="font-weight: lighter;">
															<img src="/CodePeople/images/please.jpg" alt="" style="float: right;">
															정말로 사장님이 저 짜를지도 몰라요.. <br>
															저 내일 당장에 서울역 앞에서 벌벌 떨면서 자고 있을지도 몰라요 ㅠㅠ <br>
															다시 한번만 더 고민해보세요. <br>
															제 매일 야근해요. 회원님을 위해서 항상 열심히 일하고 있습니다. <br>
															정말 나가고 싶다면.. <br>
															아래 글과 똑같이 작성하고 회원 탈퇴 버튼 누르면 됩니다.. <br>
														</p>
													</small>
												</div>
												<div class="mb-2">
													<label for="doubleCheck" id="doubleCheck1" class="form-label" data-value="나는 못생겼다!">"나는 못생겼다!"</label>
													<input type="text" id="doubleCheck2" class="form-control" value="" />
												</div>
											</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
													<button type="button" class="btn btn-primary" id="deleteMember" data-value="<%=vo.getMemId()%>">회원탈퇴</button>
												</div>
												</div>
									</div>
								</div>
							</div>

						</div>
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