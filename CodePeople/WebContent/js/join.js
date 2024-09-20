$(function () {
  let idVal = $('#id').val();
  let passVal = $('#pass').val();
  let pass2Val = $('#pass2').val();
  let telVal = $('#tel').val();
  let nameVal = $('#name').val();
  let emailVal = $('#email').val();
  let idCheck = ""; // DB의 아이디를 저장한 다음 나중에 idVal과 비교합니다.

  let idReg = /^[a-zA-Z][A-Za-z0-9]{4,19}$/;
  
  // 숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
  let passReg = /^[A-Za-z0-9]{6,12}$/;
//  let pass2Reg = $("#pass").val();
  let telReg = /01(0|1|6|7|8|9)-?\d{3,4}-?\d{4}$/;
  let nameReg = /^[가-힣a-zA-Z]+$/;
  let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  $("#memCode").val(1);

  // 아이디 정규식
  $("#id").on("keyup", function () {
    idVal = $(this).val();
    console.log(idVal);
    
    if (idReg.test(idVal)) {
      $("#idMsg").hide();
      $("#id2Msg").hide();
      $("#idMsg-green").text("멋진 아이디네요!");
      $("#idMsg-green").show();
    } else {
      $("#idMsg").show();
      $("#id2Msg").hide();
      $("#idMsg-green").hide();
    }  
    if (idVal == "") {
      $("#idMsg").hide();
      $("#id2Msg").hide();
      $("#idMsg-green").hide();
    }
});
    
  // 아이디 중복확인 버튼 클릭시 이벤트 처리
  $('#idCheckBtn').click(function (e) { 
    $.ajax({
      url: "/CodePeople/JoinIdCheck.do",
      type: "get",
      data: { "id": idVal },
      dataType: "json",
      success: function (res) {
        // alert(res.id);
        // res.id는 DB에서 가져온 아이디
        if (idVal == res.id) {
          idCheck = res.id;
          $("#idMsg-green").hide();
          $("#id2Msg").show();
          $("#idMsg").hide();
        } else {
          $("#idMsg-green").text("사용 가능한 아이디입니다.");
        }
      },
      error: function (xhr) {
        alert("상태 : " + xhr.status);
      },
    });
  });


  // 비밀번호 정규식
  $("#pass").on("keyup", function () {
    passVal = $(this).val();

    // !passReg.test(passVal) ? $("#pswd1Msg").show() : $("#pswd1Msg").hide();
    if (!(passReg.test(passVal))) {
      $("#pswd1Msg").show();
      $("#pswd1Msg-green").hide();
    } else {
      $("#pswd1Msg").hide();
      $("#pswd1Msg-green").show();
    }

    if (passVal == "") {
		$("#pswd1Msg").hide();
		$("#pswd2Msg-green").hide();
    }
  });

  // 비밀번호 재확인 정규식
  $("#pass2").on("keyup", function () {
    pass2Val = $(this).val();
    

    if (pass2Val != passVal) {
      $("#pswd2Msg").show();
      $("#pswd2Msg-green").hide();
    } else {
      $("#pswd2Msg").hide();
      $("#pswd2Msg-green").show();
    }

    if (pass2Val == "") {
      $("#pswd2Msg").hide();
      $("#pswd2Msg-green").hide();
    }
  });

  // 전화번호 정규식
  $("#tel").on("keyup", function () {
    telVal = $(this).val();

    !(telReg.test(telVal)) ? $("#telMsg").show() : $("#telMsg").hide();
    // if(!(telReg.test(telVal))){
    //   $('#telMsg').show();
    // } else {
    //   $('#telMsg').hide();
    // }

    if (telVal == "") {
      $("#telMsg").hide();
    }
  });

  // 이름 정규식
  $("#name").on("keyup", function () {
    nameVal = $(this).val();
    // console.log(nameVal);
    

    !(nameReg.test(nameVal)) ? $("#nameMsg").show() : $("#nameMsg").hide();
    // if(!(nameReg.test(nameVal))){
    //   $('#nameMsg').show();
    // } else {
    //   $('#nameMsg').hide();
    // }

    if (nameVal == "") {
      $("#nameMsg").hide();
    }
  });

  // 이메일 정규식
  $("#email").on("keyup", function () {
    emailVal = $(this).val();
    console.log(emailVal);
    

    !(emailReg.test(emailVal)) ? $("#emailMsg").show() : $("#emailMsg").hide();
    // if(!(nameReg.test(nameVal))){
    //   $('#nameMsg').show();
    // } else {
    //   $('#nameMsg').hide();
    // }

    if (emailVal == "") {
      $("#emailMsg").hide();
    }
  });

  $("#radioBtn a").on("click", function () {
    var sel = $(this).data("title");
    var tog = $(this).data("toggle");
    var val = $(this).data("value");
    // console.log('$(this).data(value)의 데이터 = ' + val);

    $("#" + tog).prop("value", sel);

    $('a[data-toggle="' + tog + '"]')
      .not('[data-title="' + sel + '"]')
      .removeClass("active")
      .addClass("notActive");

    $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]')
      .removeClass("notActive")
      .addClass("active");

    $("#memCode").val(val);
  });



// 회원가입 버튼 클릭시 처리 이벤트
  $("#joinBtn").on("click", function () {

    if(idReg.test(idVal) && passReg.test(passVal) && telReg.test(telVal) && nameReg.test(nameVal) && emailReg.test(emailVal) &&
    pass2Val == passVal && idVal != "" && passVal != "" && pass2Val != "" && nameVal != "" && emailVal != "" && idVal != idCheck){
      let fdatas = $("#join").serializeJSON();
  
      $.ajax({
        url: "/CodePeople/MemberJoin.do",
        type: "post",
        data: fdatas,
        dataType: "json",
        success: function (resp) {
          alert("회원가입 성공!");
          location.href = "/CodePeople/rehearsal/home.html";
        },
        error: function (xhr) {
          alert("회원가입 클릭 시 에러상태 : " + xhr.status);
        },
      });
    } else {
      alert('잘못 입력하셨거나, 비어있는 공란이 존재합니다. 다시 확인해 주세요.');
      location.href = "/CodePeople/rehearsal/join.html";
      return false;
    }

  });
  

// 회원정보 수정 버튼 클릭 시 이벤트 처리
  $('#memberUpdateBtn').on('click', function () {
    if (
      !(passReg.test(passVal)) ||
      !(telReg.test(telVal)) ||
      !(emailReg.test(emailVal)) ||
      pass2Val != passVal ||
      passVal == "" ||
      pass2Val == "" ||
      emailVal == "" ||
      $("#roadAddress").val() == "" ||
      $('#detailAddress').val() == ""
    ) {
      alert(
        "잘못 입력하셨거나, 비어있는 공란이 존재합니다. 다시 확인해 주세요."
      );
      location.href = "#";
      return false;
    }

    let fdatas = $('#memberUpdateForm').serializeJSON();

    $.ajax({
      url: "/CodePeople/MemberUpdate.do",
      type: "post",
      data: fdatas,
      dataType: "json",
      success: function (resp) {
        alert("회원정보 수정이 성공적으로 완료되었습니다!");
        location.href= resp.myPage;
      },
       error: function (xhr) {
        alert("회원 수정버튼 클릭 시 에러상태 : " + xhr.status);
      },
    });
  });

  // 회원탈퇴 버튼 클릭시 이벤트 처리
  // $('#doubleCheck2').keyup(function (e) { 
  //   console.log($('#doubleCheck1').data("value"));
  //   console.log($('#doubleCheck2').val());
  // });

    
    $('#deleteMember').on('click', function () {
      if ($("#pass").val() != $("#pass2").val()) {
        alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
        document.getElementById("#deleteBtn").style.display = "none";
      }
      
      let chk1 = $('#doubleCheck1').data("value");
      let chk2 = $('#doubleCheck2').val();
      let memId = $(this).data("value");
      let memPw = $('#pass').val();
  
      if(chk1 == chk2){
        $.ajax({
          url: "/CodePeople/MemberDelete.do",
          type: "post",
          data: {
            "memId" : memId,
            "memOrignlPw" : memPw
          },
          dataType: "json",
          success: function (resp) {
            if(resp.flag == "true"){
              alert(resp.success);
              location.href="/CodePeople/rehearsal/home.html";
            } else {
              alert(resp.error);
            }
          },
          error: function (xhr) {
            alert("회원 수정버튼 클릭 시 에러상태 : " + xhr.status);
          },
        });
      } else {
        alert(`"${chk1}"를 입력해 주세요.`);
        // console.log(memId);
      }
  });
   
});

// 다음 도로명 주소 API
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ""; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== "" && data.apartment === "Y") {
        extraRoadAddr +=
          extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName;
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== "") {
        extraRoadAddr = " (" + extraRoadAddr + ")";
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("postCode").value = data.zonecode;
      document.getElementById("roadAddress").value = roadAddr;

      var roadSido = data.sido;
      var roadSigungu = data.sigungu;

      document.getElementById("cityCodeNo").value = data.sido;
      document.getElementById("provCodeNo").value = data.sigungu;

    },
  }).open();
}

function proc(){
	
	execDaumPostcode();
	
	setTimeout(function(){
		let cityCodeNo = $('#cityCodeNo').val();
		let provCodeNo = $('#provCodeNo').val();
		console.log(cityCodeNo, provCodeNo);
		
		$.ajax({

			url: '/CodePeople/ConvertForm.do',
			type: 'get',
			data: {
				"cityCodeNo" : cityCodeNo,
				"provCodeNo" : provCodeNo
			},
			dataType: 'json',
			success: function(res){
				
				$('#cityCodeNo').val(res.cityCodeNo);
				$('#provCodeNo').val(res.provCodeNo);
				
				console.log(res.cityCodeNo, res.provCodeNo);
			},
			error: function(err){
				alert(`status : ${err.status}`);
			}
		})
	}, 6000)
}


// 회원가입 버튼 클릭시 캡챠 api function
function FormSubmit() {
  // document.testForm.submit();
  if (grecaptcha.getResponse() == "") {
    alert("회원가입에 실패했습니다!!!");
    return false;
  } else {
    alert("회원가입이 성공적으로 완료되었습니다!");
    return true;
  }
}
