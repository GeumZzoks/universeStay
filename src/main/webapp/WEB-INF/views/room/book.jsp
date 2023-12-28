<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.ClientInfoStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 12/6/23
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat df = new DecimalFormat("###,###");

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
    <title>확인 및 결제</title>
    <link rel="stylesheet" href="/resources/css2/style.css"/>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <%--  dateRangePicker  --%>
    <link rel="stylesheet"
          href="http://longbill.github.io/jquery-date-range-picker/dist/daterangepicker.min.css"/>

</head>
<body>

<div class="screens-room-book__bookingDates">
    <c:forEach var="bookingDto" items="${bookingDtos}">
        <div class="screens-room-book__bookingDate">
            <input type="hidden" value="${bookingDto.booking_checkin_date}">
            <input type="hidden" value="${bookingDto.booking_checkout_date}">
        </div>
    </c:forEach>
</div>

<%-- header --%>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section>

    <div class="screens-room-book__title">
        <h1>예약 요청</h1>
    </div>

    <%-- 중앙 컨텐츠 --%>
    <div class="screens-room-book__container">
        <%-- left side --%>
        <div class="screens-room-book__container__flex">
            <div class="screens-room-book__container__left-side">

                <div class="screens-room-book__container__div-common">
                    <h2 class="screens-room-book__text-size-reservation-room-info-h2">예약
                        정보</h2>
                </div>

                <div class="screens-room-book__container__div-common">
                    <div class="screens-room-book__container__left-side--info-common">
                        <h3>날짜</h3>
                        <span id="check-in-button">${bookingDto.booking_checkin_date}</span>
                        <span> ~ </span>
                        <span id="check-out-button">${bookingDto.booking_checkout_date}</span>
                        <div style="display: none"
                             id="screens-room-book__check-in-data">${bookingDto.booking_checkin_date}</div>
                        <input type="hidden" name="booking_checkin_date">
                        <div style="display: none"
                             id="screens-room-book__check-out-data">${bookingDto.booking_checkout_date}</div>
                        <input type="hidden" name="booking_checkout_date">

                    </div>
                    <span class="screens-room-book__container__div-common__span screens-room-book__reservation__check-in-out">수정</span>
                </div>

                <div class="screens-room-book__container__div-common">
                    <div class="screens-room-book__container__left-side--info-common">
                        <h3>게스트</h3>
                        <div>
                            <span>게스트</span>
                            <span id="totalGuest-button">${bookingDto.booking_num_of_guest}</span>
                            <span>명</span>
                        </div>
                        <div style="display: none"
                             id="screens-room-book__total-guest">${bookingDto.booking_num_of_guest}</div>
                    </div>
                    <span class="screens-room-book__container__div-common__span screens-room-book__reservation__number-people">수정</span>
                    <input type="hidden" name="booking_num_of_guest">
                    <input type="hidden" name="room_max_capa" value="${bookInfo.room_max_capa}">
                    <input type="hidden" name="room_standard_capa"
                           value="${bookInfo.room_standard_capa}">
                </div>

                <%-- 인원 수 조정 모달 --%>
                <div class="screens-room-book__number-people-toggle">
                    <span class="screens-room-book__toggle-part-1">성인</span>
                    <div class="screens-room-book__toggle-part-2">
                        <button type="button"
                                class="screens-room-book__toggle-btn-minus disable">
                            <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                 aria-hidden="true"
                                 role="presentation" focusable="false"
                                 style="display: block; height: 12px; width: 12px; fill: #717171;">
                                <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>
                            </svg>
                        </button>
                        <input type="text" class="screens-room-book__toggle-num"
                               name="toggle-people-num" value='1' readonly/>
                        <button type="button"
                                class="screens-room-book__toggle-btn-plus">
                            <svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                 aria-hidden="true"
                                 role="presentation" focusable="false"
                                 style="display: block; height: 12px; width: 12px; fill: #717171;">
                                <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>
                            </svg>
                        </button>
                    </div>
                </div>

                <%-- 결제 수단 --%>
                <%--                <div class="screens-room-book__border-bound-top"></div>--%>
                <%--                <div class="screens-room-book__container__left-side--space-topdown">--%>
                <%--                    <section>--%>
                <%--                        <div>--%>
                <%--                            <div class="screens-room-book__container__left-side--space-topdown__header">--%>
                <%--                                <div class="screens-room-book__container__left-side--space-topdown__header__payment">--%>
                <%--                                    <h2 class="screens-room-book__text-size-reservation-room-info-h2">--%>
                <%--                                        결제 수단</h2>--%>
                <%--                                    <div style="display: flex">--%>
                <%--                                        <div class="screens-room-book__container__left-side--space-topdown__header__img">--%>
                <%--                                            <img src="https://a0.muscache.com/airbnb/static/packages/assets/frontend/legacy-shared/svgs/payments/logo_visa.0adea522bb26bd90821a8fade4911913.svg">--%>
                <%--                                        </div>--%>
                <%--                                        <div class="screens-room-book__container__left-side--space-topdown__header__img">--%>
                <%--                                            <img src="https://a0.muscache.com/airbnb/static/packages/assets/frontend/legacy-shared/svgs/payments/logo_mastercard.f18379cf1f27d22abd9e9cf44085d149.svg">--%>
                <%--                                        </div>--%>
                <%--                                        <div class="screens-room-book__container__left-side--space-topdown__header__img">--%>
                <%--                                            <img src="https://a0.muscache.com/airbnb/static/packages/assets/frontend/legacy-shared/svgs/payments/logo_naver_pay.4e1254eb1a8052c11c88d1ebc4a44382.svg">--%>
                <%--                                        </div>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>

                <%--                                <div class="screens-room-book__container__left-side--space-topdown__header__select">--%>
                <%--                                    <button>--%>
                <%--                                        <div class="screens-room-book__container__left-side--space-topdown__header__select__box">--%>
                <%--                                            <div style="display: flex; align-items: center">--%>
                <%--                                                <div style="margin-right: 16px">--%>
                <%--                                                    <svg xmlns="http://www.w3.org/2000/svg"--%>
                <%--                                                         viewBox="0 0 44 32" aria-label="마스터카드"--%>
                <%--                                                         role="img"--%>
                <%--                                                         focusable="false"--%>
                <%--                                                         style="display: block; height: 33px; width: 33px;">--%>
                <%--                                                        <g fill="none" fill-rule="evenodd">--%>
                <%--                                                            <path fill="#F26122" fill-rule="nonzero"--%>
                <%--                                                                  d="M17.45 9.12h9.13V23.8h-9.13z"></path>--%>
                <%--                                                            <path fill="#EA1D25" fill-rule="nonzero"--%>
                <%--                                                                  d="M21.97 23.8a9.54 9.54 0 0 1-5.84 2 9.75 9.75 0 0 1-6.73-2.77 9.1 9.1 0 0 1-2.74-6.56A9.09 9.09 0 0 1 9.39 9.9a9.64 9.64 0 0 1 6.74-2.76c2.13 0 4.19.7 5.84 2a9.36 9.36 0 0 0-3.6 7.33 9.34 9.34 0 0 0 3.6 7.33z"></path>--%>
                <%--                                                            <path fill="#F69E1E" fill-rule="nonzero"--%>
                <%--                                                                  d="M37.32 16.45a9.1 9.1 0 0 1-2.74 6.57 9.65 9.65 0 0 1-6.74 2.76c-2.13 0-4.18-.7-5.84-2a9.36 9.36 0 0 0 3.6-7.33A9.34 9.34 0 0 0 22 9.12a9.54 9.54 0 0 1 5.84-2 9.76 9.76 0 0 1 6.74 2.77 9.07 9.07 0 0 1 2.74 6.56z"></path>--%>
                <%--                                                            <path fill="#B0B0B0"--%>
                <%--                                                                  d="M2.04 1C1.47 1 1 1.47 1 2.05v27.9c0 .58.47 1.05 1.04 1.05h39.92c.57 0 1.04-.47 1.04-1.05V2.05C43 1.47 42.53 1 41.96 1H2.04zM0 2.05C0 .92.9 0 2.04 0h39.92C43.1 0 44 .92 44 2.05v27.9c0 1.13-.9 2.05-2.04 2.05H2.04A2.04 2.04 0 0 1 0 29.95V2.05z"></path>--%>
                <%--                                                        </g>--%>
                <%--                                                    </svg>--%>
                <%--                                                </div>--%>
                <%--                                                <div style="font-family: NotoSansKR-Light">•••• 7150--%>
                <%--                                                </div>--%>
                <%--                                            </div>--%>

                <%--                                        </div>--%>
                <%--                                    </button>--%>
                <%--                                    <span style="position: absolute !important; top: 0 !important; right: 20px !important; height: 100%; pointer-events: none !important;">--%>
                <%--                                    <div style="display: table !important; position:relative !important; height: 100% !important;">--%>
                <%--                                        <div style="display: table-cell !important; vertical-align: middle !important;">--%>
                <%--                                            <div style="transform: rotate(90deg)">--%>
                <%--                                                <i class="fa-solid fa-chevron-right fa-xs"></i>--%>
                <%--&lt;%&ndash;                                                <svg viewBox="0 0 18 18" role="presentation"&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                     aria-hidden="true"&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                     focusable="false"&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                     style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                    <path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z"&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                          fill-rule="evenodd"></path>&ndash;%&gt;--%>
                <%--&lt;%&ndash;                                                </svg>&ndash;%&gt;--%>
                <%--                                            </div>--%>
                <%--                                        </div>--%>
                <%--                                    </div>--%>
                <%--                                </span>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>

                <%--                        </div>--%>
                <%--                    </section>--%>
                <%--                </div>--%>

                <%-- 필수입력정보 --%>
                <div class="screens-room-book__border-bound-top"></div>
                <div class="screens-room-book__container__left-side--space-topdown">
                    <div>
                        <h2 class="screens-room-book__text-size-reservation-room-info-h2"
                            style="margin-bottom: 16px">
                            필수 입력
                            정보</h2>
                    </div>

                    <label for="null_textArea">
                        <div style="font-family: NotoSansKR-Medium; margin-bottom: 4px">호스트에게 메시지
                            보내기
                        </div>
                        <div style="font-family: NotoSansKR-Light">여행 목적, 동반 일행, 이 숙소를 선택한 이유 등을
                            알려주세요.
                        </div>

                        <div style="display: flex; padding: 32px 0;">
                            <div style="width: 50px; height: 50px; overflow: hidden;">
                                <img style="border-radius: 50%; width: 100%; height: 100%; object-fit: cover;"
                                     src="${bookInfo.profile_img_url}"
                                     id="screens-room-book__profile_img_url"
                                />
                            </div>
                            <div style="padding-left: 16px">
                                <div style="font-family: NotoSansKR-Medium">${bookInfo.user_nickname}</div>
                                <div style="font-family: NotoSansKR-Light">UniverseStay
                                    가입: <fmt:formatDate value="${bookInfo.created_at}"
                                                        pattern="yyyy"/>년
                                </div>
                            </div>
                        </div>

                        <textarea id="null_textArea" rows="5" autocomplete="off"
                                  style="padding: 8px; background-color: transparent; font-family: NotoSansKR-Light; border-radius: 8px; width: 100%"></textarea>
                    </label>

                </div>

                <%-- 예약 요청 --%>
                <div style="padding: 24px 0px">
                    <button style="padding: 16px 32px; background: linear-gradient(to right,#E61E4D 0%,#E31C5F 50%,#D70466 100%); cursor: pointer; border: none; border-radius: 8px; color: #FFFFFF; font-size: 1.125rem"
                            value="${bookingDto.room_id}"
                            id="submit-button">
                        예약 요청
                    </button>
                </div>

            </div>
            <%-- END left side --%>


            <%-- right side --%>
            <div class="screens-room-book__container__right-side">
                <div class="screens-room-book__container__right-side__inner-container">
                    <div>

                        <%-- 1번째 박스 --%>
                        <div class="screens-room-book__container__right-side__box-size">

                            <%-- 이미지 --%>
                            <div class="screens-room-book__right-side__box-size">
                                <img src="${bookInfo.room_main_photo}">
                            </div>

                            <div class="screens-room-book__container__right-side__box-size__space-box">
                                <%-- 텍스트 박스 --%>
                                <div>
                                    <div>
                                        <div class="screens-room-book__container__right-side__review">
                                            집 전체
                                        </div>
                                        <div class="screens-room-book__container__right-side__review--bigger">
                                            <%--                                            HaHa Haus (하하 하우스) - cozy flat in Itaewon--%>
                                            ${bookInfo.room_name}
                                        </div>
                                    </div>
                                </div>


                                <div style="display: flex; align-items: center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                         aria-hidden="true" role="presentation"
                                         focusable="false"
                                         style="display: block; height: 10px; width: 10px; fill: currentcolor;">
                                        <path fill-rule="evenodd"
                                              d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path>
                                        <div class="screens-room-book__container__right-side__review">
                                            <span>${bookInfo.room_stars_avg}</span>
                                            (후기 ${roomReviewCount}개)
                                        </div>

                                    </svg>
                                    <span class="s1a0pub atm_7l_1vqu0jy atm_gz_logulu dir dir-ltr"
                                          style="margin-left: 8px"><svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            viewBox="0 0 16 16"
                                            aria-hidden="true" role="presentation"
                                            focusable="false"
                                            style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path
                                            d="m8.5 7.6 3.1-1.75 1.47-.82a.83.83 0 0 0 .43-.73V1.33a.83.83 0 0 0-.83-.83H3.33a.83.83 0 0 0-.83.83V4.3c0 .3.16.59.43.73l3 1.68 1.57.88c.35.2.65.2 1 0zm-.5.9a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7z"></path></svg></span>
                                    <div class="screens-room-book__container__right-side__review">
                                        슈퍼호스트
                                    </div>
                                </div>

                            </div>


                        </div>

                        <%-- 2번째 박스 --%>
                        <div class="screens-room-book__border-bound-top"></div>
                        <div class="screens-room-book__container__right-side__flex-box-column">
                            <div style="padding: 24px 0">
                                <h2 class="screens-room-book__text-size-reservation-room-info-h2">
                                    요금 세부정보</h2>
                            </div>

                            <div>
                                <div class="screens-room-book__reservation__part-3 screens-room-book__container__right-side__second-box__sub-box">
                                    <span class="screens-room-book__reservation__part-3__mul">₩ <span>${bookInfo.room_weekday_price}</span> X <span>${weekdayCount}</span>박 (주중)</span>
                                    <span>₩ ${weekdayPrice}</span>
                                    <input type="hidden" value="${bookInfo.room_weekday_price}">
                                </div>
                                <div class="screens-room-book__reservation__part-4 screens-room-book__container__right-side__second-box__sub-box">
                                    <span class="screens-room-book__reservation__part-4__mul">₩ <span>${bookInfo.room_weekend_price}</span> X <span>${weekendCount}</span>박 (주말)</span>
                                    <span>₩ ${weekendPrice}</span>
                                    <input type="hidden" value="${bookInfo.room_weekend_price}">
                                </div>
                                <div class="screens-room-book__reservation__part-5 screens-room-book__container__right-side__second-box__sub-box">
                                    <span class="screens-room-book__reservation__part-5__mul">₩ <span>${bookInfo.room_extra_person_fee}</span> X <span>${extraPersonCount}</span>명 (추가인원) X <span>${totalDay}</span>박 </span>
                                    <span>₩ ${extraPersonFee}</span>
                                    <input type="hidden" value="${bookInfo.room_extra_person_fee}">
                                </div>

                            </div>
                        </div>

                        <%-- 3번째 박스 --%>
                        <div class="screens-room-book__border-bound-top"></div>
                        <div class="screens-room-book__reservation__part-6">
                            <span class="screens-room-book__reservation__part-6__mul">합계</span>
                            <div>
                                <span>₩ </span>
                                <span id="BookingPriceSum">${BookingPriceSum}</span>
                            </div>
                            <input type="hidden" name="booking_price_sum">
                        </div>

                        <%--                        <div class="screens-room-book__container__right-side__flex-box-column__total-payment">--%>
                        <%--                            <div>총 합계(KRW)</div>--%>
                        <%--                            <div>₩583,423</div>--%>
                        <%--                        </div>--%>

                    </div>
                </div>
            </div>
            <%-- END right side --%>
        </div>

    </div>
</section>

<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

<script
        src="https://kit.fontawesome.com/d1e61c2fb7.js"
        crossorigin="anonymous"
></script>

<%--  dateRangePicker  --%>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.14.2/jquery.daterangepicker.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.16.0/moment.min.js"></script>

<script src="/resources/js/room/book.js"></script>
</body>
</html>
