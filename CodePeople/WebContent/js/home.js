$(function () {

  $("#login_btn").on("click", function () {
    let idVal = $("#floatingInput").val();
    let passVal = $("#floatingPassword").val();
    $.ajax({
      url: "/CodePeople/Login.do",
      type: "post",
      data: {
        memId: idVal,
        memOrignlPw: passVal,
      },
      dataType: "json",
      success: function (resp) {
        if (resp.flag == "ok") {
          alert("로그인 성공!");
          location.href = "/CodePeople/rehearsal/index.jsp";
        } else {
          alert(resp.error);
        }
      },
      error: function (xhr) {
        alert("잘못 입력하셨습니다.");
      },
    });
  });


  $('#idSearch').on('click', function () {
    let memNm = $('#memNm1').val();
    let memEmail = $('#memEmail1').val();

    $.ajax({
      url: "/CodePeople/IdSearch.do",
      type: "post",
      data: {
        "memNm" : memNm,
        "memEmail" : memEmail
      },
      dataType: "json",
      success: function (resp) {
        if(resp.memId == "null"){
          alert('아이디가 존재하지 않습니다.');
          location.href="/CodePeople/rehearsal/home.html";
        } else {
          alert('아이디 : ' + resp.memId);
          location.href="/CodePeople/rehearsal/home.html";
        }
      },
      error: function (xhr) {
        alert("아이디 찾기 버튼 클릭시 에러 상태 : " + xhr.status);
      },
    });
  });

//  $('#passSearch').on('click', function () {
//    let memId = $('#memId2').val();
//    let memEmail = $('#memEmail2').val();
//
//    $.ajax({
//      url: "/CodePeople/PassSearch.do",
//      type: "post",
//      data: {
//        "memId" : memId,
//        "memEmail" : memEmail
//      },
//      dataType: "json",
//      success: function (resp) {
//        location.href = "/CodePeople/rehearsal/home.html";
//      },
//      error: function (xhr) {
//        alert("테스트 : " + resp.cnt);
//        alert("비밀번호 찾기 버튼 클릭시 에러 상태 : " + xhr.status);
//      },
//    });
//  });

});
