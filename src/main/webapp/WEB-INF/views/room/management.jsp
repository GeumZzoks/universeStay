<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: ming7
  Date: 2023-12-05
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%
    String isHost = (String) request.getAttribute("isHost");
%>
<html>
<head>
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
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>숙소 - universeStay</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/user/hostHeader.jsp"/>
<div class="screens-room-management__container">
    <div class="screens-room-management__content">
        <div class="screens-room-management__top">
            <div class="screens-room-management__top__title"><h2>숙소</h2></div>
            <div class="screens-room-management__top__icn">

                <img class="screens-room-management__top__button-icn"
                     src="/resources/img/room/top-icn1.png">
                <%--                <img src="/resources/img/room/top-icn2.png">--%>

                <button class="screens-room-management__top__button" type="button"
                        title="숙소 등록하러 가기"
                        onclick="location.href='/room/enroll'">
                    <img class="screens-room-management__top__button-icn"
                         src="/resources/img/room/top-icn3.png">
                </button>
            </div>
        </div>


        <div class="screens-room-management__cards">

            <c:forEach var="roomManagementDto" items="${roomManagementDtoList}">
                <div class="screens-room-management__card">
                    <input type="hidden" value="${roomManagementDto.room_id}"
                           class="screens-room-management__card-room-id">
                    <input type="hidden" value="${roomManagementDto.room_main_photo}"
                           class="screens-room-management__card-room-main-photo">
                    <input type="hidden" value="${roomManagementDto.room_status_id}"
                           class="screens-room-management__card-room-status-id">
                    <input type="hidden" value="${roomManagementDto.room_name}"
                           class="screens-room-management__card-room-name">
                    <input type="hidden" value="${roomManagementDto.created_at}"
                           class="screens-room-management__card-room-createdAt">
                    <input type="hidden" value="${roomManagementDto.room_address}"
                           class="screens-room-management__card-room-address">

                    <div class="screens-room-management__card__img">
                        <img src="${roomManagementDto.room_main_photo}">
                    </div>
                    <div class="screens-room-management__card__date">
                        <p>아파트 숙소 등록일: ${roomManagementDto.created_at}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${roomManagementDto.room_name}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${roomManagementDto.room_address}</p>
                    </div>
                    <div class="screens-room-management__card_status">
                        <img class="screens-room-management__card_status__img"
                             src="${(roomManagementDto.room_status_id) == 'R01' ? '/resources/img/room/icons8-circle-16-green.png' : '/resources/img/room/icons8-circle-16-red.png'}">
                        <span>
                                ${(roomManagementDto.room_status_id) == 'R01' ? '운영 중' : '미 운영'}
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%--모달창--%>
    <div class="screens-room-management__modalWrap">
        <div class="screens-room-management__modalBody">
            <div class="screens-room-management__closeBtn-box">
                <span class="screens-room-management__closeBtn">x</span>
            </div>
            <div class="screens-room-management__img-box">
                <img class="screens-room-management__modal-photo" src="">
            </div>
            <div class="screens-room-management__modalText-box">
                <span class="screens-room-management__modalText-box__text"></span>
                <span class="screens-room-management__createdAt"></span>
                <span class="screens-room-management__address"></span>
            </div>
            <div class="screens-room-management__btnStatus-box">
                <button class="screens-room-management__activateHostroom">숙소 활성화</button>
                <button class="screens-room-management__deactivateHostroom">숙소 비활성화</button>
                <button class="screens-room-management__shutdownHostroom">숙소 폐점</button>
            </div>
            <div class="screens-room-management__modifyHostRoom-box">
                <%--                <a class="screens-room-management__modifyHostRoom-box__alink"--%>
                <%--                   href="/room/modify?room_id=" +${roomDto.room_id}>숙소 수정하기--%>
                <%--                </a>--%>
                <a class="screens-room-management__modifyHostRoom-box__alink">숙소 수정하기
                </a>
            </div>
        </div>
    </div>


    <script type="module"
            src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
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
    <script src="/resources/js/room/roomManagement.js"></script>
</body>
</html>