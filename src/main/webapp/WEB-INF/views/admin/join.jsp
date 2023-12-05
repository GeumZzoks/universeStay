<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lnag="ko">

<head>
    <meta charset="UTF-8">
    <title>관리자 회원가입</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>

<body class="screens-admin-register_body">
<div class="screens-admin-register_main_signup">
    <!--웹페이지 상단-->
    <header class="screens-admin-register_header">
        <!--UniverseStay LOGO-->
        <a href="/admin/main/dashboard" class="screens-user-join_a" title="관리자 홈페이지">
            <img src="/resources/img/logo/logo.png" class="screens-admin-register_logo_image"></a>
    </header>

    <!--회원가입 부분-->
    <section>
        <!--닉네임, 비번, 비번재확인-->
        <h5 class="screens-admin-register_h5">관리자 닉네임*</h5>
        <div style="display: flex;">
            <span class="screens-admin-register_signup_input"
                  style="width:100%;">
                    <input id="screens-admin-register_signup_id" type="text" class="form-control"
                           placeholder="아이디"></input>
            </span>

            <span class="screens-admin-register_mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary"
                           id="screens-admin-register_id_Check_Btn"
                           value="아이디 중복 확인"> <br>
            </span>
        </div>
        <%-- JS 아이디 중복 확인 체크 --%>
        <span class="screens-admin-register_helper_text_span" id="id_input_helper_text"></span>


        <h5 class="screens-admin-register_h5">비밀번호*</h5>
        <span class="screens-admin-register_signup_input">
            <input type="password" id="screens-admin-register_signup_pw" placeholder="비밀번호"
                   class="screens-user-join_input"
                   value="" maxlength="20" autocomplete="new-password" aria-autocomplete="list">
            <span class="screens-admin-register_pw_lock"></span>
        </span>

        <h5 class="screens-admin-register_h5">비밀번호 재확인*</h5>
        <span class="screens-admin-register_signup_input">
                <input type="password" id="screens-admin-register_signup_pww" placeholder="비밀번호 재확인"
                       class="screens-admin-register_input" value="" maxlength="20"
                       autocomplete="new-password"
                       aria-autocomplete="list">
                <span class="screens-admin-register_pww_lock"></span>
            </span>

        <%-- JS 비밀번호 유효성 검사 체크 --%>
        <span class="screens-admin-register_helper_text_span" id="pwd_input_helper_text"></span>
        <div style="margin-top: 35px;">
            <!-- 이메일 -->
            <h5 class="screens-admin-register_h5" style="margin-bottom: 0px;">본인 확인 이메일*</h5>
            <div style="display: flex;">
                <span class="screens-admin-register_signup_input"
                      style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="screens-admin-register_signup_email" type="text" class="form-control"
                           placeholder="이메일 입력"></input>
                </span>
                <span class="screens-admin-register_mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary"
                           id="screens-admin-register_mail_Check_Btn"
                           value="인증번호 보내기"> <br>
                </span>
            </div>

            <div style="margin-top: 10px;">
                <span class="screens-admin-register_signup_input">
                    <input id="screens-admin-register_code_check_input" type="text"
                           class="form-control"
                           placeholder="인증번호 입력"></input>
                </span>
            </div>
        </div>

        <div style="margin-top: 35px;">
            <h5 class="screens-admin-register_h5">휴대전화*</h5>
            <span class="screens-admin-register_signup_input">
                    <input id="screens-admin-register_signup_phone_1" type="text"
                           placeholder="전화번호 입력"/>
            </span>
        </div>

        <div>
            <!--가입하기-->
            <div class="screens-admin-register_signup_btn_wrap" style="text-align: center">
                <button id="screens-admin-register_signup_btn">가입하기</button>
            </div>
        </div>
    </section>

    <!--저작권 정보-->
    <footer class="screens-admin-register_footer">
        <div class="screens-admin-register_footer__div">
            <span>이용약관 | 개인정보처리방침 | 책임의 한계와 고지 | 회원정보 고객센터</span>
            <div>© UniverseStay Corp.</div>
        </div>
    </footer>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/js/admin/register.js"></script>

<script>
  // 이메일 인증
  $('#screens-admin-register_mail_Check_Btn').click(function () {
    const email = $('#screens-admin-register_signup_email').val(); // 이메일 주소값 얻어오기!
    const checkInput = $('#screens-admin-register_code_check_input') // 인증번호 입력하는곳

    $.ajax({
      type: 'GET',
      url: '<c:url value ="/admin/register/mailCheck?email="/>' + email,
      success: function (data) {
        console.log(data);
        checkInput.attr('disabled', false);
        code = data;
        alert('인증번호가 전송되었습니다.');
      },
      error: function (xhr, status, error) {
        console.error("Ajax 요청 실패:", status, error);
        console.log(xhr.responseText);
      }
    });
  });

  // 만약 Oauth로 회원가입을 들어오면 email, pwd 입력란 value 채우고 hidden으로 바꾼다.
  if ("${userEmail}" != null && "${userEmail}" != "") {
    $('#signup_pw')
    .attr('value', '${userPwd}');
    $('#signup_pww')
    .attr('value', '${userPwd}');
    $('#signup_email')
    .attr('value', '${userEmail}');

    $('.signup_pwd_wrapper')
    .hide();
    $('.signup_email_wrapper')
    .hide();
  }


</script>

</body>

</html>