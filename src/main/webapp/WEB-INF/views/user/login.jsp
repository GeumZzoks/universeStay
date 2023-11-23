<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/common/global.css">
    <link rel="stylesheet" href="resources/css/user/login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>

<div class="login-wrapper">

    <form action="">

        <img src="/resources/img/logo/logo.png" ; class="logo-universe">

        <!-- 메인 로그인 -->
        <div class="main-login">
            <input type="text" placeholder="이메일 주소" class="main-login__input-email" required>
            <i class="bx bxs-envelope main-login__icon"></i>
        </div>
        <div class="main-login">
            <input type="password" placeholder="비밀번호" class="main-login__input-pwd" required>
            <i class="bx bxs-lock-alt main-login__icon"></i>
        </div>

        <button type="submit" class="btn main-login__btn">로그인</button>

        <label>
            <input type="checkbox" class="main-login__checkbox" name="remember-id" value="id">
            아이디 저장
        </label>

        <!-- 이동 링크 -->
        <div class="link">
            <div>
                <a href="#">비밀번호 재설정</a>
            </div>
            <div>
                <a href="#">회원가입</a>
            </div>
        </div>

        <p class="contour"><span>또는</span></p>

        <!-- 소셜 로그인 -->
        <div class="sns-login">
            <button type="submit" class="btn sns-login__kakao">
                <div>카카오톡으로 로그인</div>
                <img class="sns-login__icon-kakao" src="/resources/img/logo/btn-logo-kakao.png">
            </button>

            <button type="submit" class="btn sns-login__goolgle ">
                <img class="sns-login__icon-google" src="/resources/img/logo/btn-logo-google.png">
                <div>Google로 로그인</div>
            </button>

        </div>

    </form>
</div>

</body>
</html>