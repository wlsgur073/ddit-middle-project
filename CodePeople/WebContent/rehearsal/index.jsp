<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.cmm.util.SessionCheck"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int memCode = 0;
int memNo = 0;
int hrNo = 0;
int cnt = 0;
int comNo = 0;
MemberVO vo = new MemberVO();
CompanyVO cv = null;

String myProfileImg = "/CodePeople/images/helloHome.png";
String myPage = "";

if(SessionCheck.isLoginMember(session)){
   vo = (MemberVO) session.getAttribute("memVO");

 	memCode = 0; // 비회원
 	
 	if(vo.getMemIsApi() == 1){
 		myProfileImg = vo.getMemImgUrl();
 	}
	
	if(vo.getMemCode() == 1){				// 개인회원
		memCode = vo.getMemCode();
		myPage = "/CodePeople/mainJsp/myPagePerson.jsp";
	} else if (vo.getMemCode() == 2){		// 기업회원
		memCode = vo.getMemCode();
		myPage = "/CodePeople/rehearsal/myPageCompany.html";
	} else if(vo.getMemCode() == 3){		// 관리자
		memCode = vo.getMemCode();
		myPage = "/CodePeople/rehearsal/myPageAdmin.html";
	}
}else{
	
	%> <script> location.href="/CodePeople/rehearsal/home.html";</script> <%
	
}
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title><%=vo.getMemId() %>님 환영합니다!</title>
    
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/heroes/">
    
    <!-- Etc -->
    <script src="https://kit.fontawesome.com/d3ee6ce800.js" crossorigin="anonymous"></script>
    <script src="/CodePeople/js/jquery-3.6.0.min.js"></script>
    <script src="/CodePeople/js/jquery.serializejson.min.js"></script>
    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/CodePeople/css/main.css">
    <link rel="stylesheet" href="/CodePeople/css/intro.css">
    <link rel="stylesheet" href="/CodePeople/css/serch.css">
    
    <!-- External login lib -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/api.js" async defer
    onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>
    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    <script src="/CodePeople/js/googleLogin2.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="/CodePeople/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
  </head>
  <body>
    <!-- 헤더 -->
    <div id="header">
      <!-- 헤더 메인 메뉴 바 -->
      <div id="header-container">
        <!-- 좌측 메뉴 -->
        <div id="header-left-menu">
          <!-- 로고 -->
          <a href="#" id="logo"><i class="fas fa-copyright" style="font-size: 32px;"></i></a>
          <div class="divider"></div>
          <!-- 검색창 -->
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
          <%if(vo.getMemIsApi() == 1){ %>
          <a href="javascript:kakaoLogout()"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
          <%} else { %>
          <a href="/CodePeople/rehearsal/logout.jsp" onclick="alert(`로그아웃되었습니다.`)"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
          <%} %>
        </div>
      </div>
    </div>
    
    <!-- 인트로 메인화면 -->
    <main>

      <div class="home-first">
        <div class="container col-10 col-xxl-8 px-4 py-5">
          <div class="row align-items-center g-lg-5 py-5">
            <div class="col-lg-7 text-center text-lg-start">
              <!-- <h1 class="display-4 fw-bold lh-1 mb-3"></h1> -->
              <p class="col-lg-10 fs-4">
                <img src="/CodePeople/images/home.jpg" alt="이미지 파일" width="620px" height="auto">
              </p>
            </div>
            <div class="col-md-10 mx-auto col-lg-5">
              <form class="p-4 p-md-5 border rounded-3 bg-light">
                <div class="profile">
                  <h2 class="mb-4">printf("hello world!");</h2>
                  <a href="<%=myPage%>">
                    <img id="profile-img" class="ui circular image" src="<%=myProfileImg %>" alt="프로필이미지">
                    <p class="profile-name"><%=vo.getMemNm() %></p>
                  </a>
                  <!-- <p class="nowrap meta">
                    마이페이지 넣어도 좋고, 나중에 기능 추가 가능
                      <a href="/@kimjihyunii">
                      <span class="job-title">TA</span>&nbsp;</a>
                    <a href="/companies/woowahan">@카카오</a> 
                  
                  </p> -->
                  <p class="break testimonial">
                    	코드피플에 오신 걸 환영합니다!<br>
                    	다양한 소식을 받아보세요.
                  </p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- popup for ID -->
      <div class="modal fade" id="id_form" tabindex="-1" aria-labelledby="searchIdLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              <p class="modal-title" id="searchIdLabel">아이디 찾기</p>
            </div>
            <div class="modal-body">
              <div class="request">
                <div class="basic header">
                  <p>가입하신 이름과 이메일 주소를 입력해 주세요.</p>
                </div>
                <div class="mb-2">
                  <label for="name" class="form-label">이름</label>
                  <input type="text" id="name" class="form-control" value="" />
                </div>
                <div>
                  <label for="email" class="form-label">이메일 주소</label>
                  <input type="email" id="email" class="form-control" value="" />
                </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">찾기</button>
                </div>
                </div>
          </div>
        </div>
      </div>

      <!-- popup for Password -->
      <div class="modal fade" id="pass_form" tabindex="-1" aria-labelledby="searchPassLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              <p class="modal-title" id="searchPassLabel">비밀번호 찾기</p>
            </div>
            <div class="modal-body">
              <div class="request">
                <div class="basic header">
                  <p>가입하신 아이디와 이메일 주소를 입력해 주세요.</p>
                </div>
                <div class="mb-2">
                  <label for="id" class="form-label">비밀번호</label>
                  <input type="text" id="id" class="form-control" value="" />
                </div>
                <div>
                  <label for="email" class="form-label">이메일 주소</label>
                  <input type="email" id="email" class="form-control" value="" />
                </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary">찾기</button>
                </div>
                </div>
          </div>
        </div>
      </div>
    
      <div class="home-second">

        <div class="mt-5 text-center">
  
          <h3 class="display-6 fw-bold">코드피플에 있는 사람들과 연결해보세요.</h3>
          <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">다양한 분야의 사람들과 기업들이 교류하고 있는 코드피플 커뮤니티에 합류하세요!</p>
            
            <div class="d-grid gap-2 justify-content-sm-center">
              <div class="user-list">
                <div class="item">
                  <a href="#">
                    <img class="ui circular image" src="/CodePeople/images/blue.jpg" alt="김진혁">
                    <p class="name">김진혁</p>
                  </a>
                  <p class="nowrap meta">
                    <a href="#">
                      <span class="job-title">TA</span>&nbsp;</a>
                    <a href="/companies/woowahan">@카카오</a>
                  </p>
                  <p class="break testimonial">
                    Salanghaeyo kakao. salanghaeyo gimbeomsu hyeongnim.
                  </p>
                </div>
  
                <div class="item">
                  <a href="#">
                    <img class="ui circular image" src="/CodePeople/images/pink.jpg" alt="마창수">
                    <p class="name">마창수</p>
                  </a>
                  <p class="nowrap meta">
                    <a href="#">
                      <span class="job-title">DA</span>&nbsp;</a>
                    <a href="/companies/naver">@MicroSoft</a>
                  </p>
                  <p class="break testimonial">
                    La empresa desarrolla, manufactura, licencia y provee soporte de software para computadores personales, servidores, dispositivos electrónicos y servicios.
                  </p>
                </div>
  
                <div class="item">
                  <a href="#">
                    <img class="ui circular image" src="/CodePeople/images/red.jpg" alt="이광효">
                    <p class="name">이광효</p>
                  </a>
                  <p class="nowrap meta">
                    <a href="#">
                      <span class="job-title">PL (팀장)</span>&nbsp;</a>
                      <a href="/companies/yanolja">@네이버</a>
                    </p>
                  <p class="break testimonial">
                    I am a leader. i am a leader. i am a leader. i am a DBA
                  </p>
                </div>
  
                <div class="item">
                  <a href="#">
                    <img class="ui circular image" src="/CodePeople/images/yellow.jpg" alt="임나리">
                    <p class="name">임나리</p>
                  </a>
                  <p class="nowrap meta">
                    <a href="#"><span class="job-title">UA</span>&nbsp;</a>
                    <a href="/companies/sendbird">@애플</a></p>
                  <p class="break testimonial">
                    Trust me, Apple is the best company in the world. SamSung? who cares (lol)
                  </p>
              
                </div>
                <div class="item">
                  <a href="#">
                    <img class="ui circular image" src="/CodePeople/images/green.jpg" alt="양기욱">
                    <p class="name">양기욱</p>
                  </a>
                  <p class="nowrap meta"><a href="/@iamzenon">
                    <span class="job-title">AA</span>&nbsp;</a>
                    <a href="/companies/cupist">@구글</a></p>
                  <p class="break testimonial">
                    Google is the best. simply say, there is no company can follow Google's convenience. Apple? poo~ (laughing)
                  </p>
                </div>
              </div>
  
              <div class="company-list">
                <div class="item">
                <a href="https://toss.im/career">
                  <img class="ui circular image" src="https://image.rocketpunch.com/company/233/vivarepublica_logo_1548980012.png?s=100x100&amp;t=inside" alt="비바리퍼블리카(토스)">
                  <p class="name">비바리퍼블리카(토스)</p>
                </a>
                <p class="break testimonial">
                  금융이 쉬워진다 Toss토스팀은 금융의 문제를 해결하려 합니다.
                </p>
              </div>
              
              <div class="item">
                <a href="https://team.daangn.com/jobs/">
                  <img class="ui circular image" src="/CodePeople/images/Daangeun_Logo.jpg" alt="당근마켓">
                  <p class="name">당근마켓</p>
                </a>
                <p class="break testimonial">
                  	이웃이 알려주는 진짜 우리 동네 정보, 내 근처에 숨어있는 좋은 가게를 발견하고, 이웃과 함께 소소한 일상을 나눌 수 있는 따뜻하고 풍요로운 동네 생활을 꿈꿔요.
                </p>
              </div>
              
              <div class="item">
                <a href="https://recruit.navercorp.com/naver/recruitMain">
                  <img class="ui circular image" src="https://seoulsochic.com/skin/m_modern/images/button/naver-icon.png" alt="네이버">
                  <p class="name">네이버</p>
                </a>
                <p class="break testimonial">
                국내  No. 1 검색 포털 네이버, 국내 최초 어린이 전용 포털 쥬니어네이버,
                 국내 최초 온라인 기부 포털 해피빈을 운영하고 있는 국내 최고의 인터넷
                  전문 기업입니다.
                </p>
              </div>
              
              <div class="item">
                <a href="https://www.woowahan.com/">
                  <img class="ui circular image" src="https://officen.azureedge.net/upload/editor/53600b76-ac7b-4a56-9b2f-161655dbcb5f.jpg" alt="우아한형제들">
                  <p class="name">우아한형제들</p>
                </a>
                <p class="break testimonial">
                  세상의 발전에 도움이 되고
                  세상을 조금 더 ‘우아~’하게 만들 수 있는 기업이 되기 위해 노력하고 있습니다.
                </p>
              </div>
              
              <div class="item">
                <a href="https://careers.kakao.com/index">
                  <img class="ui circular image" src="https://t1.kakaocdn.net/kakaocorp/corp_thumbnail/Kakao.png" alt="카카오">
                  <p class="name">카카오</p>
                </a>
                <p class="break testimonial">
                  카카오는 시공간의 한계를 뛰어넘어 사람과 사람, 사람과 세상을 이어줍니다.
                  연결의 혁신으로 세상은 더욱 가깝고 새로워진다고 카카오는 믿습니다.
                </p>
              </div>
            </div>
            </div>
  
          </div>
        </div>

      </div>
    
      <div class="home-third">
        <div class="container col-xxl-8 px-4 py-5">
          <div class="row align-items-center g-5 py-5">
            <div class="col-lg-6">
              <h2 class="fw-bold lh-1 mb-3 bt-6">좋은 회사, 좋은 인력이 소통하는 공간을 만드는 코드피플이 되겠습니다.</h2>
              <p class="lead">나와 연결된 사람과 내가 연결한 기업의 소식을 받아보고, 관심 태그 기반으로 다양한 소식도 받아보세요. 흥미로운 사람이 있다면 관심 등록을 할수도 있습니다.</p>
              <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <!-- <button type="button" class="btn btn-primary btn-lg px-4 me-md-2">Primary</button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Default</button> -->
              </div>
            </div>
            <div class="col-10 col-sm-8 col-lg-6">
              <img src="../images/timeline2.png" alt="Bootstrap Themes" width="610"
                height="597" loading="lazy">
            </div>
          </div>
        </div>
      </div>
    
      <div class="home-fourth py-5">
        <div class="container my-5">
          <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
            <div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
              <h1 class="display-4 fw-bold lh-1">코드피플은 기업과 개인간의 소통의 장소입니다.</h1>
              <p class="lead">내가 관심 있는 기업들을 팔로우하고 그 기업들의 뉴스, 채용 정보 등, 다양한 정보를 발견해 보세요.</p>
              <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">
                <!-- <button type="button" class="btn btn-primary btn-lg px-4 me-md-2 fw-bold">Primary</button>
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Default</button> -->
              </div>
            </div>
            <div class="col-lg-4 offset-lg-1 p-0 overflow-hidden shadow-lg">
              <img class="rounded-lg-3" src="../images/jobs.png" alt="" width="720">
            </div>
          </div>
        </div>
      </div>
    
    
      <div class="home-fifth">
        <div class="bg-dark text-secondary text-center">
          <div class="py-2">
            <!-- <h1 class="display-5 fw-bold text-white  ">footer 양식 넣어주세요.</h1> -->
            <div class="col-lg-6 mx-auto">
              <p class="mb-4">
                상호명: 얼씨구 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                대표자 : 얼씨구 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                사업자등록번호: 000-11-00000 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                직업정보제공사업 신고번호: J1206020160003 <br>
                주소 : 서울특별시 서초구 강남대로51길 10 15층 1519호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 전화번호 : 02-877-7624 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이메일 : startup@rocketpunch.com
              </p>
              <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <!-- <button type="button" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">Custom button</button>
                <button type="button" class="btn btn-outline-light btn-lg px-4">Secondary</button> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    
    </main>
  </body>

  <script src="/CodePeople/js/kakaoLogin.js"></script> 
  <script src="/CodePeople/js/naverLogin.js"></script> 
</html>
