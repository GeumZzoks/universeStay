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
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/img/favi.ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/img/favi.ico//apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/img/favi.ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/favi.ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="/resources/img/favi.ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="/resources/img/favi.ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"
          href="/resources/img/favi.ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="/resources/img/favi.ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"
          href="/resources/img/favi.ico/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"
          href="/resources/img/favi.ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"
          href="/resources/img/favi.ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"
          href="/resources/img/favi.ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"
          href="/resources/img/favi.ico/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
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
