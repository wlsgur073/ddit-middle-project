
comDetailListServer = function (currentPageNo) {


  
	$.ajax({
    type: "post",
    url: "/CodePeople/CompanyDetailList.do",
    data: "data",
    dataType: "json",
    success: function (res) {
      
      code = `
      <!-- 메인 -->
      <div id="main" class="content-box search-result jo my-main-cv">
        <div class="my-box-item">
          <div class="my-box-header">
            <h1 class="h1">기업상세</h1>
          </div>
        </div>
        <!-- 검색결과 카드 -->
        <div class="card card-cv">
          <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
          <div class="card-left">
            <img src="../logo.jpeg" alt="Card image" style="width: 64px; height: 64px;">
          </div>
          <!-- 카드의 정보 -->
          <div class="card-body card-right">
            <div class="card-top-box">
              <h4 class="card-title cv-title">${v.comNm}</h4>
              <!-- 관심/알람 버튼 -->
              <div class="dropdown">
                <button type="button" class="btn btn-outline-secondary dropdown-toggle btn-menu"
                  data-bs-toggle="dropdown"></button>
                <!-- 버튼 메뉴정보 -->
                <ul class="dropdown-menu">
                  <li>
                    <h5 class="dropdown-header">관심</h5>
                  </li>
                  <li><a class="dropdown-item" href="#">관심등록</a></li>
                  <li><a class="dropdown-item" href="#">관심해제</a></li>
                  <li>
                    <h5 class="dropdown-header">알람</h5>
                  </li>
                  <li><a class="dropdown-item" href="#">알람설정</a></li>
                  <li><a class="dropdown-item" href="#">알람해제</a></li>
                </ul>
              </div>
            </div>
            <!-- 회사소개 한마디 -->
            <div class="card-text">
              <h4 class="card-title cv-title">${v.comIntro}</h4>
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
            <div class="card-top-box">
            </div>
            <!-- 카드의 회사 소개, 직군 -->

            <div class="card-text">
              기업명&nbsp;&nbsp;
              <span class="cv-career">${v.comNm}</span>
            </div>
            <div class="card-text">
              홈페이지&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.comHpg}</span>
            </div>
            <div class="card-text">
              직군&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.jgCodeNm}</span>
            </div>
            <div class="card-text">
              설립일&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.comDate}</span>
            </div>
            <div class="card-text">
              본사&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.comAdd}</span>
            </div>
            <div class="card-text">
              사원수&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.comCnt}</span>
            </div>
            <div class="card-text">
              평균연봉&nbsp;&nbsp;
              <span class="cv-jobgroup">${v.comSal}</span>
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
        <div class="card">
          <!-- 카드의 정보 -->
          <div class="card-body card-right">
            <div class="card-top-box">
              <h4 class="card-title">{v.comRev}</h4>
            </div>
            <!-- 별점 박스 스크립트로 구현필요 -->
            <div class="card-rating-box">
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
            </div>
            <div class="card-rating-text">${v.comRevCnt}개의 리뷰</div>
          </div>
        </div>
        <!-- 아래는 이미지 시현을 위한 것입니다. 위의 것을 사용해주세요 -->
        <div class="card">
          <div class="card-body card-right">
            <div class="card-top-box">
            </div>
            <div class="card-rating-box">
              ${v.revCrr}
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
              커리어 향상
            </div>

            <div class="card-rating-box">
              ${v.revWlb}
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
              워라밸
            </div>

            <div class="card-rating-box">
              ${v.revSal}
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
              급여 및 복지
            </div>

            <div class="card-rating-box">
              ${v.revCul}
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
              사내 문화
            </div>

            <div class="card-rating-box">
              ${v.revExecs}
              <div class="card-rating-star">
                <!-- 채우기는 자바스크립트로 -->
                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
              </div>
              경영진
            </div>
          </div>
        </div>
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
                <i class="fas fa-building"></i>&nbsp;<h1 class="h1">회사생활</h1>
              </div>
              <div class="board-btn-box">
                <button type="button" class="btn btn-outline-primary">더보기 ></button>
              </div>
            </div>
            <div class="divider"></div>
            <div class="board-card">
              <div class="board-detail">
                <a href="#" class="card-link"><span class="board-title">회사 때려치고 싶어요</span></a>&nbsp;&nbsp;
                <div class="view-box">
                  <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">100</span>
                </div>
              </div>
            </div>
            <!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
            <div class="board-card">
              <div class="board-detail">
                <a href="#" class="card-link"><span class="board-title">프론트 적성에 안맞아요</span></a>&nbsp;&nbsp;
                <div class="view-box">
                  <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">100</span>
                </div>
              </div>
            </div>
            <div class="board-card">
              <div class="board-detail">
                <a href="#" class="card-link"><span class="board-title">에라 모르겠다</span></a>&nbsp;&nbsp;
                <div class="view-box">
                  <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">100</span>
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
                      <span class="dot_min"></span>
                      <span class="dot_med"></span>
                      <span class="dot_max"></span>
                      <!---->
                    </div>
                  </div>
                  <div class="min_max"><br>
                    <ul>
                      <li class="min"><strong>최소</strong>
                        <span class="cnt"><span class="num">2,500만</span>원</span>
                      </li>
                      <li class="mdn"><strong>중앙</strong>
                        <span class="cnt"><span class="num">${v.comSal}만</span>원</span>
                      </li>
                      <li class="max"><strong>최대</strong> <span class="cnt"><span class="num">7,500만</span>원</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="more_wrap">
                <!---->
                <div class="show_table">
                  <div class="side_total">
                    <h4>보상</h4>
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
                          <td class="type">계약 연봉</td>
                          <td class="mid">
                            <div><em class="num">${v.comSal}만</em>원
                            </div>
                          </td>
                          <td class="total">
                            <div><em class="num">2,500만</em>원 ~ <em class="num">7,500만</em>원
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div><br>
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
                            <div><em class="num">${v.comSal/10}만</em>원
                            </div>
                          </td>
                          <td class="total">
                            <div><em class="num">250만</em>원 ~ <em class="num">1,000만</em>원
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
      <div id="hr" class="content-box  search-result payment-desc my-main-cv">
        <div class="my-box-item">
          <div class="my-box-header">
            <h1 class="h1">채용</h1>
          </div>
        </div>
          <!-- 바디 콘텐츠 -->
          <div id="content">
            <form id="formTest" style="display:none;">
              <input type="hidden" name="JG_CODE_NO" class="jg-code-hidden">직군
              <input type="hidden" name="JT_CODE_NO" class="jt-code-hidden">직무
              <input type="hidden" name="PL_CODE_NO" class="pl-code-hidden">활동분야
              <input type="hidden" name="SAL_TYPE" class="sal-type-hidden">연봉
              <input type="hidden" name="PROV_CODE_NO" class="city-code-hidden">지역
              <input type="hidden" name="CITY_CODE_NO" class="prov-code-hidden">도시
              <input type="hidden" name="STATE" class="state-hidden">진행상태
              <input type="hidden" name="EDU_CODE_NO" class="edu-code-hidden">학력
              <input type="hidden" name="CRR_YEARS_TYPE" class="crr-type-hidden">경력
              <input type="hidden" name="CERT_CODE_NO" class="cert-code-hidden">자격증
              <input type="hidden" name="HCNT_TYPE" class="hcnt-type-hidden">인원
              <button id="postTest" value="test" type="button">테스트</button>
              <input type="reset" value="reset"></input>
            </form>
    
            <div class="content-box search-result jo" id="result-card-list">
              <!-- 검색결과 카드 -->
              <div class="card card-jo">
                <!-- 카드의 이미지태그는 복사해서 사용할것 src alt값 변경 필-->
                <div class="card-left">
                  <img src="../logo.jpeg" alt="Card image" style="width: 64px; height: 64px;">
                </div>
                <!-- 카드의 정보 -->
                <div class="card-body card-right">
                  <div class="card-top-box">
                    <h4 class="card-title">${v.comNm}</h4>
                  </div>
                  <!-- 카드의 회사 소개, 직군 -->
                  <div class="card-text card-jobs-detail-company-intro">
                    <span class="company-intor">${v.comIntro}</span>
                  </div>
                  <div class="card-text card-jobs-detail-company-jobgroup">
                    <span class="company-jobgroup">${v.jgCodeNm}</span>
                  </div>
                  <!-- 카드의 채용공고 박스 -->
                  <div class="card-jobs-detail">
                    <div class="divider"></div>
                    <div class="jobs-detail-top">
                      <div class="jobs-detail">
                        <a href="#" class="card-link"><span class="jo-title">${v.joTitle}</span></a>&nbsp;&nbsp;
                        <span class="jo-salary jo-sm-font">${v.joSalType}</span> <span class="jo-sm-font">/</span> <span
                          class="jo-career jo-sm-font">경력</span>
                      </div>
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
                          <li><a class="dropdown-item" href="#">스크랩</a></li>
                          <li>
                            <h5 class="dropdown-header">알람설정</h5>
                          </li>
                          <li><a class="dropdown-item" href="#">알람등록</a></li>
                        </ul>
                      </div>
                    </div>
    
                    <span class="card-text jo-sm-font">${v.jtCodeNm}</span>&nbsp;&nbsp;
                    <span class="jo-start jo-sm-font"><i class="far fa-calendar-alt">&nbsp;</i>10/12 </span> &nbsp;<span
                      class="jo-start jo-sm-font">~</span>&nbsp; <span class="jo-end jo-sm-font"><i
                        class="far fa-calendar-alt">&nbsp;</i>10/15
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 페이징 처리를 위한 박스 -->
            <div class="container mt-3" id="result-page-box">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
              </ul>
            </div>
          </div>
      </div>
      
      <!-- 뉴스 -->
      <div id="news" class="content-box  search-result payment-desc my-main-cv">
        <div class="my-box-item">
          <div class="my-box-header">
            <h1 class="h1">뉴스</h1>
          </div>
          <div class="content-box search-result board board-main board-best">
            <div class="board-header">
                <div class="board-name">
                    <i class="fas fa-crown"></i>&nbsp;<h1 class="h1">관련뉴스</h1>
                </div>
            </div>
            <div class="divider"></div>
            <div class="board-card">
                <div class="board-detail">
                    <a href="#" class="card-link"><span class="board-title">충격, "네이버 망하다."</span></a>&nbsp;&nbsp;
                    <div class="view-box">
                        <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">2021-9-28</span>
                    </div>
                </div>
            </div>
            <!-- 시연을 위한 코드입니다 우측 카드를 사용해주세요 -->
            <div class="board-card">
                <div class="board-detail">
                    <a href="#" class="card-link"><span class="board-title">네이버, 주가폭락</span></a>&nbsp;&nbsp;
                    <div class="view-box">
                        <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">2021-10-21</span>
                    </div>
                </div>
            </div>
            <div class="board-card">
                <div class="board-detail">
                    <a href="#" class="card-link"><span class="board-title">NC김택진, 사퇴의사밝혀</span></a>&nbsp;&nbsp;
                    <div class="view-box">
                        <i class="far fa-eye"></i>&nbsp;<span class="board-view board-sm-font">2021-3-25</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
      </div>
      `;

    },
    error : function (xhr) {
     alert("상태 : " + xhr.status + "  text : " + xhr.statusText);
    }
  });

}