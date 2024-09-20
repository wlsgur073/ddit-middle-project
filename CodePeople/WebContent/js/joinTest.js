$(function () {

  // 아이디 정규식
  $("#id").on("keyup", function () {
    let idVal = $(this).val();
    console.log(idVal);
    let idReg = /^([a-z])([a-z0-9_-]){5,20}$/g;

    if (!idReg.test(idVal)) {
      $("#idMsg").show();
      $('#id2Msg').hide();
      $("#idMsg-green").hide();
    } else {
      $("#idMsg").hide();
      $('#id2Msg').hide();
      $("#idMsg-green").show();

    }
    
    $.ajax({
      url: "/CodePeople/JoinIdCheck.do",
      type: "get",
      data: { id: idVal },
      dataType: "json",
      success: function (res) {
        alert(res.id);
        if (idVal == res.id) {
          $("#idMsg-green").hide();
          $("#id2Msg").show();
          $("#id2Msg").hide();
        }
      },
      error: function (xhr) {
        alert("상태 : " + xhr.status);
      },
    });

    if (idVal == "") {
      $("#idMsg").hide();
      $('#id2Msg').hide();
      $("#idMsg-green").hide();
    }
    
  });
  

  // 비밀번호 정규식
  $("#pass").on("keyup", function () {
    let passVal = $(this).val();

    let passReg =
      /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;

    // !passReg.test(passVal) ? $("#pswd1Msg").show() : $("#pswd1Msg").hide();
    if(!(passReg.test(passVal))){
      $('#pswd1Msg').show();
      $("#pswd1Msg-green").hide();
    } else {
      $('#pswd1Msg').hide();
      $("#pswd1Msg-green").show();
    }

    if (passVal == "") {
      $("#pswd1Msg").hide();
    }
  });

  // 비밀번호 재확인 정규식
  $("#pass2").on("keyup", function () {
    let pass2Val = $(this).val();

    let pass2Reg = $('#pass').val();

    if(pass2Val != pass2Reg){
      $('#pswd2Msg').show();
      $("#pswd2Msg-green").hide();
    } else {
      $('#pswd2Msg').hide();
      $("#pswd2Msg-green").show();
    }

    if (pass2Val == "") {
      $("#pswd2Msg").hide();
    }
  });

  // 전화번호 정규식
  $("#tel").on("keyup", function () {
    let telVal = $(this).val();

    let telReg = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

    !telReg.test(telVal) ? $("#telMsg").show() : $("#telMsg").hide();
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
    let nameVal = $(this).val();
    console.log(nameVal);
    let nameReg = /^[가-힣a-zA-Z]+$/;

    !nameReg.test(nameVal) ? $("#nameMsg").show() : $("#nameMsg").hide();
    // if(!(nameReg.test(nameVal))){
    //   $('#nameMsg').show();
    // } else {
    //   $('#nameMsg').hide();
    // }

    if (nameVal === "") {
      $("#nameMsg").hide();
    }
  });

  // 이메일 정규식
  $("#email").on("keyup", function () {
    let emailVal = $(this).val();
    console.log(emailVal);
    let emailReg =
      /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/g;

    !emailReg.test(emailVal) ? $("#emailMsg").show() : $("#emailMsg").hide();
    // if(!(nameReg.test(nameVal))){
    //   $('#nameMsg').show();
    // } else {
    //   $('#nameMsg').hide();
    // }

    if (emailVal === "") {
      $("#nameMsg").hide();
    }
  });
});

// 다음 도로명 주소 API
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var extraRoadAddr = ''; // 참고 항목 변수

          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraRoadAddr += data.bname;
          }
          
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraRoadAddr !== ''){
              extraRoadAddr = ' (' + extraRoadAddr + ')';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('postCode').value = data.zonecode;
          document.getElementById("roadAddress").value = roadAddr;
          
          var roadSido = data.sido;
          var roadSigungu = data.sigungu;
          
          document.getElementById('cityCodeNo').value = data.sido;
          document.getElementById("provCodeNo").value = data.sigungu;
          
          // document.getElementById("jibunAddress").value = data.jibunAddress;
          
          // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          // if(roadAddr !== ''){
          //     document.getElementById("extraAddress").value = extraRoadAddr;
          // } else {
          //     document.getElementById("extraAddress").value = '';
          // }

          // var guideTextBox = document.getElementById("guide");
          // // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
          // if(data.autoRoadAddress) {
          //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
          //     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
          //     guideTextBox.style.display = 'block';

          // } else if(data.autoJibunAddress) {
          //     var expJibunAddr = data.autoJibunAddress;
          //     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
          //     guideTextBox.style.display = 'block';
          // } else {
          //     guideTextBox.innerHTML = '';
          //     guideTextBox.style.display = 'none';
          // }
      }
  }).open();
}

// 회원가입 버튼 클릭시 캡챠 api function
function FormSubmit() { 
  if (grecaptcha.getResponse() == ""){ 
    alert("회원가입에 실패했습니다!!!");
    return false; 
  } else { 
      alert("회원가입이 성공적으로 완료되었습니다!"); 
      return true; } 
  } 