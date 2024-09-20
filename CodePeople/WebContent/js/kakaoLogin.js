

// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init("582c43c5379e1cd6033238a735875c5f");
// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

// 로그인
function kakaoLogin() {
  // Kakao.Auth.createLoginButton({
  //   // container: '#kakao-login',
  //   success: function(resp){
  Kakao.Auth.login({
    success: function (authObj) {
      
      // 로그인 성공시, api를 호출합니다.
      Kakao.API.request({
        url: "/v2/user/me",

        success: function (resp) {
          let kakao_account = resp.kakao_account;
          let properties = resp.properties;

          let memEmail = "";
          let memNm = "";
          let memBir = "";
          let memImgUrl = "";
          if (typeof kakao_account != "undefined") {
            // 변수에 속성 값 넣기
            memEmail = kakao_account.email;
            memNm = properties.nickname;
            memBir = kakao_account.birthday;
            memImgUrl = properties.profile_image;
//            alert(memImg);
          }

          $.ajax({
            url: "/CodePeople/ExternalLogin.do",
            data: {
              "memEmail": memEmail,
              "memNm": memNm,
              "memBir": memBir,
              "memImgUrl" : memImgUrl
            },
            type: "post",
            dataType: "json",
            success: function (resp) {
              if (resp.flag == "true") {
                alert("코드피플에 오신 것을 환영합니다!");
                location.href = "/CodePeople/rehearsal/index.jsp";
              }
            },
            error: function (xhr) {
              alert("외부 로그인 api 에러 상태 : " + xhr.status);
            },
          });
        },

        fail: function (error) {
          console.log("error : " + error);
        },
      });
    },
    fail: function (err) {
      alert(JSON.stringify(err));
    },
  });

  //   },
  //   fail: function(error){
  //     console.log("error : " + error);
  //   }
  // });
}

// 로그아웃
function kakaoLogout() {
  if (Kakao.Auth.getAccessToken()) {
    Kakao.API.request({
      url: "/v1/user/unlink",
      success: function (resp) {
        alert("로그아웃되었습니다.");
        // console.log("logout succeed : " + resp);
        location.href="/CodePeople/rehearsal/home.html";
      },
      fail: function (error) {
        console.log("error : " + error);
      },
    });
    Kakao.Auth.setAccessToken(undefined);
  }
}
