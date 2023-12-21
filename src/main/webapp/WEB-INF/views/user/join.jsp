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
        <a onclick="location.href ='/'" class="screens-user-join_a" title="유니버스테이 홈페이지">
            <img src="/resources/img/logo/logo.png" class="screens-user-join_logo_image"></a>
    </header>

    <!--회원가입 부분-->
    <section>

        <!--이메일, 비번, 비번재확인-->
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
        <div style="display: flex;">
                <span class="screens-user-join_signup_input"
                      style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="screens-user-join_code_check_input" type="text" class="form-control"
                           placeholder="인증번호 입력"></input>
                    <span class="certificationTime" style="color: #222222">03:00</span>
                </span>
            <span class="screens-user-join_helper_text_span"
                  id="email_code_input_helper_text"></span>

            <span class="screens-user-join_mail_code_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary"
                           id="screens-user-join_mail_code_check_Btn"
                           value="인증번호 확인" onclick="confirmAuthenticationNumber()"> <br>
                </span>
        </div>

        <h5 class="screens-user-join_h5" style="margin-top:30px;">비밀번호*</h5>
        <span class="screens-user-join_signup_input">

            <input type="password" id="screens-user-join_signup_pw" placeholder="비밀번호"
                   class="screens-user-join_input"
                   value="" maxlength="20" autocomplete="new-password" aria-autocomplete="list">
            <span class="screens-user-join_pw_lock"></span>
        </span>
            <span class="screens-user-join_helper_text_span"
                  id="pwd_input_first_helper_text"></span>

            <h5 class="screens-user-join_h5" style="margin-top: 25px;">비밀번호 재확인*</h5>
            <span class="screens-user-join_signup_input">
                <input type="password" id="screens-user-join_signup_pww" placeholder="비밀번호 재확인"
                       class="screens-user-join_input" value="" maxlength="20"
                       autocomplete="new-password"
                       aria-autocomplete="list">
                <span class="screens-user-join_pww_lock"></span>
            </span>
            <span class="screens-user-join_helper_text_span" id="pwd_input_helper_text"></span>
        </div>

        <div style="margin-top: 35px;">
            <!--이름,생년월일,성별,이메일-->
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">이름*</h5>
            <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_signup_name" placeholder="이름" type="text"></input>
                </span>
            <h5 class="screens-user-join_h5" style="margin-top:30px;">생년월일</h5>
            <span style="display: flex;  margin-top: 10px;">
                <span class="screens-user-join_dropdown" id="yearDropdown"
                      style="margin-left: 10px;">
                            <input type="text" class="screens-user-join_dropdown__textBox"
                                   placeholder="년" readonly
                                   onclick="toggleDropdown('yearDropdown')">
                            <div class="screens-user-join_dropdown__option"
                                 style="text-align: center">
                                <div onclick="selectItem('yearDropdown', '2004')">2004</div>
                                <div onclick="selectItem('yearDropdown', '2003')">2003</div>
                                <div onclick="selectItem('yearDropdown', '2002')">2002</div>
                                <div onclick="selectItem('yearDropdown', '2001')">2001</div>
                                <div onclick="selectItem('yearDropdown', '2000')">2000</div>
                                <div onclick="selectItem('yearDropdown', '1999')">1999</div>
                                <div onclick="selectItem('yearDropdown', '1998')">1998</div>
                                <div onclick="selectItem('yearDropdown', '1997')">1997</div>
                                <div onclick="selectItem('yearDropdown', '1996')">1996</div>
                                <div onclick="selectItem('yearDropdown', '1995')">1995</div>
                                <div onclick="selectItem('yearDropdown', '1994')">1994</div>
                                <div onclick="selectItem('yearDropdown', '1993')">1993</div>
                                <div onclick="selectItem('yearDropdown', '1992')">1992</div>
                                <div onclick="selectItem('yearDropdown', '1991')">1991</div>
                                <div onclick="selectItem('yearDropdown', '1990')">1990</div>
                                <div onclick="selectItem('yearDropdown', '1989')">1989</div>
                                <div onclick="selectItem('yearDropdown', '1988')">1988</div>
                                <div onclick="selectItem('yearDropdown', '1987')">1987</div>
                                <div onclick="selectItem('yearDropdown', '1986')">1986</div>
                                <div onclick="selectItem('yearDropdown', '1985')">1985</div>
                                <div onclick="selectItem('yearDropdown', '1984')">1984</div>
                                <div onclick="selectItem('yearDropdown', '1983')">1983</div>
                                <div onclick="selectItem('yearDropdown', '1982')">1982</div>
                                <div onclick="selectItem('yearDropdown', '1981')">1981</div>
                                <div onclick="selectItem('yearDropdown', '1980')">1980</div>
                                <div onclick="selectItem('yearDropdown', '1979')">1979</div>
                                <div onclick="selectItem('yearDropdown', '1978')">1978</div>
                                <div onclick="selectItem('yearDropdown', '1977')">1977</div>
                                <div onclick="selectItem('yearDropdown', '1976')">1976</div>
                                <div onclick="selectItem('yearDropdown', '1975')">1975</div>
                                <div onclick="selectItem('yearDropdown', '1974')">1974</div>
                                <div onclick="selectItem('yearDropdown', '1973')">1973</div>
                                <div onclick="selectItem('yearDropdown', '1972')">1972</div>
                                <div onclick="selectItem('yearDropdown', '1971')">1971</div>
                                <div onclick="selectItem('yearDropdown', '1970')">1970</div>
                                <div onclick="selectItem('yearDropdown', '1969')">1969</div>
                                <div onclick="selectItem('yearDropdown', '1968')">1968</div>
                                <div onclick="selectItem('yearDropdown', '1967')">1967</div>
                                <div onclick="selectItem('yearDropdown', '1966')">1966</div>
                                <div onclick="selectItem('yearDropdown', '1965')">1965</div>
                                <div onclick="selectItem('yearDropdown', '1964')">1964</div>
                                <div onclick="selectItem('yearDropdown', '1963')">1963</div>
                                <div onclick="selectItem('yearDropdown', '1962')">1962</div>
                                <div onclick="selectItem('yearDropdown', '1961')">1961</div>
                                <div onclick="selectItem('yearDropdown', '1960')">1960</div>
                                <div onclick="selectItem('yearDropdown', '1959')">1959</div>
                                <div onclick="selectItem('yearDropdown', '1958')">1958</div>
                                <div onclick="selectItem('yearDropdown', '1957')">1957</div>
                                <div onclick="selectItem('yearDropdown', '1956')">1956</div>
                                <div onclick="selectItem('yearDropdown', '1955')">1955</div>
                                <div onclick="selectItem('yearDropdown', '1954')">1954</div>
                                <div onclick="selectItem('yearDropdown', '1953')">1953</div>
                                <div onclick="selectItem('yearDropdown', '1952')">1952</div>
                                <div onclick="selectItem('yearDropdown', '1951')">1951</div>
                                <div onclick="selectItem('yearDropdown', '1950')">1950</div>
                                <div onclick="selectItem('yearDropdown', '1949')">1949</div>
                                <div onclick="selectItem('yearDropdown', '1948')">1948</div>
                                <div onclick="selectItem('yearDropdown', '1947')">1947</div>
                                <div onclick="selectItem('yearDropdown', '1946')">1946</div>
                                <div onclick="selectItem('yearDropdown', '1945')">1945</div>
                                <div onclick="selectItem('yearDropdown', '1944')">1944</div>
                                <div onclick="selectItem('yearDropdown', '1943')">1943</div>
                                <div onclick="selectItem('yearDropdown', '1942')">1942</div>
                                <div onclick="selectItem('yearDropdown', '1941')">1941</div>
                                <div onclick="selectItem('yearDropdown', '1940')">1940</div>
                                <div onclick="selectItem('yearDropdown', '1939')">1939</div>
                                <div onclick="selectItem('yearDropdown', '1938')">1938</div>
                                <div onclick="selectItem('yearDropdown', '1937')">1937</div>
                                <div onclick="selectItem('yearDropdown', '1936')">1936</div>
                                <div onclick="selectItem('yearDropdown', '1935')">1935</div>
                                <div onclick="selectItem('yearDropdown', '1934')">1934</div>
                                <div onclick="selectItem('yearDropdown', '1933')">1933</div>
                                <div onclick="selectItem('yearDropdown', '1932')">1932</div>
                                <div onclick="selectItem('yearDropdown', '1931')">1931</div>
                                <div onclick="selectItem('yearDropdown', '1930')">1930</div>
                                <div onclick="selectItem('yearDropdown', '1929')">1929</div>
                                <div onclick="selectItem('yearDropdown', '1928')">1928</div>
                                <div onclick="selectItem('yearDropdown', '1927')">1927</div>
                                <div onclick="selectItem('yearDropdown', '1926')">1926</div>
                                <div onclick="selectItem('yearDropdown', '1925')">1925</div>
                                <div onclick="selectItem('yearDropdown', '1924')">1924</div>
                            </div>
                    </span>

                   <span class="screens-user-join_dropdown" id="monthDropdown"
                         style="margin-left: 10px; ">
                            <input type="text" class="screens-user-join_dropdown__textBox"
                                   placeholder="월" readonly
                                   onclick="toggleDropdown('monthDropdown')">
                            <div class="screens-user-join_dropdown__option"
                                 style="text-align: center;">
                                    <div onclick="selectItem('monthDropdown', '1')">1</div>
                                    <div onclick="selectItem('monthDropdown', '2')">2</div>
                                    <div onclick="selectItem('monthDropdown', '3')">3</div>
                                    <div onclick="selectItem('monthDropdown', '4')">4</div>
                                    <div onclick="selectItem('monthDropdown', '5')">5</div>
                                    <div onclick="selectItem('monthDropdown', '6')">6</div>
                                    <div onclick="selectItem('monthDropdown', '7')">7</div>
                                    <div onclick="selectItem('monthDropdown', '8')">8</div>
                                    <div onclick="selectItem('monthDropdown', '9')">9</div>
                                    <div onclick="selectItem('monthDropdown', '10')">10</div>
                                    <div onclick="selectItem('monthDropdown', '11')">11</div>
                                    <div onclick="selectItem('monthDropdown', '12')">12</div>
                            </div>
                    </span>
                    <span class="screens-user-join_dropdown" id="dayDropdown"
                          style="margin-left: 10px;">
                            <input type="text" class="screens-user-join_dropdown__textBox"
                                   placeholder="일" readonly
                                   onclick="toggleDropdown('dayDropdown')">
                            <div class="screens-user-join_dropdown__option"
                                 style="text-align: center">
                                    <div onclick="selectItem('dayDropdown', '1')">1</div>
                                    <div onclick="selectItem('dayDropdown', '2')">2</div>
                                    <div onclick="selectItem('dayDropdown', '3')">3</div>
                                    <div onclick="selectItem('dayDropdown', '4')">4</div>
                                    <div onclick="selectItem('dayDropdown', '5')">5</div>
                                    <div onclick="selectItem('dayDropdown', '6')">6</div>
                                    <div onclick="selectItem('dayDropdown', '7')">7</div>
                                    <div onclick="selectItem('dayDropdown', '8')">8</div>
                                    <div onclick="selectItem('dayDropdown', '9')">9</div>
                                    <div onclick="selectItem('dayDropdown', '10')">10</div>
                                    <div onclick="selectItem('dayDropdown', '11')">11</div>
                                    <div onclick="selectItem('dayDropdown', '12')">12</div>
                                    <div onclick="selectItem('dayDropdown', '13')">13</div>
                                    <div onclick="selectItem('dayDropdown', '14')">14</div>
                                    <div onclick="selectItem('dayDropdown', '15')">15</div>
                                    <div onclick="selectItem('dayDropdown', '16')">16</div>
                                    <div onclick="selectItem('dayDropdown', '17')">17</div>
                                    <div onclick="selectItem('dayDropdown', '18')">18</div>
                                    <div onclick="selectItem('dayDropdown', '19')">19</div>
                                    <div onclick="selectItem('dayDropdown', '20')">20</div>
                                    <div onclick="selectItem('dayDropdown', '21')">21</div>
                                    <div onclick="selectItem('dayDropdown', '22')">22</div>
                                    <div onclick="selectItem('dayDropdown', '23')">23</div>
                                    <div onclick="selectItem('dayDropdown', '24')">24</div>
                                    <div onclick="selectItem('dayDropdown', '25')">25</div>
                                    <div onclick="selectItem('dayDropdown', '26')">26</div>
                                    <div onclick="selectItem('dayDropdown', '27')">27</div>
                                    <div onclick="selectItem('dayDropdown', '28')">28</div>
                                    <div onclick="selectItem('dayDropdown', '29')">29</div>
                                    <div onclick="selectItem('dayDropdown', '30')">30</div>
                                    <div onclick="selectItem('dayDropdown', '31')">31</div>
                            </div>
                    </span>

<%--                    <span class="screens-user-join_signup_input_birth" style="margin-left: 10px;">--%>
<%--                        <input id="screens-user-join_signup_birth_dd" type="text"--%>
<%--                               placeholder="일"></input>--%>
<%--                    </span>--%>
            </span>

            <h5 class="screens-user-join_h5" style="margin-top: 30px;">아이디*</h5>
            <div style="display: flex;">
            <span class="screens-user-join_signup_input"
                  style="width:100%; margin: 10px 0px 0px 0px">
                    <input id="screens-user-join_signup_id" type="text" class="form-control"
                           placeholder="아이디"></input>
            </span>

                <span class="screens-user-join_mail_Check_Btn_wrap">
                    <input type="button" class="btn btn-primary" id="screens-user-join_id_Check_Btn"
                           value="아이디 중복 확인" onclick="IdcheckButtonPressed()"> <br>
            </span>
            </div>
            <span class="screens-user-join_helper_text_span" id="id_input_helper_text"></span>

        </div>

        <div style="margin-top: 35px;">
            <h5 class="screens-user-join_h5" style="margin-bottom: 0px;">휴대전화 1*</h5>
            <span class="screens-user-join_signup_input">
                    <input id="screens-user-join_signup_phone_1" type="text"
                           placeholder="전화번호 입력"></input>
            </span>

            <h5 class="screens-user-join_h5" style="margin-top: 30px;">휴대전화 2</h5>
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
    const email = $('#screens-user-join_signup_email').val();
    const checkInput = $('.screens-user-join_code_check_input');

    var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (!email_rule.test(email)) {
      alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
      $("#screens-user-join_signup_email").focus();
      return false;
    }

    $.ajax({
      type: 'get',
      url: '<c:url value="/user/mailCheck?email="/>' + email,
      success: function (data) {
        checkInput.attr('disabled', false);
        console.log(data);
        if ("Y" == data) {
          alert('인증번호가 전송되었습니다.');
          startTimer();
        }
      },
      error: function (xhr, status, error) {
        alert('이미 가입된 이메일입니다. 다시 입력하세요');
        $("#screens-user-join_signup_email").focus();
        console.error("Ajax request failed:", status, error);
        console.log(xhr.responseText);
      }
    });
  });

  // 만약 Oauth로 회원가입을 들어오면 email, pwd 입력란 value 채우고 hidden으로 바꾼다.
  if ("${userEmail}" != null && "${userEmail}" != "") {
    $('#screens-user-join_signup_pw')
    .attr('value', '${userPwd}');
    $('#screens-user-join_signup_pww')
    .attr('value', '${userPwd}');
    $('#screens-user-join_signup_email')
    .attr('value', '${userEmail}');

    $('.screens-user-join__pwd-wrapper')
    .hide();
    $('.screens-user-join__email-wrapper')
    .hide();
  }


</script>

<script>
  function toggleDropdown(dropdownId) {
    $("#" + dropdownId + " .screens-user-join_dropdown__option").toggle();
  }

  window.onclick = function (event) {
    if (!event.target.matches('.screens-user-join_dropdown__textBox')) {
      $(".screens-user-join_dropdown__option").hide();
    }
  }
</script>

<script>
  function toggleDropdown(dropdownId) {
    $("#" + dropdownId + " .screens-user-join_dropdown__option").toggle();
  }

  function selectItem(dropdownId, value) {
    $("#" + dropdownId + " .screens-user-join_dropdown__textBox").val(value);
    $("#" + dropdownId + " .screens-user-join_dropdown__option").hide();
  }

  window.onclick = function (event) {
    if (!event.target.matches('.screens-user-join_dropdown__textBox')) {
      $(".screens-user-join_dropdown__option").hide();
    }
  }


</script>

</body>

</html>