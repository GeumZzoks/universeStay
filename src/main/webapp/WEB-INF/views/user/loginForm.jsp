<%@ page import="javax.servlet.http.Cookie" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%--    <link rel="stylesheet" href="/resources/css/common/global.css">--%>
<%--    <link rel="stylesheet" href="/resources/css/user/login.css">--%>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<%
    // 쿠키를 가지고 있는지 확인하는 과정
    String userEmail = "";
    boolean hasCookie = false;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user_email")) {
                userEmail = cookie.getValue();
                hasCookie = true;
            }
        }
    }
%>
  
<body class="screens-user-login">

<div class="screens-user-login__container">

        <div class="screens-user-login__login-wrapper">
            <form action="/user/login" method="post">
                <img src="/resources/img/logo/logo.png" class="screens-user-login__logo-universe">

                <!-- 메인 로그인 -->
                <div class="screens-user-login__main-login">
                    <input type="text" placeholder="이메일 주소"
                           class="screens-user-login__main-login__input-email"
                           name="user_email" value="<%=userEmail%>">
                    <i class="bx bxs-envelope main-login__icon"></i>
                </div>
                <c:if test="${error.containsKey('user_email')}">
                    <p class="field-error">${error['user_email']}</p>
                </c:if>

                <div class="screens-user-login__main-login">
                    <input type="password" placeholder="비밀번호"
                           class="screens-user-login__main-login__input-email__input-pwd"
                           name="user_pwd">
                    <i class="bx bxs-lock-alt main-login__icon"></i>
                </div>
                <c:if test="${error.containsKey('user_pwd')}">
                    <p class="field-error">${error['user_pwd']}</p>
                </c:if>
                <c:if test="${error.containsKey('id null or pwd invalid')}">
                    <p class="field-error">${error['id null or pwd invalid']}</p>
                </c:if>

                <button type="submit" class="screens-user-login__btn screens-user-login__main-login__btn">로그인</button>

                <%-- 쿠키 시작점 - checked: 쿠키 생성 요청, "": noCookie --%>
                <label class="screens-user-login__label"><input type="checkbox" class="screens-user-login__login-wrapper__checkbox" name="remember_id"
                              autocomplete="off" <%= hasCookie ? "checked" : "" %>>아이디 저장</label>

                <!-- 이동 링크 -->
                <div class="screens-user-login__linkContainer">
                    <div class="screens-user-login__linkContainer__inner">
                        <a href="#">비밀번호 재설정</a>
                    </div>
                    <div class="screens-user-login__linkContainer__inner">
                        <a href="#">회원가입</a>
                    </div>
                </div>

                <p class="screens-user-login__contour"><span>또는</span></p>

                <!-- 소셜 로그인 -->
                <div class="screens-user-login__sns-login">
                    <button type="button" class="screens-user-login__btn screens-user-login__sns-login__kakao" onclick="loginKakao()">
                        <div>카카오톡으로 로그인</div>
                        <img class="screens-user-login__sns-login__icon-kakao"
                             src="/resources/img/logo/btn-logo-kakao.png">
                    </button>

                    <button type="button" class="screens-user-login__btn screens-user-login__sns-login__goolgle " onclick="loginGoogle()">
                        <img class="screens-user-login__sns-login__icon-google"
                             src="/resources/img/logo/btn-logo-google.png">
                        <div>Google로 로그인</div>
                    </button>
                </div>

            </form>

    </div>  

</div>

<script>
  function loginGoogle() {
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/oauth2/google');
    document.body.appendChild(f);
    f.submit();
  }
    // 하나로
  function loginKakao() {
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/oauth2/kakao');
    document.body.appendChild(f);
    f.submit();
  }
</script>
  
</body>
</html>