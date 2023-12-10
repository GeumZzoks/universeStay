<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lnag="ko">

<head>
    <meta charset="UTF-8">
    <title>유니버스테이 회원가입</title>
    <%--    <link rel="stylesheet" href="/resources/css/common/global.css">--%>
    <%--    <link rel="stylesheet" href="/resources/css/user/join.css">--%>
    <link rel="stylesheet" href="/resources/css2/style.css">

</head>

<body class="screens-user-join_body">
<div class="screens-user-join_main_signup">
    <!--웹페이지 상단-->
    <header class="screens-user-join_header">
        <!--UniverseStay LOGO-->
        <a href="/" class="screens-user-join_a" title="유니버스테이 홈페이지">
            <img src="/resources/img/logo/logo.png" class="screens-user-join_logo_image"></a>
    </header>

    <!--회원가입 부분-->
    <section>
        <!--닉네임, 비번, 비번재확인-->
        <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">닉네임*</h5>
        <div style="display: flex;">
            <span class="screens-user-join_signup_input"
                  style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="screens-user-join_signup_id" type="text" class="form-control"
                           placeholder="아이디"></input>
            </span>

            <span class="screens-user-join_mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary" id="screens-user-join_id_Check_Btn"
                           value="아이디 중복 확인"> <br>
            </span>
        </div>
        <span class="screens-user-join_helper_text_span" id="id_input_helper_text"></span>

        <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">비밀번호*</h5>
        <span class="screens-user-join_signup_input">
            <input type="password" id="screens-user-join_signup_pw" placeholder="비밀번호"
                   class="screens-user-join_input"
                   value="" maxlength="20" autocomplete="new-password" aria-autocomplete="list">
            <span class="screens-user-join_pw_lock"></span>
        </span>
        <span class="screens-user-join_helper_text_span" id="pwd_input_first_helper_text"></span>

        <h5 class="screens-user-join_h5" style="margin-top: 25px;">비밀번호 재확인*</h5>
        <span class="screens-user-join_signup_input">
                <input type="password" id="screens-user-join_signup_pww" placeholder="비밀번호 재확인"
                       class="screens-user-join_input" value="" maxlength="20"
                       autocomplete="new-password"
                       aria-autocomplete="list">
                <span class="screens-user-join_pww_lock"></span>
            </span>
        <span class="screens-user-join_helper_text_span" id="pwd_input_helper_text"></span>
        <div style="margin-top: 35px;">
            <!--이름,생년월일,성별,이메일-->
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">이름*</h5>
            <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_signup_name" type="text"></input>
                </span>
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">생년월일</h5>
            <span style="display: flex;  margin-top: 10px;">
                    <span class="screens-user-join_signup_input_birth">
                        <input id="screens-user-join_signup_birth_yy" type="text"
                               placeholder="년(4자)"></input>
                    </span>
                   <span class="screens-user-join_dropdown" style="margin-left: 10px;">
                            <input type="text" class="screens-user-join_dropdown__textBox"
                                   placeholder="월" readonly>
                            <div class="screens-user-join_dropdown__option"
                                 style="text-align: center">
                                <div onclick="show('1')">1</div>
                                <div onclick="show('2')">2</div>
                                <div onclick="show('3')">3</div>
                                <div onclick="show('4')">4</div>
                                <div onclick="show('5')">5</div>
                                <div onclick="show('6')">6</div>
                                <div onclick="show('7')">7</div>
                                <div onclick="show('8')">8</div>
                                <div onclick="show('9')">9</div>
                                <div onclick="show('10')">10</div>
                                <div onclick="show('11')">11</div>
                                <div onclick="show('12')">12</div>
                            </div>
                    </span>
                    <span class="screens-user-join_signup_input_birth" style="margin-left: 10px;">
                        <input id="screens-user-join_signup_birth_dd" type="text"
                               placeholder="일"></input>
                    </span>
            </span>
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">본인 확인 이메일*</h5>
            <div style="display: flex;">
                <span class="screens-user-join_signup_input"
                      style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="screens-user-join_signup_email" type="text" class="form-control"
                           placeholder="이메일 입력"></input>
                </span>
                <span class="screens-user-join_helper_text_span"
                      id="email_input_helper_text"></span>

                <span class="screens-user-join_mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary"
                           id="screens-user-join_mail_Check_Btn"
                           value="인증번호 보내기"> <br>
                </span>
            </div>

            <div style="margin-top: 10px;">
                <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_code_check_input" type="text" class="form-control"
                           placeholder="인증번호 입력"></input>
                </span>
            </div>
        </div>

        <div style="margin-top: 35px;">
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">휴대전화 1*</h5>
            <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_signup_phone_1" type="text"
                           placeholder="전화번호 입력"></input>
            </span>

            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">휴대전화 2</h5>
            <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_signup_phone_2" type="text"
                           placeholder="전화번호 입력"></input>
                </span>
        </div>


        <div style="margin-top: 35px;">
            <!--주소-->
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">주소</h5>
            <div style="display: flex;">
                <span class="screens-user-join_signup_input"
                      style="width:100%; margin: 10px 0px 0px 0px">
                  <input id="screens-user-join_address_roadAddress" type="text" class="form-control"
                         name="screens-user-join_address_roadAddress"
                         placeholder="도로명 주소"></input>
                </span>

                <span class="screens-user-join_address_Check_Btn_wrap">
                <input type="button" id="screens-user-join_address_Check_Btn"
                       onclick="search_postcode()"
                       value="주소 찾기"> <br>
                </span>
            </div>

            <div style="margin-top: 10px;">
              <span class="screens-user-join_signup_input">
                  <input id="screens-user-join_address_detailAddress" type="text"
                         class="form-control"
                         name="screens-user-join_address_detailAddress" placeholder="상세 주소"></input>
              </span>
            </div>

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        </div>

        <div>
            <!--가입하기-->
            <div class="screens-user-join_signup_btn_wrap" style="text-align: center">
                <button id="screens-user-join_signup_btn">가입하기</button>
            </div>
        </div>
    </section>

    <!--저작권 정보-->
    <footer class="screens-user-join_footer">
        <div style="font-size: 12px; text-align: center">
            <span>이용약관 | 개인정보처리방침 | 책임의 한계와 고지 | 회원정보 고객센터</span>
            <div>© UniverseStay Corp.</div>
        </div>
    </footer>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/js/user/join.js"></script>

<script>
    // 이메일 인증
    $('#screens-user-join_mail_Check_Btn').click(function () {
        const email = $('#screens-user-join_signup_email').val(); // 이메일 주소값 얻어오기!
        const checkInput = $('.screens-user-join_code_check_input') // 인증번호 입력하는곳

        $.ajax({
            type: 'get',
            url: '<c:url value ="/user/mailCheck?email="/>' + email,
            success: function (data) {
                checkInput.attr('disabled', false);
                console.log(data)
                if ("Y" == data) {
                    alert('인증번호가 전송되었습니다.')
                }
            },
            error: function (xhr, status, error) {
                alert('이미 가입된 이메일입니다. 다시 입력해주세요');
                $("#screens-user-join_signup_email").focus();
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