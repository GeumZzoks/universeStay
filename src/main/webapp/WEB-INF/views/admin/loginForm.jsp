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
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/admin/loginForm.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>로그인</title>

</head>
<body>

<img class="left-side" src="/resources/img/logo/big_logo_no_bgd.png"/>

<span class="middle-side"></span>

<div class="right-side">
    <header class="right-side__welcome-header">
        <i class="fa-solid fa-house-lock fa-2x"></i>
        <h1 class="right-side__welcome-header__title">Welcome</h1>
        <p class="right-side__welcome-header__text">
            PLEASE LOGIN TO ADMIN DASHBOARD.
        </p>
    </header>

    <form
            class="right-side__login-form"
            action="/admin/loginForm"
            method="post"
    >
        <input type="text" name="username" placeholder="username" required/>
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
</body>
</html>
