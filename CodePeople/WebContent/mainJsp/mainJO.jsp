<%@page import="kr.or.ddit.cmm.vo.JobOpeningPagingVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
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
		System.out.println(memNo);
		if(memCode == 1){
			System.out.println(memCode);
			// 개인회원인 경우
			hrNo = SessionCheck.getHrNo(session, request);
		}else if(memCode == 2){
			System.out.println(memCode);
			// 기업회원인 경우
			cnt = SessionCheck.hasComNo(session, request);
			if(cnt > 0){
				// 기업을 등록한 기업회원인 경우
				
				System.out.println(cnt);
				comNo = SessionCheck.getComNo(session, request);
				ICompanyService companyService = CompanyServiceImpl.getInstance();
				cv = companyService.getCompany(comNo);
			}
		}
	}else{
		// 비회원인 경우
	}
	
	System.out.println("memNo : " + memNo + "\nmemCode : " + memCode + "\nhrNo" + hrNo + "\ncnt : " + cnt + "\ncomNo : " + comNo);
	
	
	List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("jobOpeningCardPagingList");

	JobOpeningPagingVO pagingVO = (JobOpeningPagingVO) request.getAttribute("PagingVO");
	
%>
<%
  MemberVO mv = (MemberVO) session.getAttribute("memVO");
		String myPage = "";
	if(mv != null){
		int isApi = mv.getMemIsApi();	 // 기본값 : 0, 외부로그인 : 1
		
		if(mv.getMemCode() == 1){				// 개인회원
			memCode = mv.getMemCode();
			myPage = "/CodePeople/rehearsal/myPagePerson.html";
		} else if (mv.getMemCode() == 2){		// 기업회원
			memCode = mv.getMemCode();
			myPage = "/CodePeople/rehearsal/myPageCompany.html";
		} else if(mv.getMemCode() == 3){		// 관리자
			memCode = mv.getMemCode();
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
	<link rel="stylesheet" href="/CodePeople/css/main.css">
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
	<script src="/CodePeople/js/jquery.serializejson.min.js"></script>
	<script src="/CodePeople/js/PagingTest.js"></script>
	<script src="/CodePeople/js/formDropDown.js"></script>
	<script src="/CodePeople/js/DropDownsTest.js"></script>
	
	<!-- form.js연결 -->
	<script src="/CodePeople/js/form.js"></script>
	<script src="/CodePeople/js/joinTest.js"></script>
	<script src="/CodePeople/js/CheckRight.js"></script>

	<script>
		let paginationBox;

		let currentPageNo = 1;
		
		console.log(<%=comNo%>);

		document.addEventListener("DOMContentLoaded", function(){
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


			document.getElementById('search').addEventListener("click", function () {
				JOSearchCardPaging(1);
				isSearchMode = true;
			});


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
            <a class="header-link" href="/CodePeople/htmltest/boardFunctionTest.html">커뮤니티</a>
         <a class="header-link myPage" href="/CodePeople/GoMyPage.do">마이페이지</a>
        </div>
				<div class="divider"></div>
				<!-- 로그인버튼 -->
				<% if(memNo == 0){ %>
				<a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn" class="btn btn-primary btn-sm">로그인</button></a>
				<% } else { %>
				<a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
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
						<a href="/CodePeople/JobOpeningCardPagingList.do"><li class="list-group-item active" id="">채용 공고</li></a>
						<a href="/CodePeople/mainJsp/mainJoCal.jsp"><li class="list-group-item">채용 달력</li></a>
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
						<form id="formTest">
							<input type="hidden" name="JG_CODE_NO" class="jg-code-hidden">
							<input type="hidden" name="JT_CODE_NO" class="jt-code-hidden">
							<input type="hidden" name="PL_CODE_NO" class="pl-code-hidden">
							<input type="hidden" name="SAL_TYPE" class="sal-type-hidden">
							<input type="hidden" name="PROV_CODE_NO" class="city-code-hidden">
							<input type="hidden" name="CITY_CODE_NO" class="prov-code-hidden">
							<input type="hidden" name="STATE" class="state-hidden">
							<input type="hidden" name="EDU_CODE_NO" class="edu-code-hidden">
							<input type="hidden" name="CRR_YEARS_TYPE" class="crr-type-hidden">
							<input type="hidden" name="CERT_CODE_NO" class="cert-code-hidden">
							<input type="hidden" name="HCNT_TYPE" class="hcnt-type-hidden">
							<input type="button" id="search" value="검색" class="btn btn-outline-primary filter-save">
							<input type="hidden" value="reset"></input>
						</form>
					</div>
				</div>
				<!-- 콘턴츠 검색 결과의 구분은 기존의 클래스와 같고, 유료는 vip를 추가한다. -->
				<!-- 콘텐츠 채용 검색결과 -->
				<div class="content-box search-result jo" id="result-card-list">
				<% for(int i = 0; i < list.size(); i++) { %>
				<%
					Map<String, Object> vo = list.get(i);
					
					String rnum = String.valueOf(vo.get("RNUM"));
					String comNm = String.valueOf(vo.get("COM_NM"));
					String comIntro = String.valueOf(vo.get("COM_INTRO"));
					String joTitle = String.valueOf(vo.get("JO_TITLE"));
					String joSdate = String.valueOf(vo.get("JO_SDATE"));
					String joEdate = String.valueOf(vo.get("JO_EDATE"));
					String jgCodeNm = String.valueOf(vo.get("JG_CODE_NM"));
					String jtCodeNm = String.valueOf(vo.get("JT_CODE_NM"));
					String joSalTypeNm = String.valueOf(vo.get("JO_SAL_TYPE_NM"));
					String joNo = String.valueOf(vo.get("JO_NO"));
					
					String imageHref = "/CodePeople/images/logo" + (int)Math.floor(Integer.parseInt(joNo)/15) + ".png";
				%>
					<div class="card card-jo">
		                <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
		                <div class="card-left">
		                    <img src="<%=imageHref %>" alt="Card image" style="width:64px; height: 64px;">
		                </div>
		                <!-- 카드의 정보 -->
		                <div class="card-body card-right">
	                    <a href="/CodePeople/JOCardDetil.do?joNo=<%=joNo %>">
	                    <div class="card-top-box">
	                        <h4 class="card-title"><%=joTitle %></h4>
	                    </div></a>
	                    <!-- 카드의 회사 소개, 직군 -->
	                    <div class="card-text card-jobs-detail-company-intro"><span class="company-intor"><%=comIntro %></span></div>
	                    <div class="card-text card-jobs-detail-company-jobgroup"><span class="company-jobgroup"><%=jgCodeNm %></span></div>
	                    <!-- 카드의 채용공고 박스 -->
	                    <div class="card-jobs-detail">
	                        <div class="divider"></div>
	                        <div class="jobs-detail-top">
	                            <div class="jobs-detail">
	                                <a href="#" class="card-link"><span class="jo-title"><%=comNm %></span></a>&nbsp;&nbsp;
	                                <span class="jo-salary jo-sm-font"><%=joSalTypeNm %></span>
	                                <span class="jo-sm-font">/</span>
	                                <span class="jo-career jo-sm-font">경력</span>
	                            </div>
	                            <div class="dropup">
	                                <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
	                                    data-bs-toggle="dropdown"></button>
	                                <!-- 카드 메뉴정보 -->
	                                <ul class="dropdown-menu">
	                                    <!-- 카드 메뉴 헤더 -->
	                                    <!-- 카드 메뉴 옵션 -->
	                                    <li><a class="dropdown-item" href="#">스크랩</a></li>
											<h5 class="dropdown-header">스크랩 등록</h5>
											<h5 class="dropdown-header">스크랩 삭제</h5>
										<li><a class="dropdown-item" href="#">알람</a></li>
	                                    <li>
	                                        <h5 class="dropdown-header">알람등록</h5>
	                                        <h5 class="dropdown-header">알람해제</h5>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	
	                        <span class="card-text jo-sm-font"><%=jtCodeNm %></span>&nbsp;&nbsp;
	                        <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i><%=joSdate %>
	                            </span>
	                            &nbsp;<span class="jo-start jo-sm-font">~</span>&nbsp;
	                        <span class="jo-end jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i><%=joEdate %>
	                            </span>
	                    </div>
	                </div>
	            	</div>
	            	<% } %>
				</div>


				<!-- 페이징 처리를 위한 박스 -->
				<div class="container mt-3" id="result-page-box">
					<%
						int firstPage = pagingVO.getFirstPageNo();
						int pageCount = pagingVO.getPageSize();
						int currentPage = pagingVO.getCurrentPageNo();
						int lastPage = pagingVO.getLastPageNo();
						int totalPageCount = pagingVO.getTotalPageCount();
					%>
					<ul class="pagination">
					<% if(firstPage > pageCount) { %>
					  <li class="page-item"><a class="page-link" href="JobOpeningCardPagingList.do?currentPageNo=<%=firstPage - pageCount %>">Previous</a></li>
					<% } %>
					
					<% for(int i = firstPage; i <= lastPage; i++) { %>
						<% if(i == currentPage){ %>
							<li class="page-item active"><a class="page-link" href="JobOpeningCardPagingList.do?currentPageNo=<%=i %>"><%=i %></a></li>
						<% }else { %>
							<li class="page-item"><a class="page-link" href="JobOpeningCardPagingList.do?currentPageNo=<%=i %>"><%=i %></a></li>
						<% } %>
					<% } %>
					
					<% if(lastPage < totalPageCount) { %>
					  <li class="page-item"><a class="page-link" href="JobOpeningCardPagingList.do?currentPageNo=<%=firstPage + pageCount %>">Next</a></li>
					<% } %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	

	<script type="text/javascript">
		paginationBox = $('#result-page-box');
		console.log(paginationBox);
		
	</script>

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
								<input type="text" class="form-control" id="jt-display" placeholder="직무를 입력해주세요.">
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