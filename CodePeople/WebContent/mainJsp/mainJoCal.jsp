<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.jobOpening.vo.JOCardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int memCode = 0;
	int memNo = 0;
	int hrNo = 0;
	int cnt = 0;
	int comNo = 0;
	MemberVO loginMember = null;
	CompanyVO cv = null;
	if(SessionCheck.isLoginMember(session)){
		
		loginMember = (MemberVO)session.getAttribute("memVO");
		
		// 로그인 상태인 경우
		memCode = SessionCheck.getMemCode(session, request);
		memNo = SessionCheck.getMemNo(session, request);
		if(memCode == 1){
			// 개인회원인 경우
			hrNo = SessionCheck.getHrNo(session, request);
		}else if(memCode == 2){

			// 기업회원인 경우
			cnt = SessionCheck.hasComNo(session, request);
			if(cnt > 0){
				// 기업을 등록한 기업회원인 경우
				comNo = SessionCheck.getComNo(session, request);
				ICompanyService companyService = CompanyServiceImpl.getInstance();
				cv = companyService.getCompany(comNo);
			}
		}
	}else{
		
		// 비회원인 경우
		
	}
%>

<%

System.out.println("memNo : " + memNo + "\nmemCode : " + memCode + "\nhrNo" + hrNo + "\ncnt : " + cnt + "\ncomNo : " + comNo);

	if(loginMember != null){
		int isApi = loginMember.getMemIsApi();	 // 기본값 : 0, 외부로그인 : 1
		String myPage = "";
		
		if(loginMember.getMemCode() == 1){				// 개인회원
			memCode = loginMember.getMemCode();
			myPage = "/CodePeople/rehearsal/myPagePerson.html";
		} else if (loginMember.getMemCode() == 2){		// 기업회원
			memCode = loginMember.getMemCode();
			myPage = "/CodePeople/rehearsal/myPageCompany.html";
		} else if(loginMember.getMemCode() == 3){		// 관리자
			memCode = loginMember.getMemCode();
			myPage = "/CodePeople/rehearsal/myPageAdmin.html";
		}
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
	.button-center-box{
		display : flex;
		justify-content: center;
	}

	</style>


	<!--  jquery사용 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!--  serializeJSON함수 사용 -->
	<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/PagingTest.js"></script>
	<script src="${pageContext.request.contextPath}/js/formDropDown.js"></script>
	<script src="${pageContext.request.contextPath}/js/DropDownsTest.js"></script>
	
	<!-- form.js연결 -->
	<script src="${pageContext.request.contextPath}/js/form.js"></script>
	<script src="${pageContext.request.contextPath}/js/joinTest.js"></script>

	<script>

		let currentPageNo = 1;

		/* let isSearchMode = false;
			function doSearch(pageNo){
			if(isSearchMode == false){
					JOSearchCardPaging(1);
					isSearchMode = true;
			}else{
				pageNo = currentPageNo;
				JOSearchCardPaging(currentPageNo);
				
			}
			
		}; */
		document.addEventListener("DOMContentLoaded", () => {
			console.log("DOM is ready");

			const dropdownBtns = document.querySelectorAll('.dropdown button');

			const dropdownFormBtns = document.querySelectorAll('.dropdown.form button');
			
			
			//상세지역의 값을 가져오기 위한, 대분류 지역의 값
			let cityCodeNo = "";

			//현재 클릭한 드랍다운
			let dropdownBtn = "";


			const bringOptions = (btn) => {

				
				let key = btn.textContent;
				if (key === "직군") {
					initJobGroupList(btn);
				} else if (key === "활동분야") {
					initProgLangList(btn);
				} else if (key === "지역") {
					initCityList(btn);
				} else if (key === "상세지역") {
					initProvList(btn);
				} else if (key === "직무") {
					initJobTitleList(btn);
				} else if (key === "진행상태") {
					initStateList(btn);
				} else if (key === "보상") {
					initSalaryList(btn);
				}
				


			};
			
			const bringFormOptions = (btn) => {
				
				
				let key = btn.textContent;
				if (key === "'직군'") {
					initJobGroupList2(btn);
				console.log('bringFormOptions');
				} else if (key === "'활동분야'") {
					initProgLangList2(btn);
				console.log('bringFormOptions');
				} else if (key === "'직무'") {
					initJobTitleList2(btn);
				console.log('bringFormOptions');
				}
				
				
			}


			dropdownBtns.forEach(btn => {
				btn.addEventListener("click", event => {
					dropdownBtn = event.currentTarget;
					bringOptions(dropdownBtn);

				})
			})

			dropdownFormBtns.forEach(btn => {
				btn.addEventListener("click", event => {
					dropdownBtn = event.currentTarget;
					bringFormOptions(dropdownBtn);

				})
			})
		})
	
		
		window.onload = function(){
			$('.sort').on('click', function(){
				console.log($(this).text());
				<% if(memNo > 0){ %>
				if($(this).val() == "1"){
					$('.calendar').hide();
					$('.main-cal').show();
				}else if($(this).val() == "2"){
					$('.calendar').hide();
					$('.clip-cal').show();
				}else if($(this).val() == "3"){
					$('.calendar').hide();
					$('.fav-cal').show();
				}
				<% }%>
			})
		}
		
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
				<a href="/CodePeople/rehearsal/home.html" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
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
					 <a class="header-link" href="/CodePeople/MainHR.do">인재</a>
            <a class="header-link" href="/CodePeople/CompanyPagingList.do">기업</a>
            <a class="header-link" href="/CodePeople/JobOpeningCardPagingList.do">채용</a>
            <a class="header-link" href="/CodePeople/EachBoardPaging.do">커뮤니티</a>
         <a class="header-link myPage" href="/CodePeople/GoMyPage.do">마이페이지</a>
				</div>
				<div class="divider"></div>
				<!-- 로그인버튼 -->
		        <% if(memNo == 0){ %>
		        <a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn"
		            class="btn btn-primary btn-sm">로그인</button></a>
		        <% } else{ %>
		        <a href="/CodePeople/rehearsal/logout.jsp"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
		        <% } %>
			</div>
		</div>
	</div>
	<!-- 바디 -->
	<div id="body">
		<div id="body-container">
			<!-- 바디 메인 좌측 메뉴바 -->
			<div class="nav-left-bar">
				<div class="nav-sticky">
					<ul class="list-group">
						<a href="/CodePeople/JobOpeningCardPagingList.do"><li class="list-group-item" id="">채용 공고</li></a>
						<a href="/CodePeople/mainJsp/mainJoCal.jsp"><li class="list-group-item active">채용 달력</li></a>
						<% if(memNo == 0){ %>
						<li class="list-group-item" id="write" class="btn btn-outline-primary" onclick="alert('로그인해주세요')">채용 등록</li>
						<% }else if(memCode == 1){	%>
						<li class="list-group-item" id="write" class="btn btn-outline-primary" onclick="alert('개인회원은 이용할 수 없습니다.')">채용 등록</li>
						<% }else if(comNo != 0){%>
						<li class="list-group-item" id="write" class="btn btn-outline-primary" onclick="$('#registerJo').modal('show');">채용 등록</li>
						<% }%>
						
					</ul>
				</div>
			</div>
			<!-- 바디 콘텐츠 -->
			<div id="content">
				<!-- 콘텐츠 채용 검색 -->
				<div class="filter-box content-box jo">
					<h1 class="h1">채용검색</h1>
					<div class="filter-box-dropdowns">
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직군</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직무</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">활동분야</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">보상</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">진행상태</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">지역</button>
							<ul class="dropdown-menu"></ul>
						</div>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle hide" id="provBtn"
								data-bs-toggle="dropdown">상세지역</button>
							<ul class="dropdown-menu"></ul>
						</div>
					</div>
					<div class="input-group mb-3 col-lg-10 search-text">
						<div class="search-tags hide"></div>
						<input type="text" class="form-control" placeholder="검색어 입력">
					</div>
					<div class="filter-save-box">
						<button type="button" class="btn btn-outline-primary filter-save">검색 조건 저장</button>
					</div>
				</div>
				<!-- 콘턴츠 검색 결과의 구분은 기존의 클래스와 같고, 유료는 vip를 추가한다. -->
				<!-- 콘텐츠 채용 검색결과 -->
				<div class="content-box search-result jo" id="result-card-list">
					<!-- 검색결과 카드 -->
					<div class="filter-box content-box jo">

						<div class="filter-box-dropdowns">
							<div class="dropdown">
								<button type="button" class="btn btn-primary btn-sm active sort" value="1">전체 공채보기</button>
							</div>
							<div class="dropdown">
								<button type="button" class="btn btn-primary btn-sm notActive sort" value="2">스크랩한 공채보기</button>
							</div>
							<div class="dropdown">
								<button type="button" class="btn btn-primary btn-sm notActive sort" value="3">관심기업 공채보기</button>
							</div>
						</div>
					</div>
					<iframe src="/CodePeople/MainJoCal.do" name="calendar" width="2000" class="calendar main-cal" height="750">
					</iframe>
					<% if(memNo > 0){ %>
					<iframe src="/CodePeople/ClipJoCal.do" name="calendar" width="2000" class="calendar clip-cal hide" height="750">
					</iframe>
					<iframe src="/CodePeople/FavJoCal.do" name="calendar" width="2000" class="calendar fav-cal hide" height="750">
					</iframe>
					<iframe src="/CodePeople/HrMyCal.do" name="calendar" width="2000" class="calendar hr-my-cal hide" height="750">
					</iframe>
					<% } %>
				</div>

			</div>
		</div>
	</div>
	<!-- 페이징 처리를 위한 박스 -->

	<!--  풋터-->
	<div id="footer">
		<div id="footer-container"></div>
	</div>

	<% if(cv != null){ %>
	<div class="modal" id="registerJo">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"><div class="container mt-3 formsizing company-register">
						<h1>채용공고 등록</h1>
						<form action="/action_page.php" id="joForm">
							<div class="mb-3 mt-3">
								<label>채용공고 제목</label> <br>
								<label class="la2" for="email">*&nbsp;주식회사, (주) 등의 표기 없이 입력해주세요</label>
								<input type="text" class="form-control" name="joTitle" placeholder="[<%=cv.getComNm() %>] 채용공고 제목을 입력해주세요"
									>
							</div>

							<div class="mb-3">
								<label>급여</label>
								<input type="text" class="form-control" name="joSal" placeholder="연봉을 입력해주세요(단위 : 만원), 숫자만 입력해주세요">
							</div>

							<div class="mb-3">
								<label>직군</label>
								<input type="text" class="form-control" id="jg-display" placeholder="직군을 선택주세요">
								<input type="text" class="form-control hide" id="jgCodeNo" name="jgCodeNo">
							</div>
							<div class="dropdown form">
								<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">'직군'</button>
								<ul class="dropdown-menu"></ul>
							</div>
						

							<div class="mb-3">
								<label>직무</label>
								<input type="text" class="form-control" id="jt-displany" placeholder="직무를 입력해주세요.">
								<input type="text" class="form-control hide" id="jtCodeNo" name="jtCodeNo">
							</div>
							<div class="dropdown form">
								<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">'직무'</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="mb-3">
								<label>대표이메일</label>
								<input type="text" class="form-control" placeholder="<%=loginMember.getMemEmail() %>"
									disabled>
							</div>

							<div class="mb-3">
								<label>직급</label>
								<input type="text" class="form-control" name="joRank" placeholder="직급을 입력해주세요.">
							</div>

							<div class="mb-3">
								<label>대표연락처</label>
								<input type="text" class="form-control" placeholder="<%=loginMember.getMemTel() %>"
									disabled>
							</div>
							
							<div class="mb-3">
								<label>지원링크</label>
								<input type="text" class="form-control" name="joLink" placeholder="지원링크를 입력해주세요">
							</div>
							
							<div class="mb-3">
								<label>활동분야</label>
								<input type="text" class="form-control" id="pl-display" placeholder="활동분야를 선택해주세요">
								<input type="text" class="form-control hide" id="plCodeNo" name="plCodeNo">
							</div>
							<div class="dropdown form">
								<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">'활동분야'</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="mb-3">
								<label>채용일정</label>
								<input type="date" class="form-control" name="joSdate">
								<label class="la2" for="email">~</label>
								<input type="date" class="form-control" name="joEdate">
							</div>

					          <div class="mb-3 zip">
					            <label>우편번호</label>
					            <div class="zipInput">
					              <input type="text" class="form-control zip" id="postCode" disabled>
					              <input type="button" onclick="proc();" value="우편번호 검색" />
					            </div>
					          </div>
					          
					          <div class="mb-3">
					            <label>주소1</label>
					            <input type="text" class="form-control" id=roadAddress disabled>
					          </div>
					          
					          <div class="mb-3">
					            <label>주소2</label>
					            <input type="text" class="form-control" id="detailAddress">
					          </div>
					          
					          <div id="prov-box"></div>
					          
					          <div class="mb-3">
					            <input type="text" class="form-control hide" id=cityCodeNo name="cityCodeNo">
					          </div>
					          
					          <div class="mb-3">
					            <input type="text" class="form-control hide" id="provCodeNo" name="provCodeNo">
					          </div>

							<div class="mb-3">
								<input type="text" class="form-control hide" name="joFile" value = 0>
							</div>

							<div class="mb-3">
								<label>내용</label> <br>
								<textarea style="height: 200px; width: 100%;" class="form-control" name="joMthd"
									placeholder="채용공고 내용을 입력해주세요."></textarea>
							</div>
							<div class="button-center-box">
								<button type="button" class="btn btn-primary btn-lg" data-bs-dismiss="modal" onclick="insertJobOpening()">등록하기</button>
							</div>
						</form>
					</div>
				
					</div>

				<button type="button" id="send" class="btn btn-primary" data-bs-dismiss="modal">작성완료</button>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
	<% } %>

</body>


</html>