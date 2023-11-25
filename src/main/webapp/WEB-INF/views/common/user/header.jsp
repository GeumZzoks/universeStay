<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <title>header</title>
</head>
<body>
<header class="header">
    <div class="header__inner">

        <!-- 헤더 로고 영역-->
        <div class="header__logo">
            <a href="#" class="logo__link">
                <img class="logo" src="/resources/img/logo/small_logo_no_bgd2.png"/>
            </a>
        </div>
    </div>

    <!--헤더 검색바 영역-->
    <div class="header__searchbar">
        <div class="header__searchbar__inner">
            <button>어디로</button>
            <span class="header__searchbar__divide-line"></span>
            <button>언제</button>
            <span class="header__searchbar__divide-line"></span>
            <button>몇명이서</button>
            <span class="header__searchbar__divide-line"></span>
            <button>예산은</button>
            <button class="header__searchbar__search-btn">
                <img src="/resources/img/icon/search-icon-white.png">
            </button>
        </div>
    </div>

    <!--헤더 프로필 영역-->
    <div class="header__profile">
        <div class="header__profile__to-host">
            <a href="#">
                <div>호스트 모드로 전환</div>
            </a>
        </div>
        <div class="header__profile__my-profile">
            <button class="header__profile__my-profile__btn">
                <img src="/resources/img/icon/bars-3.png"/>
                <img class="header__profile__img"
                     src="/resources/img/icon/default_profile_icon.png"/>
            </button>
        </div>

    </div>

    </div>

</header>
<div class="line"></div>

</body>
</html>