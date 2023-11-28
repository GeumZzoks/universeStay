<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lnag="ko">

<head>
    <meta charset="UTF-8">
    <title>유니버스테이 회원가입</title>
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/user/join.css">
</head>

<body>
<div class="main_signup">
    <!--웹페이지 상단-->
    <header>
        <!--UniverseStay LOGO-->
        <div class="logo">
            <a href="/main.jsp" title="유니버스테이 홈페이지">
                <img src="/resources/img/logo/logo.png" class="logo_image"></a>
        </div>
    </header>

    <!--회원가입 부분-->
    <section class="signup-wrap">

        <div>
            <!--아이디,비번,비번재확인-->

            <h3>아이디*</h3>
            <%--            <span class="signup_input">--%>
            <%--                <input id="signup_id" type="text" name="user_nickname" placeholder="아이디"></input>--%>
            <div style="display: flex;">
            <span class="signup_input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="signup_id" type="text" class="form-control" name="user_nickname"
                           placeholder="아이디"></input>

                </span>

                <span class="mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary" id="id_Check_Btn"
                           value="아이디 중복 확인"> <br>
                </span>


            </div>
            <div>
                <span class="helper_text_span" id="id_input_helper_text"></span>
            </div>
            <%--            </span>--%>

            <h3>비밀번호*</h3>
            <span class="signup_input">
                <input type="password" id="signup_pw" name="user_pwd" placeholder="비밀번호"
                       class="input"
                       value="" maxlength="20" autocomplete="new-password" aria-autocomplete="list">
                <span class="pw_lock"></span>
            </span>

            <h3>비밀번호 재확인*</h3>
            <span class="signup_input">
                <input type="password" id="signup_pww" name="user_pwd_2" placeholder="비밀번호 재확인"
                       class="input" value="" maxlength="20" autocomplete="new-password"
                       aria-autocomplete="list">
                <span class="pww_lock"></span>
            </span>
            <div>
                <span class="helper_text_span" id="pwd_input_helper_text"></span>
            </div>


        </div>

        <div style="margin-top: 35px;">
            <!--이름,생년월일,성별,이메일-->
            <h3>이름*</h3>
            <span class="signup_input">
                    <input id="signup_name" name="user_name" type="text"></input>
                </span>

            <h3>생년월일</h3>
            <span style="display: flex;">
                    <span class="signup_input_birth">
                        <input id="signup_birth_yy" type="text" name="birth_year"
                               placeholder="년(4자)"></input>
                    </span>
                   <span class="dropdown" style="margin-left: 10px;">
                            <input type="text" class="dropdown__textBox" name="birth_month"
                                   placeholder="월" readonly>
                            <div class="dropdown__option">
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
                    <span class="signup_input_birth" style="margin-left: 10px;">
                        <input id="signup_birth_dd" type="text" name="birth_day"
                               placeholder="일"></input>
                    </span>
            </span>

            <h3>본인 확인 이메일*</h3>
            <div style="display: flex;">
                <span class="signup_input" style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="signup_email" type="text" class="form-control" name="user_email"
                           placeholder="이메일 입력"></input>
                </span>
                <span class="mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary" id="mail_Check_Btn"
                           value="인증번호 보내기"> <br>
                </span>
            </div>

            <div style="margin-top: 10px;">
                <span class="signup_input">
                    <input id="code_check_input" type="text" class="form-control"
                           name="code_check_input" placeholder="인증번호 입력"></input>
                </span>
            </div>
        </div>

        <div style="margin-top: 35px;">
            <!--휴대전화-->
            <h3>휴대전화 1*</h3>
            <span class="signup_input">
                    <input id="signup_phone_1" type="text" name="user_phone_num1"
                           placeholder="전화번호 입력"></input>
                </span>

            <h3>휴대전화 2</h3>
            <span class="signup_input">
                    <input id="signup_phone_2" type="text" name="user_phone_num2"
                           placeholder="전화번호 입력"></input>
                </span>
        </div>


        <div style="margin-top: 35px;">
            <!--주소-->
            <h3>주소</h3>
            <div style="display: flex;">
                <span class="signup_input" style="width:100%; margin: 10px 0px 0px 0px">
                  <input id="address_roadAddress" type="text" class="form-control"
                         name="address_roadAddress"
                         placeholder="도로명 주소"></input>
                </span>

                <span class="address_Check_Btn_wrap">
                <input type="button" id="address_Check_Btn" onclick="search_postcode()"
                       value="주소 찾기"> <br>
                </span>
            </div>

            <div style="margin-top: 10px;">
              <span class="signup_input">
                  <input id="address_detailAddress" type="text" class="form-control"
                         name="address_detailAddress" placeholder="상세 주소"></input>
              </span>
            </div>

            <h3>프로필 사진</h3>
            <div style="display: flex;">
                <span class="hiddenFileInput">
                    <label for="files">사진 선택</label>
                    <input type="file" id="files" name="user_img_url"/>
                </span>
            </div>

            </span>

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        </div>


        <div>
            <!--가입하기-->
            <div class="signup_btn_wrap">
                <button id="signup_btn">가입하기</button>
            </div>
        </div>


    </section>

    <!--저작권 정보-->
    <footer>
        <div class="copyright-wrap" style="font-size: 12px;">
            <span>이용약관 | 개인정보처리방침 | 책임의 한계와 고지 | 회원정보 고객센터</span>
            <div>© UniverseStay Corp.</div>
        </div>
    </footer>

</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="../../../resources/js/join.js"></script>

<script>
  // 이메일 인증
  $('#mail_Check_Btn').click(function () {
    const email = $('#signup_email').val(); // 이메일 주소값 얻어오기!
    const checkInput = $('.code_check_input') // 인증번호 입력하는곳

    $.ajax({
      type: 'get',
      url: '<c:url value ="/user/mailCheck?email="/>' + email,
      success: function (data) {
        checkInput.attr('disabled', false);
        code = data;
        alert('인증번호가 전송되었습니다.')
      },
      error: function (xhr, status, error) {
        console.error("Ajax 요청 실패:", status, error);
// 서버에서 전달한 오류 메시지를 확인할 수 있음
        console.log(xhr.responseText);
      }
    }); // end ajax
  }); // end send email

</script>

</body>

</html>