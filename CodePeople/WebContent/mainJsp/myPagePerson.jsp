<%@page import="kr.or.ddit.jobOpening.vo.JOCardVO"%>
<%@page import="kr.or.ddit.jobOpening.service.JobOpeningServiceImpl"%>
<%@page import="kr.or.ddit.jobOpening.service.IJobOpeningService"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.company.vo.CompanyVO"%>
<%@page import="kr.or.ddit.company.service.CompanyServiceImpl"%>
<%@page import="kr.or.ddit.company.service.ICompanyService"%>
<%@page import="kr.or.ddit.hr.vo.HRMyInfoVO"%>
<%@page import="kr.or.ddit.hr.service.HRServiceImpl"%>
<%@page import="kr.or.ddit.hr.service.IHRService"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% 
  
MemberVO loginMember = session.getAttribute("memVO") == null?
             null : (MemberVO)session.getAttribute("memVO");
IMemberService memberService = MemberServiceImpl.getInstance();
int memNo = loginMember.getMemNo();

IHRService hrService = HRServiceImpl.getInstance();
int hrNo = hrService.getHrNo(memNo);	

HRMyInfoVO myInfoVO = hrService.selectMyInfo(memNo);
// HR Detail page visit count
int hrCnt = myInfoVO.getHrCnt();
	
ICompanyService comService = CompanyServiceImpl.getInstance();
List<CompanyVO>  folComList = comService.getFolCompany(hrNo);
List<CompanyVO> favComList = comService.getFavCompany(hrNo);

IJobOpeningService joService = JobOpeningServiceImpl.getInstance();
List<JOCardVO> clipList = joService.getClipByHR(hrNo);
List<JOCardVO> applyList = joService.getApplyByHR(hrNo);
  
  %>
<!DOCTYPE html>
<html lang="en">

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
<link rel="stylesheet" href="../css/main.css">

<script src="../js/myPagePerson.js"></script>

<!--캘린더 관련 태그   -->
<link href='../css/myCalendar.css' rel='stylesheet' />
<link href='../css/myCalendar.min.css' rel='stylesheet' />
<script src='../js/myCalendarLocales-all.js'></script>
<script src='../js/myCalendar.js'></script>
<script src='../js/myCalendar.min.js'></script>
<!-- 유료서비스관련 태그 -->
<script src="../js/prod.js"></script>


<script>

 document.addEventListener('DOMContentLoaded', ()=> {
    
	
	 
    const calendarEl = document.querySelector('#myCalendar');
       
    

 /*    let memNo = 1; 
     //화면 로딩 시 자동으로 mwmNo를 저장하도록 한다.
     
     
    let goInfoBtn = document.querySelector('#goInfoBtn');
     console.log(goInfoBtn);
     goInfoBtn.addEventListener('click',()=>{
   	 console.log('click');
   	  $.ajax({
	    		url : '/CodePeople/HRMyInfo.do',
	    		type : 'get',
	    		data : {"memNo" :memNo},
	    		dataType : 'json',
	    		success : function(res){
	    			console.log(res);
	    		},
	    		error : function(xhr){
	    			alert(`status : ${xhr.status}\ntext : ${xhr.statusText}`);
	    		}
	    	})
     })
     */
    
    
    
        var calendar = new FullCalendar.Calendar(calendarEl, {
           headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
              },   
          locale: 'ko',    
          editable: true,
          initialView: 'dayGridMonth',
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          select: function(arg) {
            var title = prompt('추가할 일정을 입력해주세요.');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }
            calendar.unselect()
          },
          eventClick: function(arg) {
            if (confirm('일정을 삭제하시겠습니까?')) {
              arg.event.remove()
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
            {
              title: 'All Day Event',
              start: '2020-09-01'
            },
            {
              title: 'Long Event',
              start: '2020-09-07',
              end: '2020-09-10'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2020-09-09T16:00:00'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2020-09-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2020-09-11',
              end: '2020-09-13'
            },
            {
              title: 'Meeting',
              start: '2020-09-12T10:30:00',
              end: '2020-09-12T12:30:00'
            },
            {
              title: 'Lunch',
              start: '2020-09-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2020-09-12T14:30:00'
            },
            {
              title: 'Happy Hour',
              start: '2020-09-12T17:30:00'
            },
            {
              title: 'Dinner',
              start: '2020-09-12T20:00:00'
            },
            {
              title: 'Birthday Party',
              start: '2020-09-13T07:00:00'
            },
            {
              title: 'Click for Google',
              url: 'http://google.com/',
              start: '2020-09-28'
            }
          ]
          
        });
        
        
        
        calendar.render();
        
        
     
      });

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

<style>
		.list-group .memInfo {
			cursor: pointer;
		}

		.list-group .infoList {
			display: none;
			padding: 0px;
		}
		.list-group .infoList li:hover{
			filter: brightness(95%); 
		}
		.preRemain{
			border : 1px solid silver;
			margin-bottom : 14px;
			border-radius: 0.8em;
			text-align: center;
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
				<a href="/CodePeople/rehearsal/index.jsp" id="logo"><i class="fas fa-copyright"
					style="font-size: 32px;"></i></a>
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
            <a class="header-link myPage" href="/CodePeople/GoMyPage.do">마이페이지</a>
				</div>
				<div class="divider"></div>
				<!-- 로그인버튼 -->
				<a href="/CodePeople/rehearsal/logout.jsp"><button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button></a>
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
						<li class="list-group-item"><a class="nav-link" href="/CodePeople/HRMyInfo.do">인재정보</a>						
						</li>
						
						<li class="list-group-item"><a class="nav-link"
							href="#fav-company">관심기업</a></li>
						<li class="list-group-item"><a class="nav-link"
							href="#fav-jo">관심공고</a></li>
							<li class="list-group-item"><a class="nav-link"
							href="#apply-jo">지원공고</a></li>
						<li class="list-group-item"><a class="nav-link" href="#myCalendar">캘린더</a></li>
				
						<li class="list-group-item"><a class="nav-link" href="#peoplePayment">유료서비스</a></li>
							<li class="list-group-item"><a class="nav-link memInfo">회원정보</a>
							<ul class="infoList">
								<li class="list-group-item"><a class="nav-link" href="/CodePeople/rehearsal/memUpdate.jsp">회원정보수정</a></li>
								<li class="list-group-item"><a class="nav-link" href="/CodePeople/rehearsal/memDelete.jsp">회원탈퇴</a></li>
								<li class="list-group-item"><a class="nav-link" href="/CodePeople/rehearsal/memCertification.html">재직증명신청</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- 바디 콘텐츠 -->
			<div id="content">
				<!-- 마이페이지 -->

				<div class="content-box search-result" >
						<div class="card" style="align-items: baseline;">
						<h4 class="card-header">내정보 열람</h4>
						<div style="margin-right:50px;"></div>
						<h5 class="card-text" style="text-align: center;"><%=hrCnt %></h5>
						</div>
						<div class="card" style="align-items: baseline;">
						<h4 class="card-header">인재 인기도</h4>
						<div style="margin-right:50px;"></div>						
						<h5 class="card-text" style="text-align: center;"><%=folComList.size() %></h5>
						</div>
						<div class="card" style="align-items: baseline;">
						<h4 class="card-header">채용 지원</h4>
						<div style="margin-right:50px;"></div>
						<h5 class="card-text" style="text-align: center;"><%=applyList.size() %></h5>
						</div>
						<div class="card" style="align-items: baseline;">
						<h4 class="card-header">관심 기업</h4>
						<div style="margin-right:50px;"></div>
						<h5 class="card-text" style="text-align: center;"><%=favComList.size() %></h5>
						</div>
						
				</div>
				<!-- 관십기업 박스 -->
				<div id="fav-company" class="content-box search-result company">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">관심기업</h1>
						</div>
					</div>
					
<%
if (favComList.size()==0){
%>	
	<p style="text-align: center;">등록한 관심기업이 없습니다.</p>
<%	
}else{
	for (int i = 0; i < favComList.size(); i++){
		CompanyVO favCom = favComList.get(i); 
%>
					<!-- 검색결과 카드 -->
					<div class="card" idx="<%=favCom.getComNo()%>">
						<!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
						<div class="card-left">
						<img src="/CodePeople/images/logo<%=i %>.png" alt="Card image" style="width:64px; height: 64px;">
						</div>
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
							<div class="card-top-box">
								<a href="/CodePeople/CompanyDetailList.do?comNo=<%=favCom.getComNo()%>" class="card-link">
								<h4 class="card-title"><%=favCom.getComNm()%></h4></a>
							</div>
							<!-- 별점 박스 스크립트로 구현필요 -->
							<div class="card-rating-box">
								<div class="card-rating-star">
									<!-- 채우기는 자바스크립트로 -->
			<% 
			if(favCom.getComRev()!=null){
				int comRevStar = Math.round(favCom.getComRev());	
				for (int j = 0; j < comRevStar; i++) {
			%>
			<span>★</span>
			<% 
				}for (int j = comRevStar; j < 5; i++) { 
			%>
			<span>☆</span>
				</div>
								<div class="card-rating-text">(<%=comRevStar %>)</div>
			<% 
				} 
			}else{
			%>
			<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
			</div>
								<div class="card-rating-text">정보없음</div>
			<%	
			}
			%>
							
							</div>
							<!-- 카드의 기업정보 이동링크 -->
							<a href="/CodePeople/CompanyDetailList.do?comNo=<%=favCom.getComNo()%>#review" class="card-link">리뷰</a>
							<a href="/CodePeople/CompanyDetailList.do?comNo=<%=favCom.getComNo()%>#board" class="card-link">게시물</a>
							<a href="/CodePeople/CompanyDetailList.do?comNo=<%=favCom.getComNo()%>#salary" class="card-link">연봉</a>
							<a href="/CodePeople/CompanyDetailList.do?comNo=<%=favCom.getComNo()%>#hr" class="card-link">채용</a>
						</div>
					</div>

<%
	}
}
%>					
				
				</div>
				
				
				<!-- 관심공고 박스 -->
				<div id="fav-jo" class="content-box search-result jo">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">관심공고</h1>
						</div>

					</div>
<%
if(clipList.size()==0){
%>
	<p style="text-align: center;">스크랩한 공고가 없습니다.</p>
<%
}else{
	for(int i = 0; i<clipList.size(); i++){
		JOCardVO clip = clipList.get(i);    
      String comSal = "";
      if (clip.getJoSal()==0){
    	  comSal="정보없음";
      }else if(clip.getJoSal()<=2000){
    	  comSal="0-2000만원";
      }else if(clip.getJoSal()<=2500){
    	  comSal="2000-2500만원";
      }else if(clip.getJoSal()<=3000){
    	  comSal="2500-3000만원";
      }else if(clip.getJoSal()<=4000){
    	  comSal="3000-4000만원";
      }else if(clip.getJoSal()<=5000){
    	  comSal="4000-5000만원";
      }else{
    	  comSal="5000만원 이상";
      }
 	  String rank ="";
 	  if(i%2==0){
 		  rank="경력";
 	  }else{
 		 rank="신입";
 	  }
 	
 			  
%>		
					<!-- 검색결과 카드 -->
					<div class="card card-jo">
						<!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
						<div class="card-left">
							<img src="/CodePeople/images/logo<%=i %>.png" alt="Card image"
								style="width: 64px; height: 64px;">
						</div>
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
							<div class="card-top-box">
								<a href="/CodePeople/JOCardDetil.do?joNo=<%=clip.getJoNo()%>"><h4 class="card-title"><%=clip.getJoTitle() %></h4></a>
							</div>
							<!-- 카드의 회사 소개, 직군 -->
							<div class="card-text card-jobs-detail-company-intro">
								<span class="company-intor"><%=clip.getComIntro() %></span>
							</div>
							<div class="card-text card-jobs-detail-company-jobgroup">
								<span class="company-jobgroup"><%=clip.getJgCodeNm() %></span>
							</div>
							<!-- 카드의 채용공고 박스 -->
							<div class="card-jobs-detail">
								<div class="divider"></div>
								<div class="jobs-detail-top">
									<div class="jobs-detail">
										<a href="#" class="card-link"><span class="jo-title"><%=clip.getComNm() %></span></a>&nbsp;&nbsp; 
										<span
											class="jo-salary jo-sm-font"><%=comSal %></span> 
											<span
											class="jo-sm-font">/</span> 
											<span
											class="jo-career jo-sm-font"><%=rank %></span>
									</div>
									
								</div>

	                   <span class="card-text jo-sm-font"><%=clip.getJgCodeNm() %></span>&nbsp;&nbsp;
                        <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>
                        <%=clip.getJoSdate().substring(0, 4) %>.
                        <%=clip.getJoSdate().substring(4, 6) %>.
                        <%=clip.getJoSdate().substring(6) %>
                            </span>
                            &nbsp;<span class="jo-start jo-sm-font">~</span>&nbsp;
                        <span class="jo-end jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i> 
                        <%=clip.getJoEdate().substring(0, 4) %>.
                        <%=clip.getJoEdate().substring(4, 6) %>.
                        <%=clip.getJoEdate().substring(6) %>
                            </span>
							</div>
						</div>
					</div>		
<%		
	}
%>
<%	
}
%>
				</div>
				
				
				<!-- 지원 공고 박스 -->
				<div id="apply-jo" class="content-box search-result jo">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">지원공고</h1>
						</div>

					</div>
<%
if(applyList.size()==0){
%>
	<p style="text-align: center;">지원한 공고가 없습니다.</p>
<%
}else{
	for(int i = 0; i<applyList.size(); i++){
		JOCardVO clip = applyList.get(i);    
      String comSal = "";
      if (clip.getJoSal()==0){
    	  comSal="정보없음";
      }else if(clip.getJoSal()<=2000){
    	  comSal="0-2000만원";
      }else if(clip.getJoSal()<=2500){
    	  comSal="2000-2500만원";
      }else if(clip.getJoSal()<=3000){
    	  comSal="2500-3000만원";
      }else if(clip.getJoSal()<=4000){
    	  comSal="3000-4000만원";
      }else if(clip.getJoSal()<=5000){
    	  comSal="4000-5000만원";
      }else{
    	  comSal="5000만원 이상";
      }
 	  String rank ="";
 	  if(i%2==0){
 		  rank="경력";
 	  }else{
 		 rank="신입";
 	  }
 	
 			  
%>		
					<!-- 검색결과 카드 -->
					<div class="card card-jo">
						<!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
						<div class="card-left">
							<img src="/CodePeople/images/logo<%=i %>.png" alt="Card image"
								style="width: 64px; height: 64px;">
						</div>
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
							<div class="card-top-box">
								<a href="/CodePeople/JOCardDetil.do?joNo=<%=clip.getJoNo()%>"><h4 class="card-title"><%=clip.getJoTitle() %></h4></a>
							</div>
							<!-- 카드의 회사 소개, 직군 -->
							<div class="card-text card-jobs-detail-company-intro">
								<span class="company-intor"><%=clip.getComIntro() %></span>
							</div>
							<div class="card-text card-jobs-detail-company-jobgroup">
								<span class="company-jobgroup"><%=clip.getJgCodeNm() %></span>
							</div>
							<!-- 카드의 채용공고 박스 -->
							<div class="card-jobs-detail">
								<div class="divider"></div>
								<div class="jobs-detail-top">
									<div class="jobs-detail">
										<a href="#" class="card-link"><span class="jo-title"><%=clip.getComNm() %></span></a>&nbsp;&nbsp; 
										<span
											class="jo-salary jo-sm-font"><%=comSal %></span> 
											<span
											class="jo-sm-font">/</span> 
											<span
											class="jo-career jo-sm-font"><%=rank %></span>
									</div>
									
								</div>

	                   <span class="card-text jo-sm-font"><%=clip.getJgCodeNm() %></span>&nbsp;&nbsp;
                        <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>
                        <%=clip.getJoSdate().substring(0, 4) %>.
                        <%=clip.getJoSdate().substring(4, 6) %>.
                        <%=clip.getJoSdate().substring(6) %>
                            </span>
                            &nbsp;<span class="jo-start jo-sm-font">~</span>&nbsp;
                        <span class="jo-end jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i> 
                        <%=clip.getJoEdate().substring(0, 4) %>.
                        <%=clip.getJoEdate().substring(4, 6) %>.
                        <%=clip.getJoEdate().substring(6) %>
                            </span>
							</div>
						</div>
					</div>		
<%		
	}
%>
<%	
}
%>


				</div>
				
				
				
				
				
				
				<div id="myCalendar" class="content-box"></div>

				<!-- 유료컨텐츠  -->
				<div id="peoplePayment" class="content-box  search-result payment-desc my-main-cv">
					<div class="my-box-item">
						<div class="my-box-header">
							<h1 class="h1">유료서비스</h1>
						</div>
					</div>
					<div class="payment-box content-box">
						<!-- 카드의 정보 -->
						<div class="card-body card-right">
						<div class="card-top-box">
								<h4 class="card-title">인재 프리미엄 플랜</h4>
							</div>
							<!-- 프리미엄 소개-->
							<div class="payment-top-text">
								인재 프리미엄 서비스를 통해 기업에서 인재를 검색할 때에 검색목록 상단에 표시하도록 합니다.<br>
								대취업전쟁시대에서 돈을 지불해 다른사람들보다 먼저 취업하세요.
							</div>
						</div>
						<div class="card-body card-right preRemain">
						 <h4 class="card-title cv-title">남은 프리미엄 기간 : 9999일</h4>
						</div>
						<div class="payment-content-box">					
								<div class="content-box planbox">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="mt-1">1개월</h3>
										</div>
										<hr class="mt-5">
										<div class="panel-body">
											<p class="plan-desc">
												째째하게 1개월만 <br> 쓰고 취업될거라고 <br> 생각하시는건 아니죠?
											</p>
											<p>자신있으시면 이걸로 하시던가요 ^^;</p>
										</div>
										<div class="panel-footer">
											<h4>29,900원</h4>
											<hr>
											<button class="btn btn-lg" id="btn1">결제하기</button>
										</div>
									</div>
								</div>
								<div class="content-box planbox">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="mt-1">3개월</h3>
										</div>
										<hr class="mt-5">
										<div class="panel-body">
											<p class="plan-desc">
												조금 덜 째째하게 3개월 플랜으로 하시게요? <br> 6개월이랑 가격차이도 별로 안나는데?
											</p>
											<p>
												손해보는 장사 <br> 하시는군요 ㅡㅡ;
											</p>
										</div>
										<div class="panel-footer">
											<h4>79,900원</h4>
											<hr>
											<button class="btn btn-lg" id="btn2">결제하기</button>
										</div>
									</div>
								</div>
								<div class="content-box planbox">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="mt-1">6개월</h3>
										</div>
										<hr class="mt-5">
										<div class="panel-body">
											<p class="plan-desc">코드피플 강력추천</p>
											<p>당신은 능력보다 돈을 조금만 더 써서 남들보다 더 좋은 환경으로 취업할수 있을겁니다.</p>
											<p>저희만 믿으세요</p>
										</div>
										<div class="panel-footer">
											<h4>99,900원</h4>
											<hr>
											<button class="btn btn-lg" id="btn3">결제하기</button>
										</div>ㄴ
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