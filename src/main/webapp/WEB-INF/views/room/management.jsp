<%--
  Created by IntelliJ IDEA.
  User: ming7
  Date: 2023-12-05
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <link href="/resources/css2/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>숙소 - universeStay</title>
</head>
<body>
<div class="screens-room-management__container">
    <div class="screens-room-management__content">
        <div class="screens-room-management__top">
            <div class="screens-room-management__top__title"><h2>숙소</h2></div>
            <div class="screens-room-management__top__icn">
                <img class="screens-room-management__top__button-icn"
                     src="/resources/img/room/top-icn1.png">
                <%--                <img src="/resources/img/room/top-icn2.png">--%>
                <img class="screens-room-management__top__button-icn"
                     src="/resources/img/room/top-icn3.png">
            </div>
        </div>


        <div class="screens-room-management__cards">

            <c:forEach var="roomDto" items="${roomDtoList}">
                <div class="screens-room-management__card">
                    <input type="hidden" value="${roomDto.room_id}"
                           class="screens-room-management__card-room-id">
                    <input type="hidden" value="${roomDto.room_main_photo}"
                           class="screens-room-management__card-room-main-photo">
                    <input type="hidden" value="${roomDto.room_status_id}"
                           class="screens-room-management__card-room-status-id">
                    <input type="hidden" value="${roomDto.room_name}"
                           class="screens-room-management__card-room-name">
                    <input type="hidden" value="${roomDto.created_at}"
                           class="screens-room-management__card-room-createdAt">
                    <input type="hidden" value="${roomDto.room_address}"
                           class="screens-room-management__card-room-address">

                    <div class="screens-room-management__card__img">
                        <img src="${roomDto.room_main_photo}">
                    </div>
                    <div class="screens-room-management__card__date">
                        <p>아파트 숙소 등록일: ${roomDto.created_at}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${roomDto.room_name}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${roomDto.room_address}</p>
                    </div>
                    <div class="screens-room-management__card_status">
                        <img class="screens-room-management__card_status__img"
                             src="${(roomDto.room_status_id) == 'R01' ? '/resources/img/room/icons8-circle-16-green.png' : '/resources/img/room/icons8-circle-16-red.png'}">
                        <span>
                                ${(roomDto.room_status_id) == 'R01' ? '운영 중' : '미 운영'}
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
                <a href="/room/modify">숙소 수정하기</a>
            </div>
        </div>
    </div>

    <script src="/resources/js/room/roomManagement.js"></script>

</body>
</html>
