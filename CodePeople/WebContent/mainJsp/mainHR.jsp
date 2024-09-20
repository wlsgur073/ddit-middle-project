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
 System.out.println("START");
 	 //변수 선언하기
 	 int memCode=0;
 	 int memNo=0;
 	 int comNo=0;
 	 int hrNo=0;
     if(loginMember == null) {
		//비회원인 경우
    	 memCode=0;
    	 System.out.println("비화원"+memCode);
     }else {
    	//회원인경우 멤버 코드
     	memCode = (int)loginMember.getMemCode();
     	memNo = loginMember.getMemNo();
     	if(memCode == 2) {
			//기업회원인 경우
	 	    IMemberService memberService = MemberServiceImpl.getInstance();
	     	System.out.println("기업화원"+memCode);
			
	     	//회원 번호를 바탕으로 기업정보를 등록한 회원인지 판단
	     	int check = memberService.checkRegisterdCorp(memNo);
	        if(check > 0) {
	        comNo = memberService.getComNo(memNo);
			}  
    	}else{
    		IHRService hrService = HRServiceImpl.getInstance();
    		hrNo = hrService.getHrNo(memNo);
    		System.out.println("일반회원"+memCode);
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}//js/SSDropDowns.js"></script>
  <script src="${pageContext.request.contextPath}//js/SSPaging.js"></script>
  <script src="${pageContext.request.contextPath}//js/jquery.serializejson.min.js"></script>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
  
</head>

<script>
   document.addEventListener("DOMContentLoaded", () => {
    console.log("DOM is ready");
 
    let currentPageNo = 1;
    //기본리스트를 출력하는 메서드 currentPage값으로 1을 hardcoding에서 넘겨준다. 
    HRCardPaging(currentPageNo);
    
    //화면 로드시 드랍다운의 버튼을 모두 가져온다.
    const dropdownBtns = document.querySelectorAll('.dropdown button');
    //현재 클릭한 드랍다운
    let dropdownBtn = "";
    
    
    const searchBtn = document.querySelector('#searchBtn');
    searchBtn.addEventListener('click',()=>{
    	HRSearchCardPaging();
    })
    
   /* 
    $(document).on('click','.tag',function(){
    	console.log('remove');
       let tagName = $(this).attr('idx');
  	  let category = $(this).attr('name');
  	  let tagValue = $(this).val();
  	
  	  
  	  console.log(tagName);
  	  console.log(category);
  	  console.log(tagValue);
  	if(category=="jgCodeNo"){
  		document.querySelector('#jgCodeNo').value = 0;
  	}else if(category=="plCodeNo"){
  		document.querySelector('#plCodeNo').value=0;
  	}else if(category=="eduCodeNo"){
  		 document.querySelector('#eduCodeNo').value= 0;
  	}else if(category=="cityCodeNo"){
  		document.querySelector('#cityCodeNo').value = 0;
  	}else if(category=="provCodeNo"){
  		document.querySelector('#cityCodeNo').value = 0;
  	}
  	
  	this.remove();
    }) */
    
    
    $(document).on("click",".goDetail",function(){
    let option = this;
	let hrNo = option.getAttribute('idx');
	$.ajax({
			url : '/CodePeople/goHrDetail.do',
			type : 'get',
			data : {"hrNo":hrNo},
			success : function(res){
				console.log(res)
			},
		   error :function(xhr){
			   console.log(`status: ${xhr.satus}\ntext : ${xhr.statusText}`);
		   }
		})
    })
    
    let cityCodeNo ="";
   
  
	// 드랍다운 아래 옵션 목록을 가져오는 메서드 
    const bringOptions = (btn) => {
      let key = btn.textContent;
      if (key === "직군") {
        initJobGroupList(btn);
      } else if (key === "활동분야") {
        initProgLangList(btn);
      } else if (key === "학력") {
        initEduTypeList(btn);
      } else if (key === "지역") {
        initCityList(btn);
      } else if (key === "상세지역") {
        initProvList(btn);
      }
     
    };

	//모든 드랍 다운 항목에 이벤트 부여
    dropdownBtns.forEach(btn => {
      btn.addEventListener("click", event => {
        dropdownBtn = event.currentTarget;
        bringOptions(dropdownBtn);
      })
    })    

   });
   
</script>


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
                <button id="header-login-btn" class="btn btn-primary btn-sm">로그아웃</button>
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
                        <a href="/CodePeople/RegiHRInfo.do"><li class="list-group-item">프로필 등록</li></a>
                    </ul>
                </div>
            </div>
            <!-- 바디 콘텐츠 -->
            <div id="content">
<!--             목록에서 선택한 갑사을 보낼 폼데이터 -->
            <form id="formDatas">
           	    <input type="hidden" name ="currentPageNo" id ="currentPageNo" value="1">
                <input type="hidden" name ="jgCodeNo" id ="jgCodeNo" value="0">
                <input type="hidden" name ="plCodeNo" id ="plCodeNo" value="0"> 
                <input type="hidden" name ="eduCodeNo" id ="eduCodeNo" value="0">
                <input type="hidden" name ="cityCodeNo" id ="cityCodeNo" value="0">
                <input type="hidden" name ="provCodeNo" id ="provCodeNo"value="0">
            </form>
            <form id="favHrForm">
	            <input type="hidden" name="comNo" id="comNo" value="">
	            <input type="hidden" name="hrNo" id="hrNo" value="">
            </form>
				<!-- 콘텐츠 인재 검색-->
                <div class="filter-box content-box human">
                    <h1 class="h1">인재검색</h1>
                    <div class="filter-box-dropdowns">
                        <div class="dropdown">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">직군</button>
                            <ul class="dropdown-menu"></ul>
                        </div>
                        <div class="dropdown">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">활동분야</button>
                            <ul class="dropdown-menu"></ul>
                        </div>
                        <div class="dropdown">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">학력</button>
                            <ul class="dropdown-menu"></ul>
                        </div>
                        <div class="dropdown">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">지역</button>
                            <ul class="dropdown-menu"></ul>
                        </div>
                            <div class="dropdown">
                            <button type="button" class="btn btn-primary dropdown-toggle hide" id="provBtn" data-bs-toggle="dropdown">상세지역</button>
                            <ul class="dropdown-menu"></ul>
                        </div>
                    </div>
                    <div class="input-group mb-3 col-lg-10 search-text">
                      <div class="search-tags hide"></div>
                        <input type="text" class="form-control" placeholder="검색어 입력">
                    </div>
                    <div class="filter-save-box">
                        <button type="button" class="btn btn-outline-primary filter-save" id="searchBtn">검색</button>
                    </div>
                </div>
                <!-- 콘텐츠 인재 검색결과 -->
                <div class="content-box search-result human" id="human-card-list">
                    <!-- 검색결과 카드 -->
                   
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