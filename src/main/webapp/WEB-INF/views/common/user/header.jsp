<%@ page import="javax.servlet.http.Cookie" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String isHost = (String) request.getAttribute("isHost");
    String sessionProfileImgUrl = (String) session.getAttribute("profileImgUrl");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <title>header</title>
</head>
<body>
<header class="components-user-header__header">
    <div class="components-user-header__header__inner">

        <!-- 헤더 로고 영역-->
        <div class="components-user-header__header__logo" onclick="location.href ='/'">
            <img class="components-user-header__logo"
                 src="/resources/img/logo/small_logo_no_bgd2.png"/>
        </div>
    </div>

    <!--헤더 검색바 영역-->
    <div class="components-user-header__header__searchbar">
        <div class="components-user-header__header__searchbar__inner">

            <%--'어디로'버튼--%>
            <button class="components-user-header__dropdown components-user-header__header__searchbar__where-btn components-user-header__button">
                <span class="components-user-header__header__searchbar__main_txt">어디로</span>
                <div class="components-user-header__header__searchbar__sub_txt components-user-header__where__default">
                    ${param.address != null ?param.address:'국내 전체'}
                </div>
                <%--'어디로'버튼 드롭다운--%>
                <div class="components-user-header__dropdown-div components-user-header__header__searchbar__where">
                    <input class="components-user-header__dropdown__input"
                           placeholder="가고싶은 지역을 입력하세요."/>
                    <div class="components-user-header__dropdown__place-option"><span>국내 전체</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>서울</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>강원</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>부산</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>경기</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>충청</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>경상</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>전라</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>인천</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>광주</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>대전</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>대구</span>
                    </div>
                    <div class="components-user-header__dropdown__place-option"><span>울산</span>
                    </div>
                </div>
            </button>

            <span class="components-user-header__header__searchbar__divide-line"></span>

            <%--체크인/체크아웃 버튼 --%>
            <div>
                <button class="components-user-header__dropdown components-user-header__header__searchbar__checkin-btn components-user-header__button">
                    <span class="components-user-header__header__searchbar__main_txt">체크인 · 체크아웃</span><br>
                    <%--달력--%>
                    <input class="components-user-header__calender" type="text" name="datefilter"
                           data-date-format='yyyy/mm/dd'
                           value=""/>
                </button>

            </div>

            <span class="components-user-header__header__searchbar__divide-line"></span>

            <%--여행자 증감 버튼--%>
            <div>
                <button class="components-user-header__dropdown components-user-header__header__searchbar__people-btn components-user-header__button">
                    <span class="components-user-header__header__searchbar__main_txt">여행자</span>
                    <div class="components-user-header__header__searchbar__sub_txt components-user-header__people_default">
                        ${param.search_capa != null ? param.search_capa : 2}

                    </div>
                    <div class="components-user-header__dropdown-div components-user-header__header__searchbar__people">

                        <%--마이너스 버튼--%>
                        <ion-icon class="components-user-header__header__searchbar__people_count"
                                  size="large" name="remove-circle-outline"></ion-icon>
                        <div class="components-user-header__header__searchbar__people_count components-user-header__people-count">
                            2
                        </div>
                        <%--플러스 버튼--%>
                        <ion-icon class="components-user-header__header__searchbar__people_count"
                                  size="large" name="add-circle-outline"></ion-icon>
                    </div>
                </button>
            </div>

            <span class="components-user-header__header__searchbar__divide-line"></span>

            <%--예산 버튼 (수정 필요)--%>
            <div>
                <button class="components-user-header__dropdown components-user-header__header__searchbar__money-btn components-user-header__button">
                    <span class="components-user-header__header__searchbar__main_txt">총 예산</span>
                    <div class="components-user-header__header__searchbar__sub_txt">
                     <span class="components-user-header__header__searchbar__sub_txt__min">
                     </span>원 부터
                        <span class="components-user-header__header__searchbar__sub_txt__max">
                        </span>원 까지
                    </div>


                    <%--예산 버튼 눌렀을때 드롭다운 (수정 필요)--%>
                    <div class="components-user-header__dropdown-div components-user-header__header__searchbar__money">
                        <div class="components-user-header__input-box">
                            <div class="components-user-header__min-box">
                                <div class="components-user-header__input-wrap">
                                    <input type="text" name="min_input"
                                           class="components-user-header__input-field components-user-header__min-input"
                                           placeholder="~원 부터"
                                           value="${param.search_min_price != null ? param.search_min_price : '0'}"
                                    >
                                    <span>최소 금액</span>
                                </div>
                            </div>
                            <div class="components-user-header__max-box">
                                <div class="components-user-header__input-wrap">
                                    <input type="text" name="max_input"
                                           class="components-user-header__input-field components-user-header__max-input"
                                           placeholder="~원 까지"
                                           value="${param.search_max_price != null ? param.search_max_price : '200000'}">
                                    <span>최대 금액</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
            </div>

            <%--검색(돋보기)버튼--%>
            <button class=" components-user-header__header__searchbar__search-btn
                                           components-user-header__button">
                <img src="/resources/img/user/search-icon-white.png">
            </button>

        </div>
    </div>

    <!--헤더 프로필 영역-->
    <div class="components-user-header__header__profile">
        <div class="components-user-header__header__profile__to-host">
            <% if ("Y".equals(isHost)
            ) { %>
            <div><a class="components-user-header__a" href="/room/management">호스트 모드로 전환</a></div>
            <% } else if ("N".equals(isHost) || isHost == null) { %>
            <div>당신의 공간을 공유하세요.</div>
            <% } %>

        </div>

        <div class="components-user-header__header__profile__my-profile components-user-header__dropdown">
            <button class="components-user-header__header__profile__my-profile__btn components-user-header__button">
                <div class="components-user-header__header__profile__my-profile__wrapper">
                    <img class="components-user-header__header__profile__hamburger"
                         src="/resources/img/user/bars-3.png"/>
                    <img class="components-user-header__header__profile__img"
                         src="<%= sessionProfileImgUrl != null ? sessionProfileImgUrl : "/resources/img/user/default_profile_icon.png" %>"/>
                </div>

                <%-- 마이프로필 버튼 눌렀을때 나오는 드롭다운--%>
                <div class="components-user-header__header__profile__option components-user-header__dropdown-div">
                    <%if (session.getAttribute("user_email") != null) {%>
                    <div onclick="location.href='/chatting/chattingRoomList'"
                         class="components-user-header__dropdown__option dropdown__option-msg">
                        <span>메시지</span>
                    </div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reservation"
                         onclick="location.href = '/user/myPage/mybookings/'">
                        <span>여행</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-wishlist"
                         onclick="location.href ='/user/myPage/wishLists'">
                        <span>위시리스트</span></div>
                    <%--                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reviews">--%>
                    <%--                        <span>나의 리뷰</span></div>--%>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-coupon"
                         onclick="location.href='/user/myPage/coupon'">
                        <span>나의 쿠폰</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice"
                         onclick="location.href ='/notice'">
                        <span>공지사항</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-event"
                         onclick="location.href ='/event'">
                        <span>이벤트</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-account"
                         onclick="location.href ='/user/myPage/info'">
                        <span>계정</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-log-out"
                         onclick="location.href ='/user/userLogout'">
                        <span>로그아웃</span></div>
                    <%} else {%>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-up">
                        <span>회원가입</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-in">
                        <span>로그인</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice"
                         onclick="location.href='/notice'">
                        <span>공지사항</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-event"
                         onclick="location.href ='/event'">
                        <span>이벤트</span></div>
                    <%}%>

                </div>
            </button>
        </div>

    </div>

    </div>

</header>
<div class="components-user-header__line"></div>


<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="/resources/js/user/common/header.js"></script>
<script>
    //---------------------- 캘린더 라이브러리 --------------------------------------------
    $(function () {
        let today = new Date();
        // 내일 날짜 구하기 (오늘 날짜에 1을 더함)
        let tomorrow = new Date(today);
        tomorrow.setDate(tomorrow.getDate() + 1);

        const search_start_date = '${param.search_start_date}';
        const search_end_date = '${param.search_end_date}';

        $('input[name="datefilter"]').daterangepicker({
            // autoUpdateInput: true,
            locale: {
                format: 'YYYY/MM/DD',
                cancelLabel: '취소',
                applyLabel: '확인'
            },
            startDate: search_start_date !== "" ? search_start_date : today,
            endDate: search_end_date !== "" ? search_end_date : tomorrow,
        });

        $('input[name="datefilter"]').on('apply.daterangepicker',
                function (ev, picker) {
                    $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - '
                            + picker.endDate.format(
                                    'YYYY/MM/DD'));
                });
    });
</script>


</body>
</html>