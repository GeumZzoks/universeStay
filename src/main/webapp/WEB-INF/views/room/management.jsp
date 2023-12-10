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
    <title>Title</title>
</head>
<body>
<%-- 1차 코드 --%>
<%--<div class="screens-room-management__container">--%>
<%--    <div class="screens-room-management__content">--%>
<%--        <div class="screens-room-management__top">--%>
<%--            <div class="screens-room-management__top__title"><h2>숙소</h2></div>--%>
<%--            <div class="screens-room-management__top__icn">--%>
<%--                <img class="screens-room-management__top__button-icn"--%>
<%--                     src="/resources/img/room/top-icn1.png">--%>
<%--                &lt;%&ndash;                <img src="/resources/img/room/top-icn2.png">&ndash;%&gt;--%>
<%--                <img class="screens-room-management__top__button-icn"--%>
<%--                     src="/resources/img/room/top-icn3.png">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="screens-room-management__cards">--%>
<%--            <div class="screens-room-management__card">--%>
<%--                <div class="screens-room-management__card__img"><img--%>
<%--                        src="/resources/img/room/room1.png"></div>--%>
<%--                <div class="screens-room-management__card__date">--%>
<%--                    <p>아파트 숙소 등록일: ${roomDto.room_address}</p>--%>
<%--                </div>--%>
<%--                <div class="screens-room-management__card__location"><p>${roomDto.room_name}</p>--%>
<%--                </div>--%>
<%--                <div class="screens-room-management__card_status">--%>
<%--                    <img class="screens-room-management__card_status__img"--%>
<%--                         src="/resources/img/room/icons8-circle-16-red.png">--%>
<%--                    <span>일시 중지됨</span>--%>
<%--                </div>--%>
<%--            </div>--%>

<%-- 2차 코드 --%>

<%--screens-room-management__--%>
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

            <c:forEach var="RoomDto" items="${roomDtoList}">
                <div class="screens-room-management__card">
                    <input type="hidden" value="${RoomDto.room_id}"
                           class="screens-room-management__card-room-id">
                    <div class="screens-room-management__card__img">
                        <img src="${RoomDto.room_main_photo}">
                    </div>
                    <div class="screens-room-management__card__date">
                        <p>아파트 숙소 등록일: ${RoomDto.created_at}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${RoomDto.room_name}</p>
                    </div>
                    <div class="screens-room-management__card__info">
                        <p>${RoomDto.room_address}</p>
                    </div>
                    <div class="screens-room-management__card_status">
                        <img class="screens-room-management__card_status__img"
                             src="/resources/img/room/icons8-circle-16-red.png">
                        <span>
                                ${(RoomDto.room_status_id) == 'R01' ? '활성화' : '비활성화'}
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <%--모달창--%>
    <div class="screens-room-management__modalWrap">
        <div class="screens-room-management__modalContent">
            <div class="screens-room-management__modalBody">
                추후 모달창 꾸미기<br>
                활성화/비활성화 하나로 만들기 <br>
                <input type="hidden" value=""
                       class="screens-room-management__modal-room-id"/>
                <span class="screens-room-management__closeBtn">&times;</span>
                <button class="screens-room-management__modifyHostroom">숙소 수정</button>
                <button class="screens-room-management__activateHostroom">숙소 활성화</button>
                <button class="screens-room-management__deActivateHostroom">숙소 비활성화</button>
                <button class="screens-room-management__shutdownHostroom">숙소 폐점</button>
            </div>
        </div>
    </div>

    <script src="/resources/js/room/roomManagement.js"></script>

</body>
</html>
