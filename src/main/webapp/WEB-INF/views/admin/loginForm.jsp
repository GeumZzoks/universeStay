<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 11/27/23
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>로그인</title>

</head>
<body>
<div class="screens-admin-loginForm__container">
    <img class="screens-admin-loginForm__left-side" src="/resources/img/logo/big_logo_no_bgd.png"/>

    <span class="screens-admin-loginForm__middle-side"></span>

    <div class="screens-admin-loginForm__right-side">
        <header class="screens-admin-loginForm__right-side__welcome-header">
            <i class="fa-solid fa-house-lock fa-2x"></i>
            <h1 class="screens-admin-loginForm__right-side__welcome-header__title">Welcome</h1>
            <p class="screens-admin-loginForm__right-side__welcome-header__text">
                PLEASE LOGIN TO ADMIN DASHBOARD.
            </p>
        </header>

        <form
                class="screens-admin-loginForm__right-side__login-form"
                action="/adminLogin/loginForm"
                method="post"
        >
            <input type="text" name="userEmail" placeholder="email" required/>
            <input
                    type="password"
                    name="password"
                    placeholder="password"
                    required
            />
            <input type="submit" value="LOGIN"/>
        </form>
        <a href="#">관리자에게 문의하기</a>
    </div>

    <script
            src="https://kit.fontawesome.com/d1e61c2fb7.js"
            crossorigin="anonymous"
    ></script>
</div>
</body>
</html>
