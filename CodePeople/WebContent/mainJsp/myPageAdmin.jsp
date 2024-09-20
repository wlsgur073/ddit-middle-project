<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="../css/main.css">
  <style>

#company-request-box{
  display: flex;
  flex-direction: column;
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
        <a href="/CodePeople/rehearsal/home.html" id="logo"><i class="fas fa-copyright"
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
        <a href="/CodePeople/rehearsal/home.html"><button id="header-login-btn"
            class="btn btn-primary btn-sm">로그인</button></a>
      </div>
    </div>
  </div>
  <div id="body">
    <div id="body-container">
      <!-- 마이페이지 좌측 메뉴바 -->
      <div class="nav-left-bar nav-my">
        <div class="nav-sticky">
          <ul class="list-group">
            <li class="list-group-item"><a class="nav-link" href="#report-box">신고글</a></li>
            <li class="list-group-item"><a class="nav-link" href="#company-request-box">기업정보 승인</a></li>
            <li class="list-group-item"><a class="nav-link" href="#mem-request-box">재직인증 심사</a></li>
            <li class="list-group-item"><a class="nav-link memInfo" href="#payment-box">결제문의</a></li>

            <li class="list-group-item"><a class="nav-link" href="#mem-box"">회원관리</a></li>

          </ul>
        </div>
      </div>
      <div id="content">
        <!-- 신고글 -->
        <div class="content-box search-result board board-main" id="report-box">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">신고글</h1>
            </div>
          </div>
          <div class="board-body">
            <div class="divider"></div>
            <!-- 아코디언 : 게시판 게시글들 시작 -->
            <div id="accordion">
              <!-- 게시글의 한단위  -->
              <!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
              <div class="card" id="report1">
                <div class="card-header">
                  <a class="btn title-btn" data-bs-toggle="collapse" href="#collapseOne">
                    <span class="board-detail-title">산지직송 젓갈팝니다.</span>
                  </a>
                  <div class="board-icon-box">
                    <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">111</span>&nbsp;&nbsp;
                    <i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">0</span>&nbsp;&nbsp;
                    <i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">1</span>&nbsp;&nbsp;
                  </div>
                </div>
                <!-- 게시글을 담고있는 곳 a 태그가 가르키는 곳 -->
                <div id="collapseOne" class="collapse " data-bs-parent="#accordion">
                  <div class="card-body">
                    <div class="board-info-box">
                      작성자&nbsp;:&nbsp;<span
                        class="board-detail-writer">홍길동</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      작성일&nbsp;:&nbsp;<span class="board-detail-date">2021/10/18</span>
                    </div>
                    <span class="board-detail-content">
                      산지직송 맛있는 젓갈 팝니다.<br>
                  오동통한 오징어젓이 단돈 삼만원 입니다.<br>
                  꼴뚜기 젓도 있습니다.<br>
                      
                    </span>
                    <div class="my-btn-box my-btn-box-cv">
                      <button type="button" id="report1Btn" class="btn btn-outline-primary">신고사유</button>
                      <button type="button" class="btn btn-outline-primary blind">블라인드</button>
                      <button type="button" id="report1D" class="btn btn-outline-primary">처리완료</button>
                    </div>
                  </div>
                  <div class="board-divider"></div>
                
                  <div class="reply-box">
                
                    <div class="reply-card bg-light text-dark">
                      <div class="reply-writer-box">&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer">김**</span>
                      </div>
                      <div class="card-body"><span class="reply-content">광고성 글 신고해야겠네요</span></div>
                      <div class="reply-card-icon-box">
                        <div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span
                            class="reply-like board-sm-font">좋아요</span></div>
                        <div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span
                            class="reply-reply-cnt board-sm-font">대댓글</span></div>
                        <div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span
                            class="reply-report board-sm-font">신고</span></div>
                      </div>
                      <div class="my-btn-box-cv reply-btn-box">
                        <button type="button" class="btn btn-outline-secondary">블라인드</button>

                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card">
                <div class="card-header">
                  <a class="btn title-btn" data-bs-toggle="collapse" href="#collapseThree">
                    <span class="board-detail-title">회사 다니기 싫다.</span>
                  </a>
                  <div class="board-icon-box">
                    <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">50</span>&nbsp;&nbsp;
                    <i class="far fa-thumbs-up"></i>&nbsp;<span class="board-like board-sm-font">5</span>&nbsp;&nbsp;
                    <i class="far fa-comment"></i>&nbsp;<span class="board-comment board-sm-font">3</span>&nbsp;&nbsp;
                  </div>
                </div>
                <!-- 게시글을 담고있는 곳 a 태그가 가르키는 곳 -->
                <div id="collapseThree" class="collapse " data-bs-parent="#accordion">
                  <div class="card-body">
                    <div class="board-info-box">
                      작성자&nbsp;:&nbsp;<span
                        class="board-detail-writer">월미도</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      작성일&nbsp;:&nbsp;<span class="board-detail-date">2021/10/20</span>
                    </div>
                    <span class="board-detail-content">
                      다닐 회사가 있는 건 좋은 거지요 룰루랄라<br>
                      언제 또 월급 날이 될까 ~ 휴 너무 슬퍼요 <br>
                      회사에서 있는 시간은 늘 안가네요<br>
            	 여러분들은 어떻게 지내고 계시나요 ~  <br>
                      하하하하하<br>
                    </span>
                    <div class="my-btn-box my-btn-box-cv">
                      <button type="button" id="report2Btn" class="btn btn-outline-primary">신고사유</button>
                      <button type="button" class="btn btn-outline-primary" id="report2D">요청처리</button>
                    </div>
                  </div>
                  <div class="board-divider"></div>
                
                  <div class="reply-box"  id="report2">
                
                    <div class="reply-card bg-light text-dark">
                      <div class="reply-writer-box">&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer">홍**</span>
                      </div>
                      <div class="card-body"><span class="reply-content">그런정신으로 회사를 다니니 인성 폐급이네.....</span></div>
                      <div class="reply-card-icon-box">
                        <div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span
                            class="reply-like board-sm-font">좋아요</span></div>
                        <div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span
                            class="reply-reply-cnt board-sm-font">대댓글</span></div>
                        <div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span
                            class="reply-report board-sm-font">50</span></div>
                      </div>
                      <div class="my-btn-box-cv reply-btn-box">
                        <button type="button" class="btn btn-outline-secondary blind">삭제</button>
                      </div>
                    </div>
                    
                  </div>
                          <div class="board-divider"></div>
                  <div class="reply-box">
                
                    <div class="reply-card bg-light text-dark">
                      <div class="reply-writer-box">&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer">민**</span>
                      </div>
                      <div class="card-body"><span class="reply-content">좋은 게시판에 물흐리는 분이 계시네요 . 신고 !!</span></div>
                      <div class="reply-card-icon-box">
                        <div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span
                            class="reply-like board-sm-font">20</span></div>
                        <div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span
                            class="reply-reply-cnt board-sm-font">대댓글</span></div>
                        <div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span
                            class="reply-report board-sm-font">0</span></div>
                      </div>
                   
                    </div>
                    
                  </div>
                          <div class="board-divider"></div>
                  <div class="reply-box">
                
                    <div class="reply-card bg-light text-dark">
                      <div class="reply-writer-box">&nbsp;&nbsp;작성자&nbsp;&nbsp;<span class="reply-writer">성**</span>
                      </div>
                      <div class="card-body"><span class="reply-content">저도 회사에 있을 때 시간이 너무 안가요 ㅠㅠ 맘 완전 이해감..</span></div>
                      <div class="reply-card-icon-box">
                        <div class="board-icon-item"><i class="far fa-thumbs-up"></i>&nbsp;<span
                            class="reply-like board-sm-font">좋아요</span></div>
                        <div class="board-icon-item"><i class="far fa-comment"></i>&nbsp;<span
                            class="reply-reply-cnt board-sm-font">대댓글</span></div>
                        <div class="board-icon-item"><i class="far fa-frown"></i>&nbsp; <span
                            class="reply-report board-sm-font">0</span></div>
                      </div>
                 
                    </div>
                    
                  </div>
                  
                </div>
              </div>
          
            </div>
          </div>

        </div>

        <!-- 기업정보 승인 -->
        <div id="company-request-box" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">기업정보 승인</h1>
            </div>
          </div>
          <div class="divider"></div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link"><span class="board-title company-name" >SAMSUMG</span></a>&nbsp;&nbsp;
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link"><span class="board-title company-name" >APPLE</span></a>&nbsp;&nbsp;
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link"><span class="board-title company-name" >LG</span></a>&nbsp;&nbsp;
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
        
        </div>
        <!-- 재직인증 심사-->
        <div id="mem-request-box" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
            <h1>재직인증 심사</h1>
            </div>
          </div>
          <div class="divider"></div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link">ID:&nbsp;&nbsp;<span class="board-title mem-id" >lo23li</span>&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<span class="board-title mem-name" >임**</span>&nbsp;&nbsp;&nbsp;&nbsp;재직기업:&nbsp;&nbsp;<span class="board-title com-name" >NAVER</span></a>
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
          <!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link">ID:&nbsp;&nbsp;<span class="board-title mem-id" >love123</span>&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<span class="board-title mem-name" >홍**</span>&nbsp;&nbsp;&nbsp;&nbsp;재직기업:&nbsp;&nbsp;<span class="board-title com-name" >GOOGLE</span></a>
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link">ID:&nbsp;&nbsp;<span class="board-title mem-id" >los23</span>&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<span class="board-title mem-name" >이**</span>&nbsp;&nbsp;&nbsp;&nbsp;재직기업:&nbsp;&nbsp;<span class="board-title com-name" >배달의민족</span></a>
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">요청정보</button>
                <button type="button" class="btn btn-outline-primary">요청처리</button>
              </div>
            </div>
          </div>
        </div>
        <!-- 결제문의 -->
        <div id="payment-box" class="content-box search-result board board-main board-best">
          <div class="board-header">
            <div class="board-name">
              <h1 class="h1">결제문의</h1>
            </div>
          </div>
          <div class="board-body">
            <div class="divider"></div>
            <!-- 아코디언 : 게시판 게시글들 시작 -->
            <div id="accordion">
              <!-- 게시글의 한단위  -->
              <!-- card-hear 안 a태그와 게시글의 아이디를 맞춰주세요 -->
              <div class="card">
                <div class="card-header">
                  <a class="btn title-btn" data-bs-toggle="collapse" href="#or">
                    ID:&nbsp;&nbsp;<span class="board-title mem-id" >lo23li</span>&nbsp;&nbsp;&nbsp;&nbsp;문의:&nbsp;&nbsp;<span class="board-title qu-category" >카드</span>
              
                  </a>
                </div>
                <!-- 게시글을 담고있는 곳 a 태그가 가르키는 곳 -->
                <div id="or" class="collapse " data-bs-parent="#accordion">
                  <div class="card-body">
                    <div class="board-info-box">
                      작성자&nbsp;:&nbsp;<span
                        class="board-detail-writer">홍길동</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      작성일&nbsp;:&nbsp;<span class="board-detail-date">2021/10/18</span>
                    </div>
                    <span class="board-detail-content">
                      카드 승인이 거절 되었습니다.<br>
                      제 카드 사에 문제가 있는 걸까요? <br>
                      할부로 인재 플랜 결제 할 수 있나요?<br>
                      
                    </span>
                    <div class="my-btn-box my-btn-box-cv">
                      <button type="button" class="btn btn-outline-primary">처리완료</button>
                      <button type="button" class="btn btn-outline-primary">답변</button>
                    </div>
                  </div>
                  <div class="board-divider"></div>
            
                </div>
              </div>
              
          
            </div>
          </div>
        </div>

        <!-- 회원관리 -->
         <div class="filter-box content-box board board-main">
          <h1 class="h1">회원관리</h1>
          <div class="search-tags"></div>
          <div class="input-group mb-3 col-lg-10 search-text">
              <input type="text" class="form-control" placeholder="검색어 입력">
          </div>
          <div class="filter-save-box">
              <button type="button" class="btn btn-outline-primary filter-save">검색</button>
          </div>
          <div class="divider"></div>
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link">ID:&nbsp;&nbsp;<span class="board-title mem-id" >lo23li</span>&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<span class="board-title mem-name" >임**</span>&nbsp;&nbsp;&nbsp;&nbsp;재직기업:&nbsp;&nbsp;<span class="board-title com-name" >NAVER</span></a>
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">활성화</button>
                <button type="button" class="btn btn-outline-primary">삭제</button>
              </div>
            </div>
          </div>
          <!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
          <div class="board-card">
            <div class="board-detail">
              <a href="#" class="card-link">ID:&nbsp;&nbsp;<span class="board-title mem-id" >love123</span>&nbsp;&nbsp;&nbsp;&nbsp;이름:&nbsp;&nbsp;<span class="board-title mem-name" >홍**</span>&nbsp;&nbsp;&nbsp;&nbsp;재직기업:&nbsp;&nbsp;<span class="board-title com-name" >GOOGLE</span></a>
              
              <div class="my-btn-box my-btn-box-cv">
                <button type="button" class="btn btn-outline-primary">활성화</button>
                <button type="button" class="btn btn-outline-primary">삭제</button>
              </div>
            </div>
          </div>
         
     <script type="text/javascript">
document.addEventListener('DOMContentLoaded',()=>{
	
const blind = document.querySelectorAll('.blind');
blind.forEach(a=>{
	a.addEventListener('click',()=>{
		alert('블라인드 처리완료');
	})
})
const report1 =  document.querySelector('#report1');
const report1Btn = document.querySelector('#report1Btn');
const report1D = document.querySelector('#report1D');

report1Btn.addEventListener('click',()=>{
	alert('[부적절한 광고성 글] \n메시지 : 광고글이네요 ~ 처리 부탁드립니다.');
});

report1D.addEventListener('click',()=>{
	
	report1.remove();
});
	


const report2 =  document.querySelector('#report2');
const report2Btn = document.querySelector('#report2Btn');
const report2D = document.querySelector('#report2D');



report2Btn.addEventListener('click',()=>{
	alert('[불쾌한 답글] \n메시지 : 무례한 내용의 글입니다. 삭제요청합니다.');
});

report2D.addEventListener('click',()=>{
	
	report2.remove();
});
	




})


</script>

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