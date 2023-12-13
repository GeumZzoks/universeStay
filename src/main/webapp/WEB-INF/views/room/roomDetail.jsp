<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<html>
<head>
    <title>roomDetail</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <style>
        .screens-room-roomDetail__section-1__btns {
            vertical-align: bottom;
        }

        .screens-room-roomDetail__btn-share__text {
            margin: 2px 0 0 2px;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="screens-room-roomDetail__wrapper">
    <%--  section-1  --%>
    <div class="screens-room-roomDetail__section-1">
        <h1 class="screens-room-roomDetail__section-1__room-name">${room.room_name}</h1>
        <div class="screens-room-roomDetail__section-1__info-1">
            <div class="screens-room-roomDetail__section-1__region">${room.room_address}</div>
            <div class="screens-room-roomDetail__section-1__btns">
                <button onclick="kakaoShare()"
                        class="screens-room-roomDetail__btn screens-room-roomDetail__section-1__btn screens-room-roomDetail__section-1__btn-share screens-room-roomDetail__btn-shrink">
                    <span class="screens-room-roomDetail__btn-share__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                             aria-hidden="true" role="presentation" focusable="false" style="display: block;
                             fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;">
                            <g fill="none">
                                <path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0
                                0 1 1.4 0L26 13">
                                </path>
                            </g>
                        </svg>
                    </span>
                    <span class="screens-room-roomDetail__btn-share__text">
                        공유하기
                    </span>
                </button>
                <form>
                    <button id="wishlist" type="submit" value="${room.room_id}"
                            class="screens-room-roomDetail__btn screens-room-roomDetail__section-1__btn screens-room-roomDetail__section-1__btn-save screens-room-roomDetail__btn-shrink">
                    <span class="screens-room-roomDetail__btn-share__icon">
                        <c:choose>
                            <c:when test="${room.has_wished ne 0}">
                                <img id="wished"
                                     src="/resources/img/room/wished.png"
                                     style="width: 16px; height: 16px;"></span>
                        <span id="wished_text" class="screens-room-roomDetail__btn-share__text">
                                저장됨
                            </span>
                        </c:when>
                        <c:otherwise>
                            <img id="unwished"
                                 src="/resources/img/room/unwished.png" style="width: 16px; height: 16px;"></span>
                            <span id="unwished_text" class="screens-room-roomDetail__btn-share__text">
                                저장하기
                            </span>
                        </c:otherwise>
                        </c:choose>
                    </button>
                </form>
            </div>
        </div>
    </div>
    <%--  section-2  --%>
    <div class="screens-room-roomDetail__section-2">
        <c:forEach var="roomImg" items="${roomImgList}">
            <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
                <img class="screens-room-roomDetail__room-photo__img"
                     src="${roomImg.room_img_url}" alt="">
            </button>
        </c:forEach>
    </div>
    <%--  section-3  --%>
    <div class="screens-room-roomDetail__section-3">
        <div class="screens-room-roomDetail__section-3__room-info">
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-1">
                <div class="screens-room-roomDetail__section-3__info-1__desc">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-1__desc1">
                        ${host.user_name} 님이 호스팅하는
                        펜션
                    </div>
                    <div class="screens-room-roomDetail__section-3__info-1__desc2">
                        최대 인원 ${room.room_max_capa}명 · 침실 ${room.room_bedroom_cnt}개 ·
                        욕실 ${room.room_bathroom_cnt}개
                    </div>
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-1__profile">
                    <img class="screens-room-roomDetail__section-3__info-1__profile-img"
                         src="${profileImgUrl}" alt="">
                </button>
            </div>
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-2">
                <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-2__desc1">
                    숙소 편의시설
                </div>

                <%--  TODO : 숙소 편의시설 등록 완료하고 구현하기 - 10개 끊어서 보여주기  --%>

                <ul class="screens-room-roomDetail__section-3__info-2__desc2">
                    <c:forEach var="roomImg" items="${roomImgList}">
                        <li class="screens-room-roomDetail__section-3__li">
                            <div class="screens-room-roomDetail__section-3__li__text">마리나 전망</div>
                            <div class="screens-room-roomDetail__section-3__li__icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                     aria-hidden="true" role="presentation" focusable="false"
                                     style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                    <path d="M2.61 1h13.34c.28-.02.58.08.8.33l.08.12 12 18a1 1 0 0 1-.72 1.54L28 21H17v2h12v1c0 1.84-.62 3.53-1.66 4.88l.13.1c.36.3.83.48 1.34.51l.19.01v2c-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1.01.15-1.4.41l-.13.1c-.77.65-1.77.99-2.8.99-.96 0-1.88-.29-2.62-.83l-.2-.15c-.4-.33-.94-.52-1.52-.52-.52 0-1 .15-1.39.41l-.14.1c-.76.65-1.77.99-2.8.99-.95 0-1.87-.29-2.61-.83l-.2-.15c-.4-.33-.95-.52-1.53-.52-.51 0-1 .15-1.38.41l-.14.1c-.7.6-1.6.93-2.55.98L3 31.5v-2c.52 0 1-.15 1.39-.41l.27-.21a7.99 7.99 0 0 1-1.64-4.3L3 24.26 2.98 23H15V9H2.61l1.34-4zm24.3 24H5.09l.02.09c.2 1.13.73 2.16 1.48 2.97a4.48 4.48 0 0 1 3.56.92c.4.33.95.52 1.53.52a2.4 2.4 0 0 0 1.52-.52A4.38 4.38 0 0 1 16 28c.95 0 1.87.29 2.61.83l.2.15c.4.33.94.52 1.52.52.52 0 1.01-.15 1.4-.41l.13-.1a4.38 4.38 0 0 1 3.3-.96l.25.03.08-.08a5.97 5.97 0 0 0 1.35-2.6l.06-.28zM17 5.3V19h9.13zM5.39 3l.66 2-.66 2H15V3z"></path>
                                </svg>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink">
                    편의시설 40개 모두 보기
                </button>
            </div>
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-3">
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        숙소 설명
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        ${room.room_total_desc}
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        공간 설명
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        ${room.room_space_desc}
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        기타 알아두어야 할 사항
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        ${room.room_etc_desc}
                    </p>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__info-3__btn screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        게스트와의 교류
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        전화나 WhatsApp으로 사용할 수 있습니다. 농장 하우스는 돔 광경에서 약 400m 떨어져 있습니다.
                    </p>
                </div>
            </div>
        </div>
        <div class="screens-room-roomDetail__section-3__reservation">

            <%--  TODO : 주중 주말 가격과 숙박 일정설정에 따른 총합계 구현  --%>

            <div class="screens-room-roomDetail__reservation__part-1">
                <div class="screens-room-roomDetail__reservation__price">
                    <span class="screens-room-roomDetail__price__part-1">₩ ${room.room_weekday_price}</span>
                    <span class="screens-room-roomDetail__price__part-2">/박</span>
                </div>
                <div class="screens-room-roomDetail__reservation__info">
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__check-in-out">
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크인
                            </div>
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2">
                                2024.1.7.
                            </div>
                        </div>
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크아웃
                            </div>
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2">
                                2024.1.12.
                            </div>
                        </div>
                    </button>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__number-people">
                        <div class="screens-room-roomDetail__number-people__desc">
                            <div class="screens-room-roomDetail__number-people__desc1">인원</div>
                            <div class="screens-room-roomDetail__number-people__desc2">게스트 1명</div>
                        </div>
                        <div class="screens-room-roomDetail__number-people__arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;">
                                <path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path>
                            </svg>
                        </div>
                    </button>
                </div>
                <div>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__btn screens-room-roomDetail__btn-shrink">
                        예약하기
                    </button>
                </div>
            </div>
            <div class="screens-room-roomDetail__reservation__part-2">
                예약 확정 전에는 요금이 청구되지 않습니다.
            </div>
            <div class="screens-room-roomDetail__reservation__part-3">
                <span class="screens-room-roomDetail__reservation__part-3__mul">₩${room_weekday_price} X 7박</span>
                <span>₩1,167,740</span>
            </div>
        </div>
    </div>
    <%--  section-4  --%>
    <div class="screens-room-roomDetail__section-4 screens-room-roomDetail__padding-content">

        <%--  TODO : 리뷰 구현되면 완성  --%>

        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-4__part-1">
            ★️ ${room.room_stars_avg} 후기 · 191개
        </div>
        <div class="screens-room-roomDetail__section-4__part-2">

            <%--  TODO : 리뷰 6개만 끊어서 보여주기  --%>

            <c:forEach var="roomImg" items="${roomImgList}">
                <div class="screens-room-roomDetail__review">
                    <div class="screens-room-roomDetail__review__profile">
                        <div class="screens-room-roomDetail__review__profile__part-1">
                            <img class="screens-room-roomDetail__review__profile-img"
                                 src="/resources/img/mock/reviewer1.jpeg"
                                 alt="리뷰어 프로필 이미지">
                        </div>
                        <div class="screens-room-roomDetail__review__profile__part-2">
                            <div class="screens-room-roomDetail__review__profile__reviewer">Yongtae
                            </div>
                            <div class="screens-room-roomDetail__review__profile__review-date">2023년
                                11월
                            </div>
                        </div>
                    </div>
                    <div class="screens-room-roomDetail__review__content">
                        훌륭한 숙박이었습니다. 사진과 같습니다. 매우 고요하고 평화롭습니다. 얻는 것에 비해 상당히 비쌉니다.
                    </div>
                    <div></div>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__review__btn-more screens-room-roomDetail__btn-more">
                        더 보기 &gt;
                    </button>
                </div>
            </c:forEach>
        </div>
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-shrink screens-room-roomDetail__btn-square">
            후기 191개
            모두 보기
        </button>
    </div>
    <%--  section-5  --%>
    <div class="screens-room-roomDetail__section-5 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-5__part-1">
            알아두어야 할 사항
        </div>
        <div class="screens-room-roomDetail__section-5__part-2">
            <div class="screens-room-roomDetail__section-5__check-in-out">
                <div class="screens-room-roomDetail__section-5__info-1">체크인 & 체크아웃
                </div>
                <div class="screens-room-roomDetail__section-5__info-2">체크인 시간: 오후
                    ${room.room_checkin_time} ~ 오후 10:00
                </div>
                <div class="screens-room-roomDetail__section-5__info-2">체크아웃 시간: 오후
                    ${room.room_checkout_time} ~ 오후 10:00
                </div>
            </div>
            <div class="screens-room-roomDetail__section-5__refund">
                <div class="screens-room-roomDetail__section-5__info-1">환불 정책</div>
                <div class="screens-room-roomDetail__section-5__info-2">11월 2일 오후 12:40 전까지
                    무료로 취소하실 수 있습니다.
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-5__btn-more">
                    더 보기 &gt;
                </button>
            </div>
        </div>
    </div>
    <%--  section-6  --%>
    <div class="screens-room-roomDetail__section-6 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__font-title screens-room-roomDetail__hosting-region">호스팅
            지역
        </div>
        <div class="screens-room-roomDetail__map"></div>
        <div class="screens-room-roomDetail__map-region">${room.room_address}</div>
    </div>
    <%--  section-7  --%>
    <div class="screens-room-roomDetail__section-7 screens-room-roomDetail__padding-content">
        <div class="screens-room-roomDetail__section-7__host-profile">
            <div class="screens-room-roomDetail__host-profile">
                <img class="screens-room-roomDetail__host-profile-img"
                     src="${profileImgUrl}"
                     alt="호스트 프로필 이미지">
            </div>
            <div class="screens-room-roomDetail__host-bio">
                <div class="screens-room-roomDetail__font-title screens-room-roomDetail__host-bio__name">
                    호스트 : ${host.user_name}님
                </div>
                <div class="screens-room-roomDetail__host-bio__created-at">회원가입일
                    : ${host.created_at}</div>
                <div class="screens-room-roomDetail__host-bio-text">
                    ${host.user_bio}
                </div>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-more screens-room-roomDetail__host-bio__btn-more">
                    더 보기 &gt;
                </button>
            </div>
        </div>
        <div class="screens-room-roomDetail__section-7__host-contact">
            <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink screens-room-roomDetail__host-contact__btn">
                호스트에게 연락하기
            </button>
            <div class="screens-room-roomDetail__host-contact__contact-with-guest">숙박 중 게스트와의 교류
            </div>
            <div class="screens-room-roomDetail__host-contact__contact-method">전화 또는 문자</div>
        </div>


    </div>

    <div id="${room.room_id}" class="modal-div"
         style="position: fixed; bottom: 5%; left: 3%; width: 250px; height: 60px; display: none; z-index: 5;
                         box-shadow: 1px 1px 4px 0 darkgray; border-radius: 10px; background-color: white;
                        font-size: 12px; padding: 10px 10px 0 10px;">
        <img class="modal-img" src="${room.room_main_photo}"
             style="float: left; width: 50px; height: 50px; margin-right: 10px; border-radius: 5px;">
        <h4 style="float: left; color: #717171; margin-top: 6px; width: 170px;">
            <h3 style="float: left; font-size: 14px; font-weight: 500; margin-top: 10px;">${room.room_name}</h3>
        </h4>
    </div>

    <jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

    <%--<!-- 카카오 지도 API : services 라이브러리 불러오기 -->--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
    <%-- 스크립트 --%>
    <script>
        const roomAddress = '${room.room_address}';
    </script>
    <script src="/resources/js/room/roomDetail.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('${KakaoApiKey}');

        function kakaoShare() {
            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: '${room.room_name}',
                    description: '${room.room_total_desc}',
                    imageUrl: '${roomImg.room_img_url}',
                    link: {
                        webUrl: 'localhost:8080/room/roomDetail?room_id=${room.room_id}',
                    },
                },
                buttons: [
                    {
                        title: '웹으로 보기',
                        link: {
                            webUrl: 'localhost:8080/room/roomDetail?room_id=${room.room_id}',
                        },
                    },
                ],
            })
        }

        $(document).ready(function () {
            $('#wishlist').on('click', function (e) {
                // form 전송 시 새로고침 안하기(기본 이벤트 x)
                e.preventDefault();
                // 새로고침 안할 시 다른 요소의 이밴트 받지 않기
                e.stopPropagation();
                // 변수 선언
                // roomID는 list의 각 value값을 가져옴
                var roomID = $(this).val();
                let wished = "/resources/img/room/wished.png";
                let unwished = "/resources/img/room/unwished.png";

                // ajax
                $.ajax({
                    url: "/user/wishLists/active",
                    type: "POST",
                    dataType: "text",
                    data: {room_id: roomID},
                    success: function (response) {
                        $('.modal-div').finish();
                        if (response === 'DEL_OK') {
                            wished = "/resources/img/room/unwished.png";
                            $('#wished').attr('src', wished);
                            $('#wished_text').html('저장하기');
                            unwished = "/resources/img/room/unwished.png";
                            $('#unwished').attr('src', unwished);
                            $('#unwished_text').html('저장하기')
                            $('.modal-div h4').text('위시리스트에서 삭제되었습니다.')
                            $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                        } else if (response === 'IST_OK') {
                            wished = "/resources/img/room/wished.png";
                            $('#wished').attr('src', wished);
                            $('#wished_text').html('저장됨');
                            unwished = "/resources/img/room/wished.png";
                            $('#unwished').attr('src', unwished);
                            $('#unwished_text').html('저장됨')
                            $('.modal-div h4').text('위시리스트에 추가되었습니다.')
                            $("#" + roomID).fadeIn('slow').delay(3000).fadeOut('slow');
                        } else {
                            alert("알 수 없는 문제가 발생했습니다. 다시 시도해주세요.");
                        }
                    },
                    error: function () {
                        location.href = "/user/loginForm";
                    }
                });
            });
        });

    </script>


</body>
</html>
