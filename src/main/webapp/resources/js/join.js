// 월 선택 박스
function show(anything) {
  document.querySelector(
      '.screens-user-join_dropdown__textBox').value = anything;
}

let dropdown = document.querySelector('.screens-user-join_dropdown');

dropdown.onclick = function () {
  dropdown.classList.toggle('active');

  // 다른 영역 클릭 시 드롭다운 닫기
  $(document).mouseup(function (e) {
    let container = $(".screens-user-join_dropdown");
    if (container.has(e.target).length === 0) {
      container.removeClass('active');
    }
  });
}

// 주소 검색 API
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function search_postcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== '' && data.apartment === 'Y') {
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName
            : data.buildingName);
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== '') {
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById(
          "screens-user-join_address_roadAddress").value = roadAddr;

      var guideTextBox = document.getElementById("guide");
      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if (data.autoRoadAddress) {
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
        guideTextBox.style.display = 'block';

      } else if (data.autoJibunAddress) {
        var expJibunAddr = data.autoJibunAddress;
        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
        guideTextBox.style.display = 'block';
      } else {
        guideTextBox.innerHTML = '';
        guideTextBox.style.display = 'none';
      }
    }
  }).open();
}

// 회원가입 버튼 클릭 시
$(document).ready(function () {
  // 가입하기 버튼 클릭 이벤트
  $("#screens-user-join_signup_btn").click(function () {

    if (fnSubmit()) {

      // 사용자가 입력한 정보
      var user_nickname = $("#screens-user-join_signup_id").val();
      var user_pwd = $("#screens-user-join_signup_pw").val();
      var user_confirmPassword = $("#screens-user-join_signup_pww").val();
      var user_name = $("#screens-user-join_signup_name").val();
      var user_birthYear = $("#screens-user-join_signup_birth_yy").val();
      var user_birthMonth = $(".screens-user-join_dropdown__textBox").val();
      var user_birthDay = $("#screens-user-join_signup_birth_dd").val();
      var user_email = $("#screens-user-join_signup_email").val();
      var user_phone_num1 = $("#screens-user-join_signup_phone_1").val();
      var user_phone_num2 = $("#screens-user-join_signup_phone_2").val();
      var address = $("#screens-user-join_address_roadAddress").val();
      var address_detail = $("#screens-user-join_address_detailAddress").val();
      var user_img_url = $("#file").val();
      // 서버로 전송할 데이터를 객체
      var userDto = {
        user_nickname: user_nickname,
        user_pwd: user_pwd,
        user_name: user_name,
        user_birth: new Date(user_birthYear, user_birthMonth - 1,
            user_birthDay),
        user_email: user_email,
        user_phone_num1: user_phone_num1,
        user_phone_num2: user_phone_num2,
        user_address: `${address} ${address_detail}`,
        user_img_url: user_img_url
      };

      // 서버에 가입 요청
      $.ajax({
        type: "post",
        url: "/user/join", // 가입 요청을 처리하는 컨트롤러 주소
        contentType: "application/json",
        data: JSON.stringify(userDto),
        success: function (response) {
          if (response == 1) {

            alert("회원가입에 성공하였습니다.");
            location.href = "/user/loginForm";
          } else {
            alert("회원가입에 실패하였습니다.");
            location.href = "/user/join";
          }
        },
        error: function (error) {
          console.error("가입 실패:", error);
        }
      });
    }

  });
});

$(function () {
  $("#screens-user-join_id_Check_Btn").click(function () {
    let user_nickname = $("#screens-user-join_signup_id").val();

    $.ajax({
      type: 'post',
      url: "/user/checkNickname",
      data: {"user_nickname": user_nickname},
      success: function (data) {
        if (data == "N") {
          result = "이 아이디를 사용할 수 있습니다.";

          $("#id_input_helper_text").html(result).removeClass(
              "unavailable")

        } else { // 실패한 경우
          const result = "이 아이디는 이미 사용 중입니다.";
          $("#id_input_helper_text").html(result).addClass(
              "unavailable");

          $("#screens-user-join_signup_id").val("").trigger("focus");
        }
      },
      error: function (error) {
        const result = "이 아이디는 이미 사용 중입니다.";
        $("#id_input_helper_text").html(result).addClass(
            "unavailable");
        // alert(error);
      },
    });
  });

  $(function () {
    $("#screens-user-join_signup_pw, #screens-user-join_signup_pww").on('input',
        function () {
          let user_pw = $("#screens-user-join_signup_pw").val();
          let user_pww = $("#screens-user-join_signup_pww").val();

          if (user_pw == user_pww) {
            result = "비밀번호가 일치합니다.";
            $("#pwd_input_helper_text").html(result).removeClass("unavailable");
          } else { // In case of failure
            const result = "비밀번호가 일치하지 않습니다.";
            $("#pwd_input_helper_text").html(result).addClass("unavailable");
          }
        });

    function fnSubmit() {

      var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

      if ($("#screens-user-join_signup_id").val() == null || $(
          "#screens-user-join_signup_id").val() == "") {
        alert("아이디를 입력해주세요.");
        $("#screens-user-join_signup_id").focus();

        return false;
      }

      if ($("#screens-user-join_signup_pw").val() == null || $(
          "screens-user-join_signup_pw").val() == "") {
        alert("비밀번호를 입력해주세요.");
        $("#screens-user-join_signup_pw").focus();

        return false;
      }

      if ($("#screens-user-join_signup_pww").val() == null || $(
          "#screens-user-join_signup_pww").val() == "") {
        alert("비밀번호 확인을 입력해주세요.");
        $("#screens-user-join_signup_pww").focus();

        return false;
      }

      if ($("#screens-user-join_signup_name").val() == null || $(
          "#screens-user-join_signup_name").val() == "") {
        alert("이름을 입력해주세요.");
        $("#screens-user-join_signup_name").focus();

        return false;
      }

      if ($("#screens-user-join_signup_email").val() == null || $(
          "#screens-user-join_signup_email").val() == "") {
        alert("이메일을 입력해주세요.");
        $("#screens-user-join_signup_email").focus();

        return false;
      }

      if (!email_rule.test($("#screens-user-join_signup_email").val())) {
        alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
        $("#screens-user-join_signup_email").focus();
        return false;
      }

      if ($("#screens-user-join_code_check_input").val() == null || $(
              "#screens-user-join_code_check_input").val()
          == "") {
        alert("인증번호를 입력해주세요.");
        $("#screens-user-join_code_check_input").focus();

        return false;
      }

      if (!tel_rule.test($("#screens-user-join_signup_phone_1").val())) {
        alert("전화번호 형식에 맞게 입력해주세요. ex) 010-0000-0000");
        $("#screens-user-join_signup_phone_1").focus();
        return false;
      }

      if (confirm("회원가입하시겠습니까?")) {
        $("#screens-user-join_signup_btn").submit();
        return true;
      }

    }
  });
});