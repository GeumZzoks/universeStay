<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-25
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%
    String isHost = (String) request.getAttribute("isHost");
    String sessionProfileImgUrl = (String) session.getAttribute("profileImgUrl");
%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="module"
            src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <title>숙소 - universeStay</title>
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
    <!--메뉴 영역-->
    <div class="components-user-header__header__searchbar">
        <div class="components-user-header__header__searchbar__inner">
            <div class="screens-room-management__menuButton-box">
                <button class="screens-room-management__menuButton-box__btn-room room-management-header-btn room-management-header-btn-active"
                        onclick="location.href='/room/management'">
                    <h2>숙소</h2>
                </button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button class="screens-room-management__menuButton-box__btn-booking room-management-header-btn"
                        onclick="location.href='/user/myPage/hostbookingmanagement'">
                    <h2>예약</h2>
                </button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button class="screens-room-management__menuButton-box__btn-calender room-management-header-btn"
                        onclick="location.href='#'">
                    <h2>달력</h2>
                </button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button class="screens-room-management__menuButton-box__btn-chatting room-management-header-btn"
                        onclick="location.href='/chatting/chattingRoomList'">
                    <h2>메세지</h2>
                </button>
            </div>
            <div class="screens-room-management__menuButton-box">
                <button class="screens-room-management__menuButton-box__btn-menu room-management-header-btn"
                        onclick="location.href='#'">
                    <h2>메뉴</h2>
                </button>
            </div>
        </div>
    </div>
    <!--헤더 프로필 영역-->
    <div class="components-user-header__header__profile">
        <div class="components-user-header__header__profile__to-host">

            <% if ("Y".equals(isHost)) { %>
            <a class="components-user-header__a" href="/">
                <div>게스트 모드로 전환</div>
            </a>
            <% } %>

        </div>

        <div class="components-user-header__header__profile__my-profile components-user-header__dropdown">
            <button class="components-user-header__header__profile__my-profile__btn components-user-header__button">
                <div components-user-header__header__profile__my-profile__wrapper>
                    <img class="components-user-header__header__profile__hamburger"
                         src="/resources/img/user/bars-3.png"/>
                    <% //세션에 'user_email'이라는 값이 저장되어 있으면? (즉, 로그인 상태면) 아래 드롭다운을 보여준다.
                        if
                        (session.getAttribute("user_email") != null) {
                    %>
                    <img class="components-user-header__header__profile__img"
                         src="${profileImgUrl}"/>
                    <%
                    } else {
                    %>
                    <img class="components-user-header__header__profile__img"
                         src="/resources/img/user/default_profile_icon.png"/>
                    <%}%>
                </div>

                <%-- 마이프로필 버튼 눌렀을때 나오는 드롭다운--%>
                <div class="components-user-header__header__profile__option components-user-header__dropdown-div">

                    <% //세션에 'user_email'이라는 값이 저장되어 있으면? (즉, 로그인 상태면) 아래 드롭다운을 보여준다.
                        if
                        (session.getAttribute("user_email") != null) {
                    %>
                    <div class="components-user-header__dropdown__option dropdown__option-msg">
                        <span>메시지</span>
                    </div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reservation"
                         onclick="location.href = '/user/myPage/mybookings/'">
                        <span>여행</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-wishlist"
                         onclick="location.href ='/user/wishLists'">
                        <span>위시리스트</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-reviews">
                        <span>나의 리뷰</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-coupon">
                        <span>나의 쿠폰</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice">
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
                    <%
                    } else  //세션에 'user_email'이라는 값이 저장되어 있지 않으면(즉, 로그아웃 상태면) 아래 드롭다운을 보여준다.
                    {
                    %>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-up">
                        <span>회원가입</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-sign-in">
                        <span>로그인</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-notice">
                        <span>공지사항</span></div>
                    <div class="components-user-header__dropdown__option components-user-header__dropdown__option-event"
                         onclick="location.href ='/event'">
                        <span>이벤트</span></div>
                    <%}%>
                </div>
            </button>
        </div>
    </div>
</header>
<div class="components-user-header__line"></div>

<script>
    let dropdowns = document.querySelectorAll(
        '.components-user-header__dropdown-div');

    document.addEventListener("click", function (e) {
        if (e.target.classList.contains(
                "components-user-header__header__searchbar__main_txt") ||
            e.target.classList.contains(
                "components-user-header__header__searchbar__sub_txt") ||
            e.target.classList.contains(
                "components-user-header__header__profile__my-profile") ||
            e.target.classList.contains(
                "components-user-header__header__profile__my-profile__btn")
            ||
            e.target.classList.contains(
                "components-user-header__header__profile__hamburger") ||
            e.target.classList.contains(
                "components-user-header__header__profile__img") ||
            e.target.classList.contains(
                "components-user-header__header__searchbar__checkin-btn")
        ) {
            console.log(1);
            return;
        }

        dropdowns.forEach(dropdown => {
            if (dropdown.classList.contains("show")) {
                dropdown.classList.remove("show");
            }
        });
    });

    dropdowns.forEach(dropdown => {
        dropdown.addEventListener('click', function (event) {
            event.stopPropagation(); // 드롭다운 요소가 클릭되었을 때 이벤트 전파 중단
        });
    });

    //-----------------------------------------------------------------

    //코드에 중복이 많아서 해결하고 싶음.
    const dropdownDiv = document.getElementsByClassName(
        "components-user-header__dropdown-div");

    const toggleDropdown4 = function () {
        dropdownDiv[0].classList.toggle('show')
    }

    //마이프로필 버튼 이벤트 추가
    const headerMyProfileBtn = document.querySelector(
        ".components-user-header__header__profile__my-profile__btn");

    headerMyProfileBtn.addEventListener("click", toggleDropdown4);
</script>
<%--위 까지 common 헤더--%>
<%--<script src="/resources/js/room/roomManagement.js"></script>--%>
</body>
</html>