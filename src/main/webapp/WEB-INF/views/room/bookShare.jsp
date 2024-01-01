<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.ClientInfoStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 12/8/23
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>


<%-- header --%>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section>

    <input name="room_id" type="hidden"
           value="${bookInfo.room_id}">
    <input name="user_id" type="hidden"
           value="${bookInfo.user_id}">
    <input name="room_main_photo" type="hidden"
           value="${bookInfo.room_main_photo}">
    <input name="profile_img_url" type="hidden" value="${profile_img_url}">
    <input name="room_name" type="hidden"
           value="${bookInfo.room_name}"/>
    <input name="booking_checkin_date" type="hidden"
           value="${bookingDto.booking_checkin_date}"/>
    <input name="booking_checkout_date" type="hidden"
           value="${bookingDto.booking_checkout_date}"/>
    <input type="hidden" name="booking_price_sum">

    <%-- 중앙 컨텐츠 --%>
    <div class="screens-room-bookShare__container">
        <%-- left side --%>
        <div class="screens-room-bookShare__container__flex">
            <div class="screens-room-bookShare__container__left-side">
                <div class="screens-room-bookShare__title">
                    <h1>예약이 아직 확정되지 않았습니다.</h1>
                </div>

                <div class="screens-room-bookShare__container__div-common">
                    <div class="screens-room-bookShare__container__left-side--info-common">
                        <%-- TODO: HOST-NICKNAME, USER - EMAIL 넣기 --%>
                        <div>예약이 아직 확정된 것이 아닙니다. 24시간 이내에 호스트 ${bookInfo.user_nickname}님의 응답을
                            이메일(${user_email})로
                            받으실 수 있습니다.
                        </div>
                    </div>
                </div>

                <div class="screens-room-bookShare__container__div-common">
                    <div class="screens-room-bookShare__container__left-side--info-common">
                        <div>예약이 확정되기 전에는 요금이 청구되지 않으니 걱정 마세요.</div>
                    </div>
                </div>

                <%-- 마지막 단계: 여행 계획 공유하기 --%>
                <div class="screens-room-bookShare__container__left-side--space-topdown">
                    <section>
                        <div>
                            <div class="screens-room-bookShare__container__left-side--space-topdown__header">
                                <div class="screens-room-bookShare__container__left-side--space-topdown__header__payment">
                                    <h2 class="screens-room-bookShare__text-size-reservation-room-info-h2">
                                        마지막 단계: 여행 계획 공유하기</h2>
                                </div>

                                <div class="screens-room-bookShare__container__div-common">
                                    <div class="screens-room-bookShare__container__left-side--info-common">
                                        <div>여행 일정표를 다른 사람과 공유해 보세요.</div>
                                    </div>
                                </div>

                                <%-- 이메일 주소 입력 창 --%>
                                <div class="screens-room-bookShare__write-email-box">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">
                                    <input class="screens-room-bookShare__write-email-box--email"
                                           placeholder="이메일 주소 입력">

                                </div>

                            </div>
                        </div>
                    </section>
                </div>


                <%-- 예약 요청 --%>
                <div class="screens-room-bookShare__submit">
                    <button class="screens-room-bookShare__submit--button"
                            id="submit-button">
                        제출하기
                    </button>

                    <button class="screens-room-bookShare__submit--button"
                            id="skip-button">
                        건너뛰기
                    </button>
                </div>

                <h3 class="screens-room-bookShare__sub-h3">알아두어야 할 사항</h3>
                <div class="screens-room-bookShare__sub-info">
                    <%-- TODO: 데이터에 맞게 바꾸기 --%>
                    <div>
                        <div>숙소 이용규칙</div>
                        <div>체크인 가능 시간: 오전 ${bookInfo.room_checkin_time}</div>
                        <div>체크아웃 시간: 오후 ${bookInfo.room_checkout_time}</div>
                        <div>게스트 정원 ${bookInfo.room_standard_capa}명</div>
                    </div>

                    <div>
                        <div>안전 및 숙소</div>
                        <div>보안 카메라/녹화 장치</div>
                        <div>출입이 제한되지 않는 수영장/욕조</div>
                        <div>근처에 호수, 강, 바다 등이 있음</div>
                    </div>
                </div>

            </div>
            <%-- END left side --%>


            <%-- right side --%>
            <div class="screens-room-bookShare__container__right-side">
                <div class="screens-room-bookShare__container__right-side__inner-container">
                    <div>

                        <%-- 1번째 박스 --%>
                        <div class="screens-room-bookShare__container__right-side__box-size">
                            <%-- 이미지 --%>
                            <div class="screens-room-bookShare__right-side__box-size">
                                <img src="${bookInfo.room_main_photo}"
                                     id="screens-room-bookShare__img_url">
                            </div>


                        </div>
                        <div class="screens-room-bookShare__container__right-side__box-size__space-box">
                            <h3 id="screens-room-bookShare__title">
                                ${bookInfo.room_name}
                            </h3>

                            <div>
                                <span>${bookingDto.booking_checkin_date} ~ ${bookingDto.booking_checkout_date}</span>
                                <span>/</span>
                                <span>게스트</span>
                                <span>${bookingDto.booking_num_of_guest}</span>
                                <span>명</span>
                            </div>
                        </div>


                        <%-- 2번째 박스 --%>
                        <%--                        <div class="screens-room-bookShare__border-bound-top"></div>--%>
                        <%--                        <div class="screens-room-bookShare__container__right-side__flex-box-column__total-payment">--%>
                        <%--                            <div>총 합계(KRW)</div>--%>
                        <%--                            <div>₩583,423</div>--%>
                        <%--                        </div>--%>

                        <div class="screens-room-book__border-bound-top"></div>
                        <div class="screens-room-book__reservation__part-6">
                            <span class="screens-room-book__reservation__part-6__mul">숙박 비용</span>

                            <div>
                                <span>₩ </span>
                                <span id="BookingPriceSum">${formattedAmount}</span>
                            </div>
                        </div>

                        <%-- 3번째 박스 --%>
                        <%--                        <div class="screens-room-bookShare__border-bound-top"></div>--%>
                        <%--                        <div class="screens-room-bookShare__container__right-side__flex-box-column__total-payment">--%>
                        <%--                            <div>예약 코드</div>--%>
                        <%--                            <div>HMERQXJJ84</div>--%>
                        <%--                        </div>--%>

                    </div>
                </div>
            </div>
            <%-- END right side --%>
        </div>

    </div>
</section>


<script
        src="https://kit.fontawesome.com/d1e61c2fb7.js"
        crossorigin="anonymous"
></script>
<script src="/resources/js/room/bookingShare.js"></script>


</body>
</html>
