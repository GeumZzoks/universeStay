<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/header_price-slider.css">

    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
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

            <button class="dropdown header__searchbar__where-btn">
                <span class="header__searchbar__main_txt">어디로</span>
                <div class="header__searchbar__sub_txt where__default">국내 전체</div>
                <div class="dropdown-div header__searchbar__where">
                    <input class="dropdown__input" placeholder="가고싶은 지역을 입력하세요."/>
                    <div class="dropdown__place-option"><span>국내 전체</span></div>
                    <div class="dropdown__place-option"><span>서울</span></div>
                    <div class="dropdown__place-option"><span>강원</span></div>
                    <div class="dropdown__place-option"><span>부산</span></div>
                    <div class="dropdown__place-option"><span>경기</span></div>
                    <div class="dropdown__place-option"><span>충청</span></div>
                    <div class="dropdown__place-option"><span>경상</span></div>
                    <div class="dropdown__place-option"><span>전라</span></div>
                    <div class="dropdown__place-option"><span>인천</span></div>
                    <div class="dropdown__place-option"><span>광주</span></div>
                    <div class="dropdown__place-option"><span>대전</span></div>
                    <div class="dropdown__place-option"><span>대구</span></div>
                    <div class="dropdown__place-option"><span>울산</span></div>
                </div>
            </button>

            <span class="header__searchbar__divide-line"></span>
            <div>
                <button class="dropdown header__searchbar__checkin-btn">
                    <span class="header__searchbar__main_txt">체크인 · 체크아웃</span><br>
                    <input class="calender" type="text" name="datefilter" value=""/>
                </button>

            </div>

            <span class="header__searchbar__divide-line"></span>
            <div>
                <button class="dropdown header__searchbar__people-btn">
                    <span class="header__searchbar__main_txt">여행자</span>
                    <div class="header__searchbar__sub_txt people_default">2</div>
                    <div class="dropdown-div header__searchbar__people">
                        <ion-icon class="header__searchbar__people_count"
                                  size="large" name="remove-circle-outline"></ion-icon>
                        <div class="header__searchbar__people_count people-count">2</div>
                        <ion-icon class="header__searchbar__people_count"
                                  size="large" name="add-circle-outline"></ion-icon>
                    </div>
                </button>
            </div>
            <span class="header__searchbar__divide-line"></span>
            <div>
                <button class="dropdown header__searchbar__money-btn">
                    <span class="header__searchbar__main_txt">1박당 예산</span>
                    <div class="header__searchbar__sub_txt"><span
                            class="header__searchbar__sub_txt__min">5</span>만원 부터 <span
                            class="header__searchbar__sub_txt__max">20</span>만원 까지
                    </div>

                    <div class="dropdown-div header__searchbar__money">
                        <div class="range-slider">
                            <span class="slider-track"></span>
                            <input type="range" name="min_val" class="min-val" min="10000"
                                   max="1000000" value="50000" oninput="slideMin()">
                            <input type="range" name="max_val" class="max-val" min="10000"
                                   max="1000000" value="200000" oninput="slideMax()">
                            <div class="tooltip min-tooltip"></div>
                            <div class="tooltip max-tooltip"></div>
                        </div>
                        <div class="input-box">
                            <div class="min-box">
                                <div class="input-wrap">
                                    <input type="text" name="min_input"
                                           class="input-field min-input" onchange="setMinInput()">
                                    <span class="input-addon">원</span>

                                </div>
                            </div>
                            <div class="max-box">
                                <div class="input-wrap">
                                    <input type="text" name="max_input"
                                           class="input-field max-input" onchange="setMaxInput()">
                                    <span class="input-addon">원</span>

                                </div>
                            </div>
                        </div>


                    </div>
                </button>

            </div>
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
        <div class="header__profile__my-profile dropdown">
            <button class="header__profile__my-profile__btn">
                <div header__profile__my-profile__wrapper>
                    <img src="/resources/img/icon/bars-3.png"/>
                    <img class="header__profile__img"
                         src="/resources/img/icon/default_profile_icon.png"/>
                </div>
                <div class="header__profile__option dropdown-div">
                    <div class="dropdown__option dropdown__option-msg"><span>메시지</span>
                    </div>
                    <div class="dropdown__option dropdown__option-reservation" onclick="">
                        <span>여행</span></div>
                    <div class="dropdown__option dropdown__option-wishlist" onclick="">
                        <span>위시리스트</span></div>
                    <div class="dropdown__option dropdown__option-reviews" onclick="">
                        <span>나의 리뷰</span></div>
                    <div class="dropdown__option dropdown__option-account" onclick="">
                        <span>계정</span></div>
                    <div class="dropdown__option dropdown__option-log-out" onclick="">
                        <span>로그아웃</span></div>
                </div>
            </button>
        </div>

    </div>

    </div>

</header>
<div class="line"></div>


<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="/resources/js/common/header.js"></script>
<script src="/resources/js/common/header_slider.js"></script>

</body>
</html>