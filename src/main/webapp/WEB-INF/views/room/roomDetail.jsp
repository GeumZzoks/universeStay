<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@OauthProperties['KAKAO_JavaScript_KEY']" var="KakaoApiKey"/>
<html>
<head>
    <title>roomDetail</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <%--  dateRangePicker  --%>
    <link rel="stylesheet"
          href="http://longbill.github.io/jquery-date-range-picker/dist/daterangepicker.min.css">


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
                                 src="/resources/img/room/unwished.png"
                                 style="width: 16px; height: 16px;"></span>
                            <span id="unwished_text"
                                  class="screens-room-roomDetail__btn-share__text">
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
        <button class="screens-room-roomDetail__btn screens-room-roomDetail__room-photo">
            <img class="screens-room-roomDetail__room-photo__img"
                 src="${room.room_main_photo}" alt="">
        </button>
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
                        기준 인원 ${room.room_standard_capa}명 · 최대 인원 ${room.room_max_capa}명 ·
                        침실 ${room.room_bedroom_cnt}개 ·
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
                    <c:forEach var="roomAmenity" items="${roomAmenities}" begin="1" end="10">
                        <li class="screens-room-roomDetail__section-3__li">
                            <div class="screens-room-roomDetail__section-3__li__text">${roomAmenity[0]}</div>
                            <div class="screens-room-roomDetail__section-3__li__icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                     aria-hidden="true" role="presentation" focusable="false"
                                     style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                    <path d="${roomAmenity[1]}"></path>
                                </svg>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <button class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink screens-room-roomDetail__section-3__room-info__info-2__modal-btn">
                    편의시설 ${roomAmenities.size()}개 모두 보기
                </button>
                <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-outer screens-room-roomDetail__modal-amenity">
                    <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-inner">
                        <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-btn-close-container">
                            <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__room-info__info-2__modal-btn-close screens-room-roomDetail__modal-btn-close-amenity">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                     aria-hidden="true" role="presentation" focusable="false"
                                     style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
                                    <path d="m6 6 20 20M26 6 6 26"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-inner-container">
                            <div class="screens-room-roomDetail__modal__room-amenity-title">숙소 편의시설
                            </div>
                            <c:set var="amenity_type" value=""></c:set>
                            <c:forEach var="roomAmenity" items="${roomAmenities}">
                                <c:if test="${amenity_type ne roomAmenity[2]}">
                                    <div class="screens-room-roomDetail__modal__room-amenity-type">${roomAmenity[2]}</div>
                                    <c:set var="amenity_type" value="${roomAmenity[2]}"></c:set>
                                </c:if>
                                <div class="screens-room-roomDetail__modal__room-amenity">
                                    <div class="screens-room-roomDetail__modal__room-amenity-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                             aria-hidden="true" role="presentation"
                                             focusable="false"
                                             style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                            <path d="${roomAmenity[1]}"></path>
                                        </svg>
                                    </div>
                                    <div class="screens-room-roomDetail__modal__room-amenity-name">${roomAmenity[0]}</div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="screens-room-roomDetail__modal-back"></div>
            </div>
            <div class="screens-room-roomDetail__padding-content screens-room-roomDetail__section-3__room-info__info-3">
                <div class="screens-room-roomDetail__section-3__info-3__container">
                    <div class="screens-room-roomDetail__font-title screens-room-roomDetail__section-3__info-3__desc1">
                        숙소 설명
                    </div>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2">
                        ${room.room_total_desc}
                    </p>
                    <p class="screens-room-roomDetail__section-3__info-3__desc2-2">
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
                    <p class="screens-room-roomDetail__section-3__info-3__desc2-2">
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
                    <p class="screens-room-roomDetail__section-3__info-3__desc2-2">
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
            <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-outer screens-room-roomDetail__modal-desc-more">
                <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-inner">
                    <div class="screens-room-roomDetail__section-3__room-info__info-2__modal-btn-close-container">
                        <button class="screens-room-roomDetail__btn screens-room-roomDetail__section-3__room-info__info-2__modal-btn-close screens-room-roomDetail__modal-btn-close-room-desc">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
                                <path d="m6 6 20 20M26 6 6 26"></path>
                            </svg>
                        </button>
                    </div>
                    <div class="screens-room-roomDetail__modal-desc-more-container">
                        <div class="screens-room-roomDetail__modal-desc-more__title">숙소 설명</div>
                        <div class="screens-room-roomDetail__modal-desc-more__content">숙소 설명 세부 내용
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="screens-room-roomDetail__section-3__reservation">

            <%--  TODO : 주중 주말 가격과 숙박 일정설정에 따른 총합계 구현  --%>

            <div class="screens-room-roomDetail__reservation__part-1">
                <div class="screens-room-roomDetail__reservation__price">
                    <span class="screens-room-roomDetail__price__part-1">₩ ${room.room_weekday_price}</span>
                    <span class="screens-room-roomDetail__price__part-2">/박 (주중)</span>
                </div>
                <div class="screens-room-roomDetail__reservation__info">
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__check-in-out">
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크인
                            </div>

                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2"
                                 id="check-in-button">
                                YYYY-MM-DD
                            </div>
                            <input type="hidden" name="booking_checkin_date">
                        </div>
                        <div class="screens-room-roomDetail__check-in-out">
                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">
                                체크아웃
                            </div>

                            <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2"
                                 id="check-out-button">
                                YYYY-MM-DD
                            </div>
                            <input type="hidden" name="booking_checkout_date">
                        </div>
                    </button>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__number-people">
                        <div class="screens-room-roomDetail__number-people__desc">
                            <div class="screens-room-roomDetail__number-people__desc1">인원</div>
                            <span>게스트</span>
                            <span class="screens-room-roomDetail__number-people__desc2"
                                  id="totalGuest-button">1
                            </span>
                            <span>명</span>
                            <input type="hidden" name="booking_num_of_guest">
                            <input type="hidden" name="room_max_capa" value="${room.room_max_capa}">
                            <input type="hidden" name="room_standard_capa"
                                   value="${room.room_standard_capa}">
                        </div>
                        <div class="screens-room-roomDetail__number-people__arrow">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                 aria-hidden="true" role="presentation" focusable="false"
                                 style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;">
                                <path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path>
                            </svg>
                        </div>
                    </button>
                    <div class="screens-room-roomDetail__number-people-toggle">
                        <span class="screens-room-roomDetail__toggle-part-1">성인</span>
                        <div class="screens-room-roomDetail__toggle-part-2">
                            <button type="button"
                                    class="screens-room-roomDetail__toggle-btn-minus disable">
                                <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true"
                                     role="presentation" focusable="false"
                                     style="display: block; height: 12px; width: 12px; fill: #717171;">
                                    <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                                </svg>
                            </button>
                            <input type="text" class="screens-room-roomDetail__toggle-num"
                                   name="toggle-people-num" value='1' readonly/>
                            <button type="button"
                                    class="screens-room-roomDetail__toggle-btn-plus">
                                <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                     aria-hidden="true"
                                     role="presentation" focusable="false"
                                     style="display: block; height: 12px; width: 12px; fill: #717171;">
                                    <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <div>
                    <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__btn screens-room-roomDetail__btn-shrink"
                            id="submit-button"
                            value="${room.room_id}">
                        예약하기
                    </button>
                </div>
            </div>
            <div class="screens-room-roomDetail__reservation__part-2">
                예약 확정 전에는 요금이 청구되지 않습니다.
            </div>
            <div class="screens-room-roomDetail__reservation__part-3">
                <span class="screens-room-roomDetail__reservation__part-3__mul">₩ <span>${room.room_weekday_price}</span> X <span>0</span>박 (주중)</span>
                <span>₩ 0</span>
                <input type="hidden" value="${room.room_weekday_price}">
            </div>
            <div class="screens-room-roomDetail__reservation__part-4">
                <span class="screens-room-roomDetail__reservation__part-4__mul">₩ <span>${room.room_weekend_price}</span> X <span>0</span>박 (주말)</span>
                <span>₩ 0</span>
                <input type="hidden" value="${room.room_weekend_price}">
            </div>
            <div class="screens-room-roomDetail__reservation__part-5">
                <span class="screens-room-roomDetail__reservation__part-5__mul">₩ <span>${room.room_extra_person_fee}</span> X <span>0</span>명 (추가인원) X <span>0</span>박 </span>
                <span>₩ 0</span>
                <input type="hidden" value="${room.room_extra_person_fee}">
            </div>
            <div class="screens-room-roomDetail__reservation__part-6">
                <span class="screens-room-roomDetail__reservation__part-6__mul">합계</span>
                <span>₩ 0 </span>
                <input type="hidden" name="booking_price_sum">
            </div>
        </div>
        <div class="screens-room-roomDetail__bookingDates">
            <c:forEach var="bookingDto" items="${bookingDtos}">
                <div class="screens-room-roomDetail__bookingDate">
                    <input type="hidden" value="${bookingDto.booking_checkin_date}">
                    <input type="hidden" value="${bookingDto.booking_checkout_date}">
                </div>
            </c:forEach>
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

        <div class="reviewModal hidden">
            <div class="reviewModal__overlay"></div>
            <div class="reviewModal__content">
                <div class="reviewModal__content__header">
                    <svg class="reviewModal__content__header__button"
                         xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                         aria-hidden="true" role="presentation" focusable="false"
                         style="display: block; fill: none; height: 20px; width: 20px; stroke: currentcolor; stroke-width: 3; overflow: visible;">
                        <path d="m6 6 20 20M26 6 6 26"></path>
                    </svg>
                </div>
                <div class="reviewModal__content__body">
                    <div class="reviewModal__content__reviewandstar">
                        <svg class="reviewModal__content__reviewandstar__svg"
                             xmlns="http://www.w3.org/2000/svg"
                             viewBox="0 0 32 32" aria-hidden="true" role="presentation"
                             focusable="false"
                             style="display: inline; height: 50px; width: 60px; fill: currentcolor;">
                            <path fill-rule="evenodd"
                                  d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z">
                            </path>
                        </svg>

                        <div style="font-size: 50px; margin-left: 10px;">4.5</div>

                        <div style="font-size: 50px; margin-left: 98px;">후기 109개</div>
                    </div>
                    <div class="reviewModal__content__body__all">
                        <div class="reviewModal__content__body__wrap">
                            <div class="reviewModal__content__search">
                                <svg class="reviewModal__content__search__svg" focusable="false"
                                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path
                                            d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
                                    </path>
                                </svg>
                                <input class="reviewModal__content__search__input"
                                       style="width: 90%; border: none; outline: none;" type="text"
                                       placeholder="후기 검색">
                            </div>
                        </div>
                        <div class="reviewModal__content__reviews">
                            <%--                            <div class="reviewModal__content__review">--%>
                            <%--                                <div class="reviewModal__content__review__nickname"><img src="">닉네임--%>
                            <%--                                </div>--%>
                            <%--                                <div class="reviewModal__content__review__star">★️★️★️★️★️️</div>--%>
                            <%--                                <div class="reviewModal__content__review__content">--%>
                            <%--                                    너무--%>
                            <%--                                    좋아요ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <%--                            <div class="reviewModal__content__review">--%>
                            <%--                                <div class="reviewModal__content__review__nickname"><img src="">닉네임--%>
                            <%--                                </div>--%>
                            <%--                                <div class="reviewModal__content__review__star"></div>--%>
                            <%--                                <div class="reviewModal__content__review__content">너무 좋아요</div>--%>
                            <%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button class="screens-room-roomDetail__btn-review-modal screens-room-roomDetail__btn screens-room-roomDetail__btn-shrink screens-room-roomDetail__btn-square">
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
            <button onclick="createChatRoom()"
                    class="screens-room-roomDetail__btn screens-room-roomDetail__btn-square screens-room-roomDetail__btn-shrink screens-room-roomDetail__host-contact__btn">
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
        <h4 style="float: left; color: #717171; margin-top: 6px; width: 190px;">
            <h3 style="float: left; font-size: 14px; font-weight: 500; margin-top: 10px;">${room.room_name}</h3>
        </h4>
    </div>


    <%--    <jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>

    <%--<!-- 카카오 지도 API : services 라이브러리 불러오기 -->--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KakaoApiKey}&libraries=services"></script>
    <%-- 스크립트 --%>
    <script>
      const roomAddress = '${room.room_address}';
    </script>
    <%-- 제이쿼리 --%>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <%-- 캘린더 스크립트 --%>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <%--  dateRangePicker  --%>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.14.2/jquery.daterangepicker.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.16.0/moment.min.js"></script>
    <%--    <script src="/resources/js/room/roomDetail.js"></script>--%>
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


    <script>
      $(document).ready(function () {
        $(".screens-room-roomDetail__btn-review-modal").click(function () {
          $.ajax({
            type: 'GET',                                    // 요청 메서드
            url: '/room/${room.room_id}/reviews',           // 요청 URL
            headers: {"content-type": "application/json"},  // 요청 헤더
            dataType: 'text',                               // 전송받을 데이터의 타입
            success: function (result) {
              let reviewList = JSON.parse(result);
              console.log(reviewList);
              $('.reviewModal__content__reviews').empty();
              $.each(reviewList, function (index, reviewList) {
                let fullStar = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>';
                let halfStar = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false"style="display: block; height: 20px; width: 20px;"><defs><linearGradient id="half-fill-gradient" x1="0%" y1="0%" x2="100%" y2="0%"> <stop offset="0%" style="stop-color: var(--f-k-smk-x);"></stop><stop offset="50%" style="stop-color: var(--f-k-smk-x);"></stop><stop offset="50%" style="stop-color: transparent;"></stop><stop offset="100%" style="stop-color: transparent;"></stop></linearGradient></defs><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z" style="fill: url(#half-fill-gradient); stroke: #000000; stroke-width: 1; stroke-linejoin: round;"></path></svg>';
                let emptyStar = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: #ffffff; stroke: #000000; stroke-width: 1;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>';

                let reviewStars = '';
                let fullStars = Math.floor(reviewList.review_stars);
                let halfStars = (reviewList.review_stars % 1) !== 0 ? 1 : 0;
                let emptyStars = 5 - fullStars - halfStars;

                for (let i = 0; i < fullStars; i++) {
                  reviewStars += fullStar;
                }
                for (let i = 0; i < halfStars; i++) {
                  reviewStars += halfStar;
                }
                for (let i = 0; i < emptyStars; i++) {
                  reviewStars += emptyStar;
                }

                let html = '<div class="reviewModal__content__review" style="padding-top: 10px; margin-bottom: 20px;">'
                    +
                    '    <div class="reviewModal__content__review__nickname"><img src="">'
                    + reviewList.user_nickname + '</div>' +
                    '    <div class="reviewModal__content__review__star" style="display: flex;">'
                    + reviewStars
                    + '</div>' +
                    '    <div class="reviewModal__content__review__content">'
                    + reviewList.review_ctt
                    + '</div>' +
                    '</div>';
                $('.reviewModal__content__reviews').append(html);
              });

            },
            error: function () {
              alert("후기를 불러오는 도중 문제가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
          });
        });
      });
    </script>


    <script src="/resources/js/room/roomDetail.js"></script>


    <script>
      function createChatRoom() {
        var room_id = '${room.room_id}';
        location.href = '/chatting/createRoom/' + room_id;
      }
    </script>

</body>
</html>
