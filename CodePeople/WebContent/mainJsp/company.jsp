<%@page import="kr.or.ddit.cmm.vo.CompanyPagingVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	int memCode = 0;
	int memNo = 0;
	int hrNo = 0;
	int cnt = 0;
	int comNo = 0;
	MemberVO loginMember = new MemberVO();
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
		
		loginMember.setMemCode(0);
	}
%>
<%
	
	List<CompanyVO> list = (List<CompanyVO>) request.getAttribute("companyPagingList");
	System.out.println(list == null);
	CompanyPagingVO pagingVO = (CompanyPagingVO) request.getAttribute("companyPagingVO");
	System.out.println(pagingVO == null);

%>

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/d3ee6ce800.js"	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/CodePeople/js/DropDownsTest.js"></script>
<link rel="stylesheet" href="/CodePeople/css/main.css">
<script src="/CodePeople/js/jquery.serializejson.min.js"></script>
<script src="/CodePeople/js/company.js"></script>
<style>
.cardSession {
	display: flex;
}

h1 {
	text-align: center;
}

.btn-center-box {
	display: flex;
	justify-content: center;
}
</style>
<script>
    	let paginationBox;
    document.addEventListener("DOMContentLoaded", () => {

    	
      const dropdownBtns = document.querySelectorAll('.dropdown button');
    	 
     let currentPageNo = 1;
     //기본리스트를 출력하는 메서드 currentPage값으로 1을 hardcoding에서 넘겨준다. 
    	    
      //상세지역의 값을 가져오기 위한, 대분류 지역의 값
      let cityCodeNo = "";

      //현재 클릭한 드랍다운
      let dropdownBtn = "";


      const bringOptions = (btn) => {
        let key = btn.textContent;
        if (key === "직군") {
          initJobGroupList(btn);
        } else if (key === "인원수") {
          initHCntList(btn);
        } else if (key === "평균연봉") {
          initSalaryList(btn);
        } else if (key === "지역") {
          initCityList(btn);
        } else if (key === "상세지역") {
          initProvList(btn);
        }

      };
      

		document.getElementById('postTest').addEventListener("click", function () {
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
				<% if(loginMember.getMemCode() == 0){ %>
				<a href="/CodePeople/rehearsal/home.html" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
				<% } else { %>
				<a href="/CodePeople/html/index.jsp" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
				<% } %>
				<div class="divider"></div>
				<!-- 통합 검색창 -->
				<div id="search-box">
					<div id="search-item">
						<i class="fas fa-search item" style="width: 15.3px; height: 19px;">
						</i> <input class="" type="text"
							style="height: 19px; border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
							placeholder="통합검색">
					</div>
				</div>
			</div>
			<!-- 우측 메뉴 -->
			<div id="header-right-menu">
				<!-- 메인 메뉴 링크 -->
				<div id="header-link-box">
				<jsp:include page="/mainJsp/header.jsp"></jsp:include>
				</div>
				<div class="divider"></div>
				<!-- 로그인버튼 -->
				<% if(loginMember.getMemCode() == 0){ %>
				<a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn" class="btn btn-primary btn-sm">로그인</button></a>
				<% } else { %>
				<a href="/CodePeople/rehearsal/logout.jsp" onclick="alert('로그아웃되었습니다.')"
				><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
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
						<li class="list-group-item active">모든기업 보기</li>
						<% if(cnt > 0){ %>
						<li class="list-group-item" id="write"	class="btn btn-outline-primary">
						<a href="/CodePeople/mainJsp/companyInsert.jsp" >기업 관리</a></li>
						<% }else{ %>
						<li class="list-group-item" id="modify"	class="btn btn-outline-primary">
						<a href="/CodePeople/mainJsp/companyInsert.jsp" >기업 등록</a></li>
						<% } %>
					</ul>
				</div>
			</div>
			<!-- 마이페이지 좌측 메뉴바 -->
			<div class="nav-left-bar nav-my" style="display: none;">
				<div class="nav-sticky">
					<ul class="list-group">
						<li class="list-group-item "><a class="nav-link" href="#cv">이력서</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#fav-company">관심기업</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#fav-jo">관심공고</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">캘린더</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">유료서비스</a></li>
						<li class="list-group-item"><a class="nav-link" href="#">회원정보</a></li>
					</ul>
				</div>
			</div>
			<!-- 바디 콘텐츠 -->
			<div id="content">
				<form id="formTest" style="display:none">
					<input type="hidden" name="JG_CODE_NO" class="jg-code-hidden">직군
					<input type="hidden" name="JT_CODE_NO" class="jt-code-hidden">직무
					<input type="hidden" name="SAL_TYPE" class="sal-type-hidden">연봉
					<input type="hidden" name="PROV_CODE_NO" class="city-code-hidden">지역
					<input type="hidden" name="CITY_CODE_NO" class="prov-code-hidden">도시
					<input type="hidden" name="HCNT_TYPE" class="hcnt-type-hidden">인원
					<button id="postTest" value="test" type="button">테스트</button>
					<input type="reset" value="reset"></input>
				</form>
				<!-- 마이페이지 -->
				<!-- 콘텐츠 기업 검색-->
				<div class="filter-box content-box company">
					<h1 class="h1">기업 정보 검색</h1>
					<div class="filter-box-dropdowns">
						<div class="filter-box-dropdowns">
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown">직군</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown">인원수</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown">평균연봉</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="dropdown">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown">지역</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="dropdown">
								<button type="button"
									class="btn btn-primary dropdown-toggle hide" id="provBtn"
									data-bs-toggle="dropdown">상세지역</button>
								<ul class="dropdown-menu"></ul>
							</div>
						</div>
					</div>
					<div class="search-tags"></div>
					<div class="input-group mb-3 col-lg-10 search-text">
						<input type="text" class="form-control" placeholder="검색어 입력">
					</div>
					<div class="filter-save-box">
						<button type="button" class="btn btn-outline-primary filter-save">검색
							조건 저장</button>
					</div>
				</div>

				<!-- 페이징 처리를 위한 박스 -->
				<div class="container mt-3" id="result-page-box">
				

				<!-- 콘턴츠 검색 결과의 구분은 기존의 클래스와 같고, 유료는 vip를 추가한다. -->
				<!-- 콘텐츠 기업 검색결과 -->
			<div class="content-box search-result company" id="company-card-list">
					<!-- 검색결과 카드 -->
			<% if(list.size() == 0){ %>
					<p> 등록된 기업이 없습니다. </p>
			<% } else { %>
				<% for(int i = 0; i < list.size(); i++){ %>
					<div class="card" idx="<%= list.get(i).getComNo() %>">
                        <div class="card-left">
                            <img src="/CodePeople/images/logo<%= i %>.png" alt="Card image" style="width:64px; height: 64px;">
                        </div>
                        <div class="card-body card-right">
                          <div class="card-top-box">
                            <a href="/CodePeople/CompanyDetailList.do?comNo=<%= list.get(i).getComNo() %>" class="card-link"><h4 class="card-title"><%= list.get(i).getComNm() %></h4></a>
                                <div class="dropup">
                                    <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
                                        data-bs-toggle="dropdown"></button>
                                    <!-- 카드 메뉴정보 -->
                                      <ul class="dropdown-menu">
                                        <!-- 카드 메뉴 헤더 -->
                                        <li>
                                            <h5 class="dropdown-header">관심등록</h5>
                                        </li>
                                        <!-- 카드 메뉴 옵션 -->
                                        <li><a class="dropdown-item addFav" idx="<%= list.get(i).getComNo() %>">관심등록</a></li>
                                        <li><a class="dropdown-item deleteFav" idx="<%= list.get(i).getComNo() %>">관심해제</a></li>
                                        <li>
                                        </ul>
                                </div>
                            </div>
                            <div class="card-rating-box">
                                  <p><%= list.get(i).getComIntro() %></p>
                            </div>
                            <a href="/CodePeople/CompanyDetailList.do?comNo=<%= list.get(i).getComNo() %>#review" class="card-link">리뷰</a>
                            <a href="/CodePeople/CompanyDetailList.do?comNo=<%= list.get(i).getComNo() %>#board" class="card-link">게시물</a>
                            <a href="/CodePeople/CompanyDetailList.do?comNo=<%= list.get(i).getComNo() %>#salary" class="card-link">연봉</a>
                            <a href="/CodePeople/CompanyDetailList.do?comNo=<%= list.get(i).getComNo() %>#hr" class="card-link">채용</a>
                        </div>
                    </div>				
				<% } %>
			<% } %>
					
				
				
				
					
				</div>
				<div class="container mt-3" id="result-page-box">
					<% 
						int firstPage = pagingVO.getFirstPageNo();
						System.out.println(firstPage);
						int pageCount = pagingVO.getPageSize();
						System.out.println(pageCount);
						int currentPage = pagingVO.getCurrentPageNo();
						System.out.println(currentPage);
						int lastPage = pagingVO.getLastPageNo();
						System.out.println(lastPage);
						int totalPageCount = pagingVO.getTotalPageCount();
						System.out.println(totalPageCount);
					%>
					<ul class="pagination justify-content-center">
					<% for(int i = firstPage; i <= lastPage; i++){	%>
					<% if(currentPage == i){	%>
						<li class="page-item active"><a class="page-link" href="/CodePeople/CompanyPagingList.do?currentPageNo=<%=i%>"><%=i %></a></li>
					<% }else{ %>
						<li class="page-item"><a class="page-link" href="/CodePeople/CompanyPagingList.do?currentPageNo=<%=i%>"><%=i %></a></li>
					<% }    	%>
						
					<% }    	%>	
					</ul>
				</div>
				</div>
				<form id="favComForm">
				<input type="hidden" id="comNo" name="comNo" value="1">
				<input type="hidden" id="hrNo" name="hrNo" value="">
				</form>
				
			</div>
			
		</div>
	</div>
				
	<!--  풋터-->
	<div id="footer">
		<div id="footer-container"></div>
	</div>

<script>

$(document).on('click','.addFav', function(t){

			let comCard = this;
			comNoValue = comCard.getAttribute('idx');
			console.log(comNoValue);
			addFavCompany();
})


$(document).on('click','.deleteFav', function(t){

	let comCard = this;
	comNoValue = comCard.getAttribute('idx');
	console.log(comNoValue);
	deleteFavCompany();		
})

</script>
</body>

</html>