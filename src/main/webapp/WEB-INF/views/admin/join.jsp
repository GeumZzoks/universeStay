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
                           required
                           placeholder="이메일 입력">
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
    /**
     * 이메일 인증번호 보내기
     */
    document.querySelector("#screens-admin-register_mail_Check_Btn").addEventListener("click",
            function () {

                const email = document.getElementById("screens-admin-register_signup_email").value; // 이메일 주소값 얻어오기!

                if (email === '') {
                    alert("메일을 입력해주세요!");
                    return;
                }

                $.ajax({
                    type: 'post',
                    url: `/admin/register/mailCheck`,
                    data: {
                        email,
                    },
                    success: function (res) {
                        alert('인증번호가 전송되었습니다.');
                        console.log(res);
                    },
                    error: function (res) {
                        alert("잘못된 요청입니다.");
                        console.log(res);
                    }
                });
            });

</script>
</body>
</html>