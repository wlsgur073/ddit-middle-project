<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.ParseException"%>
<%@page import="kr.or.ddit.cmm.vo.CompanyPagingVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	int memCode = 0;
	int memNo = 0;
	int hrNo = 0;
	int cnt = 0;
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
		}
	}else{
		
	}
%>

	<%@page 
import="java.io.BufferedReader" 
import= "java.io.InputStreamReader" 
import= "java.net.HttpURLConnection" 
import= "java.net.URL" 
import= "java.net.URLEncoder" 
%>

<% 
	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("companyDetail");
	System.out.println(list.size());
  	int joCheck = (int) request.getAttribute("companyJOCount");
  	int ReviewCheck = (int) request.getAttribute("companyReviewCount");
  	System.out.println(ReviewCheck);
  	List<Map<String, Object>> listjo = new ArrayList();
  	List<Map<String, Object>> listReview = new ArrayList();
  	
  	boolean joflag = true;
  	boolean Reviewflag = true;
  	
  	if(joCheck == 0){
		joflag = false;
  	} else {
  		joflag = true;
  		listjo = (List<Map<String, Object>>)request.getAttribute("companyJOList");
  	}
		
  	if(ReviewCheck == 0){
  		Reviewflag = false;
  	} else {
  		Reviewflag = true;
  		listReview = (List<Map<String, Object>>)request.getAttribute("companyReviewList");
  		System.out.println(listReview);
  	}
  	
 	Map<String, Object> map = list.get(0);
 	Object comNm = map.get("COM_NM");
  	Object comNo = map.get("COM_NO");
 	int comNoInt = Integer.parseInt(String.valueOf(comNo));
	Object comHpg = map.get("COM_HPG");
	Object comDate= map.get("COM_DATE");
	//date형변환
	String comDateString = String.valueOf(comDate);
	//현재 날짜의 타입 
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	//Date로 파싱
	Date comDateNew = dateFormat.parse(comDateString);
	//변경할 타입으로의 형 변환
	String newComDate = new SimpleDateFormat("yyyy년 MM월 dd일").format(comDateNew);
	
	Object comCnt = map.get("COM_CNT");
	Object comSal = map.get("COM_SAL");
	// BigDecimal => int
	int newComSal = ((BigDecimal)comSal).intValue();
	
	Object comIntro = map.get("COM_INTRO");
	Object comDetail = map.get("COM_DETAIL");
	Object jgCodeNm = map.get("JG_CODE_NM");
	Object provCodeNm = map.get("REV_CODE_NM");
	Object cityCodeNm = map.get("CITY_CODE_NM");
	
	Object joTitle = "";
	Object joSal = "";
	Object jtCodeNm = "";
	Object rnumObj = 0;
	int jo = 0;
%>
<%! StringBuffer sb;  %>
<%

String clientId = "W4evpc4AcMh_0HsM7eU1";// 애플리케이션 클라이언트 아이디값"; 
String clientSecret = "pZoEohhS7O";// 애플리케이션 클라이언트 시크릿값";\ 
int display = 3; // 검색결과갯수. 최대100개 
try { 
	String text = URLEncoder.encode(String.valueOf(comNm), "UTF-8"); 
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
	while ((line = br.readLine()) != null) { 	sb.append(line + "\n");; 		} 
	br.close(); 
	con.disconnect();
} catch (Exception e) { 
	System.out.println(e);
} 
%>
<!-- html본문 -->

<html>

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/d3ee6ce800.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/CodePeople/js/jquery-3.6.0.min.js"></script>
<script src="/CodePeople/js/jquery.serializejson.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">



<!-- 유료서비스관련 태그 -->
<script src="/CodePeople/js/prod.js"></script>
<script src="/CodePeople/js/company.js"></script>

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
      
      addFav = document.querySelectorAll('.addFav');
      deleteFav = document.querySelectorAll('.deleteFav');
      
      
      addFav.forEach( a=>{
      	a.addEventListener('click',event=>{
      		let comCard = event.currentTarget;
      		comNoValue = comCard.getAttribute('idx');
      		console.log(comNoValue);
      		addFavCompany();
      	})
      })

      deleteFav.forEach( a=>{
      	a.addEventListener('click',event=>{
      		let comCard = event.currentTarget;
      		comNoValue = comCard.getAttribute('idx');
      		console.log(comNoValue);
      		deleteFavCompany();			
      	})
      })
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

.sal-graph {
	width: 500px;
}

.progress_wrap {
	position: relative;
	background: #9a80db;
	background: linear-gradient(90deg, #9a80db, #56a2d8 54%, #ec647e);
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

#content .card.main-rating-box {
	justify-content: space-evenly;
	width: 30%;
}

#content .card.sub-rating-box {
	width: 65%;
	margin-left: 3%;
}

.rating-card {
	justify-content: space-evenly;
	margin: 0 12px;
}

ol, ul {
	list-style: none;
	padding: 0;
}

.min_max {
	
}

.show_chart .min_max li {
	display: inline-block;
	width: 130px;
	font-size: 12px;
	font-weight: 400;
	line-height: 1.25em;
}

.show_chart .min_max li.min {
	text-align: left;
	border: 0;
	vertical-align: top;
}

.show_chart .min_max li.mdn {
	text-align: center;
	border: 0;
	vertical-align: top;
}

.show_chart .min_max li.max {
	text-align: right;
	border: 0;
	vertical-align: top;
}

.show_chart .min_max {
	padding: 0;
	box-sizing: border-box;
}

.show_chart .min_max li strong {
	display: block;
	font-size: 12px;
	font-weight: 400;
}

th {
	width: 150px;
}

#content .card-cv {
	padding-top: 0px;
}

.null {
	text-align: center;
}

.pagination {
	display: flex;
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
				<a href="${pageContext.request.contextPath}/rehearsal/home.html"
					id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
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
				<a href="/CodePeople/rehearsal/home.html"><button
						id="header-login-btn" class="btn btn-primary btn-sm">로그인</button></a>
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
						<li class="list-group-item "><a class="nav-link"
							href="/CodePeople/CompanyPagingList.do">모든 기업보기</a></li>
						<li class="list-group-item"><a class="nav-link" href="#main">상세</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#introduce">소개</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#review">리뷰</a></li>
						<li class="list-group-item"><a class="nav-link" href="#board">게시글</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#salary">연봉</a></li>
						<li class="list-group-item"><a class="nav-link" href="#hr">채용정보</a></li>
						<li class="list-group-item"><a class="nav-link" href="#news">뉴스</a></li>
					</ul>
				</div>
			</div>
			<!-- 바디 콘텐츠 -->
			<div id="content">

				<!-- 메인 -->
				<div id="main" class="content-box search-result jo my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">기업상세</h1>
						</div>
					</div>
					<!-- 검색결과 카드 -->
					<div class="intro-card card card-cv">
						<!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
						<div class="card-left">
							<% if(Integer.parseInt(comNo.toString()) > 10){ %>
							<img src="${pageContext.request.contextPath}/images/logo0.jpg" alt="Card image" style="width: 64px; height: 64px;">
							<% } else {%>
							<img src="${pageContext.request.contextPath}/images/logo<%= Integer.parseInt(comNo.toString())-1 %>.png" alt="Card image" style="width: 64px; height: 64px;">
							<% } %>
						</div>
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
							<div class="card-top-box">
								<h4 class="card-title cv-title"><a href="http://<%= comHpg%>"><%=comNm%></a></h4>
								<!-- 관심/알람 버튼 -->
								<div class="dropup">
									<button type="button"
										class="btn btn-outline-secondary dropdown-toggle btn-menu"
										data-bs-toggle="dropdown"></button>
									<!-- 카드 메뉴정보 -->
									<ul class="dropdown-menu">
										<!-- 카드 메뉴 헤더 -->
										<li>
											<h5 class="dropdown-header">관심등록</h5>
										</li>
										<!-- 카드 메뉴 옵션 -->
										<li><a class="dropdown-item addFav" idx="<%= comNo %>">관심등록</a></li>
										<li><a class="dropdown-item deleteFav" idx="<%= comNo %>">관심해제</a></li>
										<li>
									</ul>
								</div>
							</div>
							<!-- 회사소개 한마디 -->
							<div class="card-text">
								<h4 class="card-title cv-title"><%= comIntro %></h4>
							</div>
						</div>
					</div>
				</div>

				<!-- 소개 -->
				<div id="introduce" class="content-box search-result jo my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">소개</h1>
						</div>
					</div>
					<!-- 검색결과 카드 -->
					<div class="card card-cv">
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
							<div class="card-top-box"></div>
							<!-- 카드의 회사 소개, 직군 -->

							<div class="card-text">
								기업명&nbsp;&nbsp; <span class="cv-career"><%= comNm %></span>
							</div>
							<div class="card-text">
								홈페이지&nbsp;&nbsp; <span class="cv-jobgroup"><%= comHpg %></span>
							</div>
							<div class="card-text">
								직군&nbsp;&nbsp; <span class="cv-jobgroup"><%= jgCodeNm %></span>
							</div>
							<div class="card-text">
								설립일&nbsp;&nbsp; <span class="cv-jobgroup"><%= newComDate %></span>
							</div>
							<div class="card-text">
								본사위치&nbsp;&nbsp; <span class="cv-jobgroup"><%= cityCodeNm %>
									</span>
							</div>
							<div class="card-text">
								사원수&nbsp;&nbsp; <span class="cv-jobgroup"><%= comCnt %> 명</span>
							</div>
							<div class="card-text">
								평균연봉&nbsp;&nbsp; <span class="cv-jobgroup"><%= comSal %>만
									원</span>
							</div>
							<br>
							<div class="card-text">
								<p>[기업설명]<br></p> <span class="cv-jobgroup"><%= comDetail %></span>
							</div>
						</div>
					</div>
				</div>

				<!-- 리뷰 -->
				<div id="review" class="content-box search-result company">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">리뷰</h1>
						</div>
					</div>
					<!-- 검색결과 카드 -->
					<%
	if(Reviewflag == true){
		
		Object comRev = listReview.get(0).get("COM_REV");
		Object revCrr = listReview.get(0).get("REV_CRR");
		Object revSal = listReview.get(0).get("REV_SAL");
		Object revWlb = listReview.get(0).get("REV_WLB");
		Object revCul = listReview.get(0).get("REV_CUL");
		Object revExecs = listReview.get(0).get("REV_EXECS");
		Object revComt = listReview.get(0).get("REV_COMT");
		// BigDecimal => int
		newComSal = ((BigDecimal)comSal).intValue();
		int revNum = ((BigDecimal)comRev).intValue();
		int crrNum = ((BigDecimal)revCrr).intValue();
		int salNum = ((BigDecimal)revSal).intValue();
		int wlbNum = ((BigDecimal)revWlb).intValue();
		int culNum = ((BigDecimal)revCul).intValue();
		int execsNum = ((BigDecimal)revExecs).intValue();
		
%>
					<div class="card main-rating-box">
						<!-- 카드의 정보 -->


						<div class="card-body card-right">
							<div class="card-top-box">
								<h4 class="card-title">
									평점 :
									<%= comRev %>
									점
								</h4>
							</div>
							<!-- 별점 박스 스크립트로 구현필요 -->
							<div class="card-rating-box">
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int comRevStar = Math.round(revNum);
                               for (int i = 0; i < comRevStar; i++) {
                                    %>
									<span>★</span>
									<%
                               }
                               for (int i = comRevStar; i < 5; i++) {
                               		%>
									<span>☆</span>
									<%
								}
						%>
								</div>
							</div>
							<div class="card-rating-text">
								대표 리뷰코멘트 <br> <br> <i> " <%= revComt %> "
								</i>
							</div>
						</div>
					</div>
					<!-- 아래는 이미지 시현을 위한 것입니다. 위의 것을 사용해주세요 -->
					<div class="card sub-rating-box">
						<div class="card-body card-right">
							<div class="card-top-box"></div>
							<div class="card-rating-box rating-card">
								<div class="card-title">커리어 향상</div>
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int revCrrStar = Math.round(crrNum);
              			 	if(revCrrStar == 0){
              			 		for(int i = 0; i < 5; i++){
              			 			%>
									<span>☆</span>
									<%
              			 		}
              				} else {
                               for (int i = 0; i < revCrrStar; i++) {
                                    %>
									<span>★</span>
									<%
                               }
                               for (int i = revCrrStar; i < 5; i++) {
                               		%>
									<span>☆</span>
									<%
								}
              				 }
						%>
								</div>
								<%= crrNum %>점
							</div>
							<div class="card-rating-box rating-card">
								<div class="card-title">워라밸</div>
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int revWlbStar = Math.round(wlbNum);
              if(revWlbStar == 0){
			 		for(int i = 0; i < 5; i++){
			 			%>
									<span>☆</span>
									<%
			 		}
				} else {
                 for (int i = 0; i < revWlbStar; i++) {
                      %>
									<span>★</span>
									<%
                 }
                 for (int i = revWlbStar; i < 5; i++) {
                 		%>
									<span>☆</span>
									<%
					}
				 }
						%>
								</div>
								<%= wlbNum %>점
							</div>
							<div class="card-rating-box rating-card">
								<div class="card-title">사내문화</div>
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int revCulStar = Math.round(culNum);
              if(revCulStar == 0){
			 		for(int i = 0; i < 5; i++){
			 			%>
									<span>☆</span>
									<%
			 		}
				} else {
               for (int i = 0; i < revCulStar; i++) {
                    %>
									<span>★</span>
									<%
               }
               for (int i = revCulStar; i < 5; i++) {
               		%>
									<span>☆</span>
									<%
					}
				 }
						%>
								</div>
								<%= culNum %>점
							</div>

							<div class="card-rating-box rating-card">
								<div class="card-title">급여 및 복지</div>
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int revSalStar = Math.round(salNum);
              if(revSalStar == 0){
			 		for(int i = 0; i < 5; i++){
			 			%>
									<span>☆</span>
									<%
			 		}
				} else {
             for (int i = 0; i < revSalStar; i++) {
                  %>
									<span>★</span>
									<%
             }
             for (int i = revSalStar; i < 5; i++) {
             		%>
									<span>☆</span>
									<%
					}
				 }
						%>
								</div>
								<%= salNum %>점
							</div>

							<div class="card-rating-box rating-card">
								<div class="card-title">경영진</div>
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
									<% int revExecsStar = Math.round(execsNum);
              if(revExecsStar == 0){
			 		for(int i = 0; i < 5; i++){
			 			%>
									<span>☆</span>
									<%
			 		}
				} else {
           for (int i = 0; i < revExecsStar; i++) {
                %>
									<span>★</span>
									<%
           }
           for (int i = revExecsStar; i < 5; i++) {
           		%>
									<span>☆</span>
									<%
					}
				 }
						%>
								</div>
								<%= execsNum %>점
							</div>
						</div>

					</div>
					<%
	} else {
		
%>

					<p id="null">
						해당 기업에는 <br> 아직 리뷰가 존재하지 않습니다.
					</p>

					<%
	}
%>
				</div>

				<!-- 게시글 -->
				<div id="board" class="content-box search-result jo">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">게시글</h1>
						</div>
						<div class="content-box search-result board board-main board-life">
							<div class="board-header">
								<div class="board-name">
									<i class="fas fa-building"></i>&nbsp;
									<h1 class="h1">회사생활</h1>
								</div>
								<div class="board-btn-box">
									<a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1"><button
											type="button" class="btn btn-outline-primary">더보기 ></button></a>
								</div>
							</div>
							<div class="divider"></div>
							<div class="board-card">
								<div class="board-detail">
									<a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1"
										class="card-link"><span class="board-title">야근 너무 많이 하는 회사 어떡해요</span></a>&nbsp;&nbsp;
									<div class="view-box">
										<i class="far fa-eye"></i>&nbsp;<span
											class="board-view board-sm-font">100</span>
									</div>
								</div>
							</div>
							<!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
							<div class="board-card">
								<div class="board-detail">
									<a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1"
										class="card-link"><span class="board-title">사수가 말 심하게 하면 대응방법 뭐 없나요.</span></a>&nbsp;&nbsp;
									<div class="view-box">
										<i class="far fa-eye"></i>&nbsp;<span
											class="board-view board-sm-font">100</span>
									</div>
								</div>
							</div>
							<div class="board-card">
								<div class="board-detail">
									<a href="/CodePeople/EachBoardPaging.do?currentPageNo=1&boardCode=1"
										class="card-link"><span class="board-title">2021년 연봉계약 아직 안한회사 있나요??</span></a>&nbsp;&nbsp;
									<div class="view-box">
										<i class="far fa-eye"></i>&nbsp;<span
											class="board-view board-sm-font">100</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 연봉 -->
				<div id="salary" class="content-box search-result jo">
					<div class="my-box-header">
						<h1 class="h1">연봉</h1>
					</div>
					<div class="sal-graph">
						<div class="my-box-item">
							<div class="chart_wrap">
								<div class="show_chart">
									<div class="comparison_chart">
										<div class="chart_bx">
											<div class="progress_wrap">
												<span class="dot_min"></span> <span class="dot_med"></span>
												<span class="dot_max"></span>
												<!---->
											</div>
										</div>
										<div class="min_max">
											<br>
											<ul>
												<li class="min"><strong>최소연봉</strong> <span class="cnt"><%= Math.round(newComSal*0.7) %>만원</span>
												</li>
												<li class="mdn"><strong>평균연봉</strong> <span class="cnt"><%= newComSal %>만원</span>
												</li>
												<li class="max"><strong>최대연봉</strong> <span class="cnt"><%= Math.round(newComSal*1.3) %>만원</span>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="more_wrap">
									<!---->
									<div class="show_table">
										<div class="side_add">
											<h4>추가 보상</h4>
											<table class="tbl">
												<thead>
													<tr>
														<th class="type">유형</th>
														<th class="mid">중앙값</th>
														<th class="total">범위</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="type">보너스</td>
														<td class="mid">
															<div><%= newComSal/10 %>만원
															</div>
														</td>
														<td class="total">
															<div><%= newComSal/20 %>만원 ~
																<%= newComSal/5 %>만원
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!---->
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 채용정보  -->
				<div id="hr"
					class="content-box  search-result payment-desc my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">채용</h1>
						</div>
					</div>
					<!-- 바디 콘텐츠 -->
					<div id="content">
						<form id="formTest" style="display: none;">
							<input type="hidden" name="JG_CODE_NO" class="jg-code-hidden">직군
							<input type="hidden" name="JT_CODE_NO" class="jt-code-hidden">직무
							<input type="hidden" name="PL_CODE_NO" class="pl-code-hidden">활동분야
							<input type="hidden" name="SAL_TYPE" class="sal-type-hidden">연봉
							<input type="hidden" name="PROV_CODE_NO" class="city-code-hidden">지역
							<input type="hidden" name="CITY_CODE_NO" class="prov-code-hidden">도시
							<input type="hidden" name="STATE" class="state-hidden">진행상태
							<input type="hidden" name="EDU_CODE_NO" class="edu-code-hidden">학력
							<input type="hidden" name="CRR_YEARS_TYPE"
								class="crr-type-hidden">경력 <input type="hidden"
								name="CERT_CODE_NO" class="cert-code-hidden">자격증 <input
								type="hidden" name="HCNT_TYPE" class="hcnt-type-hidden">인원
							<button id="postTest" value="test" type="button">테스트</button>
							<input type="reset" value="reset"></input>
						</form>

						<div class="content-box search-result jo" id="joCardList">
							<!-- 검색결과 카드 -->

							<%

	if(joflag == true){
    
	//채용공고 카드번호를 위한 변수선언
	String ed0 = String.valueOf(listjo.get(jo).get("JO_EDATE"));
	String ed1 = ed0.substring(4, 6);
	String ed2 = ed0.substring(6, 8);
	String joEdate = ed1 + "/" + ed2;
	
	String sd0 = String.valueOf(listjo.get(jo).get("JO_SDATE"));
	String sd1 = sd0.substring(4, 6);
	String sd2 = sd0.substring(6, 8);
	String joSdate = sd1 + "/" + sd2;
	
	
	
%>

							<div class="card card-jo">
								<!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->


								<div class="card-left">
									<img src="${pageContext.request.contextPath}/images/logo<%= comNoInt-1 %>.png"
										alt="Card image" style="width: 64px; height: 64px;">
								</div>
								<!-- 카드의 정보 -->
								<div class="card-body card-right">
									<div class="card-top-box">
										<h4 class="card-title"><%= comNm %></h4>
									</div>
									<!-- 카드의 회사 소개, 직군 -->
									<div class="card-text card-jobs-detail-company-intro">
										<span class="company-intor"><%= comIntro %></span>
									</div>
									<div class="card-text card-jobs-detail-company-jobgroup">
										<span class="company-jobgroup"><%= jgCodeNm %></span>
									</div>

									<!-- 카드의 채용공고 박스 -->
									<div class="card-jobs-detail">
										<div class="divider"></div>
										<div class="jobs-detail-top">
											<div class="jobs-detail">
												<a href="/CodePeople/JOCardDetil.do?joNo=<%= (comNoInt - 1) * 15 + 2 %>" class="card-link"><span class="jo-title">
														<%=	listjo.get(jo).get("JO_TITLE") %>
												</span></a>&nbsp;&nbsp; <span class="jo-salary jo-sm-font">연봉 <%= listjo.get(jo).get("JO_SAL") %>만원
												</span> <span class="jo-sm-font">/</span> <span
													class="jo-career jo-sm-font">경력</span>
											</div>
											<div class="dropup">
												<button type="button"
													class="btn btn-outline-secondary dropdown-toggle btn-menu"
													data-bs-toggle="dropdown"></button>
												<!-- 카드 메뉴정보 -->
												<ul class="dropdown-menu">
													<!-- 카드 메뉴 헤더 -->
													<li>
														<h5 class="dropdown-header">관심등록</h5>
													</li>
													<!-- 카드 메뉴 옵션 -->
													<li><a class="dropdown-item" href="#">스크랩</a></li>
													<li>
														<h5 class="dropdown-header">알람설정</h5>
													</li>
													<li><a class="dropdown-item" href="#">알람등록</a></li>
												</ul>
											</div>
										</div>

										<span class="card-text jo-sm-font"><%= listjo.get(jo).get("JT_CODE_NM") %></span>&nbsp;&nbsp;
										<span class="jo-start jo-sm-font"><i
											class="far fa-calendar-alt">&nbsp;</i> <%= joSdate %> </span> &nbsp;<span
											class="jo-start jo-sm-font">~</span>&nbsp; <span
											class="jo-end jo-sm-font"><i
											class="far fa-calendar-alt">&nbsp;</i> <%= joEdate %> </span>
										<div class="container mt-3" id="result-page-box"></div>

									</div>

								</div>

							</div>
						</div>
						<!-- 페이징 처리를 위한 박스 -->

					</div>
					<% }else{ %>


					<p>현재 채용공고가 없습니다.</p>


					<% } %>
				</div>

				<!-- 뉴스 -->
				<div id="news"
					class="content-box  search-result payment-desc my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">뉴스</h1>
						</div>
						<div class="content-box search-result board board-main board-best">
							<div class="board-header">
								<div class="board-name">
									<i class="fas fa-crown"></i>&nbsp;
									<h1 class="h1">관련뉴스</h1>
								</div>
							</div>
							<div class="divider"></div>
						
							<% for(int i = 0; i < 3; i++){ %>
							<div class="board-card">
								<div class="board-detail">
									<a href="#" class="card-link" id="newsLink<%= i %>"><span class="board-title" id="newsTitle<%= i %>"></span></a>&nbsp;&nbsp;
									<div class="view-box">
										<i class="far fa-eye"></i>&nbsp;<span
											class="board-view board-sm-font" id="newsDate<%= i %>"></span>
									</div>
								</div>
							</div>
							<% } %>
							<script>	
	<%! char ch = 'a'; %>
	var json = <%= sb.toString() %>
	<% boolean newsflag = false; %>
	if(json.items == null){
		<% newsflag = false; %>
	} else {
		<% newsflag = true; %>
		var items = json.items;
		var news = [];
	<% for(int i = 0; i < 3; i++){%>
		news = [];
		news.<%=ch %> = items.pop();
		var title = news.<%=ch %>.title;
		console.log(title);
		var link = news.<%=ch %>.link;
		console.log(link);
		var date = news.<%=ch++ %>.pubDate;
		console.log(date);
		$('#newsLink<%= i %>').attr('href',link);
		$('#newsTitle<%= i %>').html(title);
		$('#newsDate<%= i %>').text(date);
	<% } %>
	}
</script>
							<!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="favComForm">
		<input type="hidden" id="comNo" name="comNo" value="1"> 
		<% if(hrNo == 0){ %>
		<input type="hidden" id="hrNo" name="hrNo" value="1">
		<% } else { %>
		<input type="hidden" id="hrNo" name="hrNo" value="<%= hrNo %>">
		<% } %>
	</form>

</body>
<script>
</script>
</html>

