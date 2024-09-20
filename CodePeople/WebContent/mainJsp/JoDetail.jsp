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

		String myPage = "";
	if(loginMember != null){
		int isApi = loginMember.getMemIsApi();	 // 기본값 : 0, 외부로그인 : 1
			if(loginMember != null){
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
	}
%>
<%
	JOCardVO vo = (JOCardVO)request.getAttribute("joCardDetail");
	
	String imageHref = (String)request.getAttribute("imageHref");
	
	System.out.println(vo == null);
	System.out.println(imageHref == null);
	if(imageHref != null){
		System.out.println(imageHref);
	}
	
	String comNm 	= "정보없음";
	String comHpg 	= "정보없음";
	Integer comFav 	= 0;
	String comIntro = "정보없음";
	String joTitle 	= "정보없음";
	Integer joClip 	= 0;
	String joMthd 	= "정보없음";
	String jgCodeNm = "정보없음";
	String jtCodeNm = "정보없음";
	String plCodeNm = "정보없음";
	String joRank 	= "정보없음";
	String joSdate 	= "정보없음";
	String joEdate 	= "정보없음";
  String cityCodeNm = "정보없음";
  String provCodeNm = "정보없음";
	Integer joNo 	= 0;
	Integer joSal 	= 0;
	if(vo != null){
		comNm = vo.getComNm();
		comHpg = vo.getComHpg();
		 comFav = vo.getComFav();
		comIntro = vo.getComIntro();
		joTitle = vo.getJoTitle();
		 joClip = vo.getJoClip();
		joMthd = vo.getJoMthd();
		jgCodeNm = vo.getJgCodeNm();
		jtCodeNm = vo.getJtCodeNm();
		plCodeNm = vo.getPlCodeNm();
		joRank = vo.getJoRank();
		joSdate = vo.getJoSdate();
		joEdate = vo.getJoEdate();
		cityCodeNm = vo.getCityCodeNm();
		provCodeNm = vo.getProvCodeNm();
		 joNo = vo.getJoNo();
		 joSal = vo.getJoSal();
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	</script>





  <script>

    $(function () {
    	
    	console.log('test');
    	
      $(".list-group .memInfo").click(function (e) {
        let submenu = $(this).next("ul");

        if (submenu.is(":visible")) {
          submenu.slideUp();
        } else {
          submenu.slideDown();
        }

		    

      });
      
		$('#deleteClip').on('click', function(){
	    	
	    	let joNo = $('#deleteClip').attr('idx');
	    	console.log(joNo);
	    	
	    	
	    	$.ajax({
				url : '/CodePeople/DeleteClip.do',
				type : 'get',
				dataType : 'json',
				data : { "joNo" : joNo },
				success : function(res){
					
					if(res.flag === "success"){
	    				alert("스크랩이 취소되었습니다.");
	    				
	    				$('#currentClip').text(parseInt($('#currentClip').text()) - 1);
	    				
					}else{
						alert("스크랩 취소에 실패했습니다.");
					}
					
				},
				error : function(xhr){
					alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
				}
			}) 
	    });
      
	    $('#insertClip').on('click', function(){
	    	
	    	let joNo = $('#insertClip').attr('idx');
	    	console.log(joNo);
	    	
	    	
	    	$.ajax({
				url : '/CodePeople/InsertClip.do',
				type : 'get',
				dataType : 'json',
				data : { "joNo" : joNo },
				success : function(res){
					
					if(res.flag === "success"){
	    				alert("스크랩이 완료되었습니다.");
	    				
	    				$('#currentClip').text(parseInt($('#currentClip').text()) + 1);
	    				
					}else{
						alert("스크랩에 실패했습니다.");
					}
					
				},
				error : function(xhr){
					alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
				}
			}) 
	    });

	    $('#remove').on('click', function(){
	    	
	    	let joNo = $('#insertClip').attr('idx');
	    	console.log(joNo);
	    	
	    	if(confirm("정말 삭제하시겠습니까?")){
		    	$.ajax({
					url : '/CodePeople/DeleteJobOpening.do',
					type : 'get',
					dataType : 'json',
					data : { "joNo" : joNo },
					success : function(res){
						
						if(res.flag === "success"){
		    				alert("삭제가 완료되었습니다.");
		    				location.href = "/CodePeople/JobOpeningCardPagingList.do"
						}else{
							alert("삭제에 실패했습니다.");
						}
						
					},
					error : function(xhr){
						alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
					}
				}) 
		    }
	    });
	    $('#update').on('click', function(){
	    	
	    	let joNo = $('#update').attr('idx');
	    	console.log(joNo);

	    	console.log($('#updateJo'));
	    	$('#updateJo').modal();
	    	
	    }); 
    });
    
    
    
    $(document).on('click', '#apply', function(){
    	
    	let isApply = confirm("정말 지원하시겠습니까?");
    	
    	let joNo = $('#joNo').val();
    	console.log(joNo);
    	
    	if(isApply){
    		
    		 $.ajax({
    			url : '/CodePeople/Apply.do',
    			type : 'get',
    			dataType : 'json',
    			data : { "joNo" : joNo },
    			success : function(res){
    				
    				if(res.flag === "success"){
	    				alert("지원이 완료되었습니다.");
	    				
	    				$('#apply').attr('disabled', true);
	    				
    				}else{
    					alert("지원에 실패했습니다.");
    				}
    				
    			},
    			error : function(xhr){
    				alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
    			}
    		}) 
    	}
    });
    
  </script>

  <style>
    .list-group .memInfo {
      cursor: pointer;
    }

    .list-group .infoList {
      display: none;
      padding: 0px;
    }

    .list-group .infoList li:hover {
      filter: brightness(95%);
    }
    .sal-graph{
      width: 500px;
    }
    .progress_wrap {
    position: relative;
    background: #9a80db;
    background: linear-gradient(
90deg,#9a80db,#56a2d8 54%,#ec647e);
    width: 50%;
    height: 6px;
    border-radius: 100px;
    display: block;
}
.comparison .show_chart .comparison_chart {
    position: relative;
    min-height: 90px;
}
.progress_wrap [class^=dot_] {
    display: block;
    position: absolute;
    top: -3px;
    width: 12px;
    height: 12px;
    border-radius: 12px;
    margin-left: -6px;
}
.progress_wrap span.dot_min {
    left: 0;
    background-color: #9681da;
}
.progress_wrap span.dot_med {
    left: 50%;
    background-color: #57a1d8;
}
.progress_wrap span.dot_max {
    left: 100%;
    background-color: #e56782;
}
.comparison .show_chart .min_max li {
    display: inline-block;
    width: 33.33%;
    font-size: 12px;
    font-weight: 400;
    text-align: center;
    line-height: 1.25em;
}
  </style>
</head>

<body>
  <!-- 헤더 -->
  <div id="header">
    <!-- 헤더 메인 메뉴 바 -->
    <div id="header-container">
      <!-- 좌측 메뉴 -->
      <div id="header-left-menu">
        <!-- 로고 -->
        <% if(memNo != 0){ %>
        <a href="/CodePeople/rehearsal/index.jsp" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
        <% }else { %>
        <a href="/CodePeople/rehearsal/home.html" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
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
            <a class="header-link" href="/CodePeople/MainHR.do">인재</a>
            <a class="header-link" href="/CodePeople/CompanyPagingList.do">기업</a>
            <a class="header-link" href="/CodePeople/JobOpeningCardPagingList.do">채용</a>
            <a class="header-link" href="/CodePeople/EachBoardPaging.do">커뮤니티</a>
            <a class="header-link myPage" href="<%=myPage%>">마이페이지</a>
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
        <!-- 마이페이지 -->

        <!-- 메인 -->
        <div id="main" class="content-box search-result jo my-main-cv">
          <div class="my-box-item">
            <div class="my-box-header">
              <h1 class="h1">채용공고 상세</h1>
            </div>
          </div>
          <!-- 검색결과 카드 -->
          <div class="card card-cv">
            <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
            <div class="card-left">
              <img src="<%=imageHref %>" alt="Card image" style="width: 64px; height: 64px;">
            </div>
            <!-- 카드의 정보 -->
            <div class="card-body card-right">
              <div class="card-top-box">
                <h4 class="card-title cv-title"><%=joTitle %></h4>
                <!-- 관심/알람 버튼 -->
                <div class="dropdown">
                  <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
                    data-bs-toggle="dropdown"></button>
                  <!-- 버튼 메뉴정보 -->
                  <ul class="dropdown-menu">
                    <li>
                      <h5 class="dropdown-header">관심</h5>
                    </li>
                    <li><a class="dropdown-item" href="#" idx="<%=joNo %>" id="insertClip">관심등록</a></li>
                    <li><a class="dropdown-item" href="#" idx="<%=joNo %>" id="deleteClip">관심해제</a></li>
                    <li>
                      <h5 class="dropdown-header">알람</h5>
                    </li>
                    <li><a class="dropdown-item" href="#">알람설정</a></li>
                    <li><a class="dropdown-item" href="#">알람해제</a></li>
                  </ul>
                </div>
              </div>
              <!-- 기업 홈페이지 내용 -->
              <div class="card-text">
                기업 &nbsp;&nbsp;
                <span class="cv-jobgroup"><%=comNm %></span>
              </div>
              <div class="card-text">
                소개 &nbsp;&nbsp;
                <span class="cv-jobgroup"><%=comIntro %></span>
              </div>
              <div class="card-text">
                홈페이지 &nbsp;&nbsp;
                <span class="cv-jobgroup"><%=comHpg %></span>
              </div>
              <div class="card-text">
                관심등록 수&nbsp;&nbsp;
                <span class="cv-jobgroup"><%=comFav %></span>
              </div>
              <div class="card-text">
                스크랩 수&nbsp;&nbsp;
                <span class="cv-jobgroup" id="currentClip"><%=joClip %></span>
              </div>
            </div>
          </div>
        </div>

        <!-- 채용공고 소개 -->
        <div id="review" class="content-box  search-result payment-desc my-main-cv">
          <div class="my-box-item">
            <div class="my-box-header">
              <h1 class="h1">개요</h1>
            </div>
          </div>
          <!-- 검색결과 카드 -->
          <div class="card" style="width:750px;" >
            <!-- 카드의 정보 -->
            <div class="card-body">
              <div class="card-top-box content-box">
                <h4 class="card-title"><%=joTitle %></h4>
              </div>
              <div class="card-rating-text" style="padding:10px;"><%=joMthd %></div>
            </div>
          </div>
        </div>
        <!-- 채용정보 -->
        <div class="content-box  search-result mt-3 my-main-cv">
          <div class="card" style="width:750px;" >
            <div class="card-body">
              <h4 class="card-title">채용정보</h4>
				<div style="border-bottom:solid 1px lightgray; height:15px; margin-bottom:15px;"></div>
   				 <div class="container mt-3 formsizing company-register" >
    		
    						<input type="hidden" class="hrNo" name="hrNo" value="">
    						<input type="hidden" id="eduCodeNo" name="eduCodeNo" value="">
    						<div class="dropdown input-group mt-3 mb-3">
    							<button type="button"  disabled class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직군</button>
    							<ul class="dropdown-menu"></ul>
    							<input type="text" class="form-control textValue" value="<%=jgCodeNm %>" disabled>
    						</div>
    						<div class="dropdown input-group mt-3 mb-3">
    							<button type="button" class="btn btn-primary" disabled>직무</button>
    							<input type="text" class="form-control textValue" id="eduSchNm"
    								name="eduSchNm"  value="<%=jtCodeNm %>" disabled>
    						</div>
    						<div class="dropdown input-group mt-3 mb-3">
							<button type="button" class="btn btn-primary"  disabled>직급</button>
							<input type="text" class="form-control textValue" id="eduMajor"
								name="eduMajor"  value="<%=joRank %>" disabled>
							</div>
							<div class="dropdown input-group mt-3 mb-3">
							<button type="button" class="btn btn-primary" disabled>활동분야</button>
							<input type="text" class="form-control textValue" id="eduGraTot"
								name="eduGraTot"  value="<%=plCodeNm %>" disabled>
							</div>
							<div class="dropdown input-group mt-3 mb-3">
							<button type="button" class="btn btn-primary" disabled>주소</button>
							<input type="text" class="form-control textValue" id="eduGraAvg"
								name="eduGraAvg"  value="<%=cityCodeNm + " " + provCodeNm %>" disabled>
							</div>
								<div class="dropdown input-group mt-3 mb-3">
							<button type="button" class="btn btn-primary" disabled>연봉</button>
							<input type="number" class="form-control textValue" id="eduGraAvg"
								name="eduGraAvg"  value="<%=joSal %>" disabled>
							</div>
    					 
                <input type="hidden" id="joNo" value="<%=joNo %>">
                
														
                <span class="jo-start jo-sm-font">시작&nbsp;<i class="far fa-calendar-alt"></i>&nbsp;<%=joSdate.substring(0,4) %>.<%=joSdate.substring(4,6) %>.<%=joSdate.substring(6) %> </span> &nbsp;<span
                	class="jo-start jo-sm-font">~</span>&nbsp; <span class="jo-end jo-sm-font">마감&nbsp;<i
                		class="far fa-calendar-alt">&nbsp;</i>&nbsp;<%=joEdate.substring(0,4) %>.<%=joEdate.substring(4,6) %>.<%=joSdate.substring(6) %>
                
                  <div class="my-btn-box my-btn-box-cv">
                          	<button type="button" class="btn btn-outline-primary" id="apply">지원하기</button>
                       		</div>
              </div>


            </div>
          </div>
          <% if(cv != null){ %>
                <button type="button" id="update" idx="<%=joNo %>" class="btn btn-success" data-bs-toggle="modal"
							data-bs-target="#updateJo">수정</button>
                <button type="button" id="remove" idx="<%=joNo %>" class="btn btn-success">삭제</button>
          <% } %>
        </div>
                

  </div>

  <!--  풋터-->
  <div id="footer">
    <div id="footer-container"></div>
  </div>
	<% if(cv != null){ %>
	<div class="modal" id="updateJo">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">글쓰기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"><div class="container mt-3 formsizing company-register">
						<h1>채용공고 수정</h1>
						<form action="/action_page.php" id="joForm">
							<div class="mb-3 mt-3">
								<label>채용공고 제목</label> <br>
								<label class="la2" for="email">*&nbsp;주식회사, (주) 등의 표기 없이 입력해주세요</label>
								<input type="text" class="form-control" name="joTitle" placeholder="[비바리퍼블리카(자동완성)] 품질관리 신입사원 및 경력자 모집"
									value="<%=joTitle %>">
							</div>

							<div class="mb-3">
								<label>급여</label>
								<input type="text" class="form-control" name="joSal" placeholder="예) 3,000만원 이상 - 면접 후 결정"
								value="<%=joSal %>">
							</div>

							<input type="hidden" class="form-control" id="joNO" name="joNo" value="<%=joNo %>">
							
							<div class="mb-3">
								<label>직군</label>
								<input type="text" class="form-control" id="jg-display" placeholder="직군을 선택주세요" value="<%=jgCodeNm%>">
								<input type="text" class="form-control hide" id="jgCodeNo" name="jgCodeNo">
							</div>
							<div class="dropdown form">
								<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">'직군'</button>
								<ul class="dropdown-menu"></ul>
							</div>
						

							<div class="mb-3">
								<label>직무</label>
								<input type="text" class="form-control" id="jt-displany" placeholder="직무를 입력해주세요." value="<%=jtCodeNm%>">
								<input type="text" class="form-control hide" id="jtCodeNo" name="jtCodeNo">
							</div>
							<div class="dropdown form">
								<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">'직무'</button>
								<ul class="dropdown-menu"></ul>
							</div>
							<div class="mb-3">
								<label>대표이메일</label>
								<input type="text" class="form-control" placeholder="aaa241@gmail.com(자동완성)"
									value=" " disabled>
							</div>

							<div class="mb-3">
								<label>직급</label>
								<input type="text" class="form-control" name="joRank" placeholder="직급을 입력해주세요." value="<%=joRank%>">
							</div>

							<div class="mb-3">
								<label>대표연락처</label>
								<input type="text" class="form-control" placeholder="010-0000-0241(자동완성)"
									value=" " disabled>
							</div>
							
							<div class="mb-3">
								<label>지원링크</label>
								<input type="text" class="form-control" name="joLink" placeholder="지원링크를 입력해주세요" 
								 value=" ">
							</div>
							
							<div class="mb-3">
								<label>활동분야</label>
								<input type="text" class="form-control" id="pl-display" placeholder="활동분야를 선택해주세요" value="<%=plCodeNm%>">
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
									placeholder="채용공고 내용을 입력해주세요." ></textarea>
							</div>
							
							<div class="button-center-box">
								<button type="button" class="btn btn-primary btn-lg" data-bs-dismiss="modal" onclick="updateJobOpening()">수정하기</button>
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