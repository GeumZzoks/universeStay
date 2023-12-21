<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>contact_host</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <%--  dateRangePicker  --%>
    <link rel="stylesheet"
          href="http://longbill.github.io/jquery-date-range-picker/dist/daterangepicker.min.css">

    <script
            src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <style>

      .contact_host__wrapper {
        padding: 20px 200px;
      }

      .screens-chat-send_host__section-1 {
        display: flex;
        justify-content: flex-start;
      }

      .screens-chat-send_host__section-1__room-info {
        display: flex;
        width: 100%;
      }

      .screens-chat-send_host__section-1__info {
        padding: 40px 0;
        border-bottom: 1px #DDDDDD solid;
      }

      .screens-chat-send_host__section-1__room-info__info-1 {
        display: flex;
        justify-content: space-between;
      }

      .screens-chat-send_host__section-1__info-1__desc {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding-bottom: 32px;
      }

      .screens-chat-send_host__section-1__info-1__desc2 {
        font-family: NotoSansKR-Light;
        font-size: 14px;
      }

      .screens-chat-send_host__section-1__info-1__profile {
        width: 45px;
        height: 45px;
        overflow: hidden;
        border-radius: 50%;
      }

      .screens-chat-send_host__section-1__info-1__profile-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .screens-chat-send_host__section-1__reservation {
        width: 33.33%;
        margin-left: 8.33%;
        height: 380px;
        padding: 24px;
        margin-top: 32px;
        border-radius: 12px;
        box-shadow: rgba(0, 0, 0, 0.12) 0px 6px 16px;
        border: 1px solid rgb(221, 221, 221);
        position: sticky;
        top: 32px;
      }

      .screens-chat-send_host__first_info {
        padding-bottom: 32px;
      }

      .screens-chat-send_host__first_info_title {
        padding-bottom: 16px;

      }

      .screens-chat-send_host__first_info_content {
        margin-left: 20px;
      }

      .screens-chat-send_host__second_info {
        padding-bottom: 32px;
      }

      .screens-chat-send_host__second_info_title {
        padding-bottom: 16px;
      }

      .screens-chat-send_host__second_info_content {
        margin-left: 20px;
      }

      .screens-chat-send_host__third_info {
        padding-bottom: 32px;
      }

      .screens-chat-send_host__third_info_title {
        padding-bottom: 16px;
      }

      .screens-chat-send_host__third_info_content {
        margin-left: 20px;
      }

      /*--------------------------------------*/


      .screens-chat-send_host__send_message {
        color: inherit;
        display: block;
        min-width: 100%;
        max-width: 100%;
        min-height: 20%;
        outline: none;
        margin: 0px;
        box-sizing: border-box;
        background-color: transparent;
        appearance: none;
        resize: none;


      }

      .screens-chat-send_host__send_message_button {
        padding: 13px 23px;
        padding-top: 13px;
        padding-right: 23px;
        padding-bottom: 13px;
        padding-left: 23px;
        border-radius: 10px;
        background-color: #ffffff;
        background: inherit;
        border: none;
        box-shadow: none;
        border-radius: 0;
        padding: 0;
        overflow: visible;
        cursor: pointer;
      }

      .screens-chat-send_host__send_message_button_btn {
        width: 100%;
        background: #FFFFFF;
        color: #222222;
        padding: 15px;
        border-radius: 8px;
        border: 1px solid #222222;
      }

      .screens-chat-send_host__send_message_button-shrink {
        transition: 0.1s;
      }

      .screens-chat-send_host__send_message_button-shrink:active {
        transform: scale(0.97);
      }


    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="contact_host__wrapper">
    <div class="screens-chat-send_host__section-1">

        <div class="screens-chat-send_host__section-1__room-info">
            <div class="screens-room-roomDetail__padding-content screens-chat-send_host__section-1__room-info__info-1">
                <div class="screens-chat-send_host__section-1__info-1__desc">
                    <div class="screens-room-roomDetail__font-title screens-chat-send_host__section-1__info-1__desc1">
                        ${host.user_name} 님에게 연락하기
                    </div>


                    <div style="--gp-section-max-width: 1120px;">
                        <div style="--maxWidth: 1120px;">
                            <div data-plugin-in-point-id="CONTACT_HOST_OVERVIEW"
                                 data-section-id="CONTACT_HOST_OVERVIEW"
                                 style="padding-top: 16px; padding-bottom: 32px;">
                            </div>
                        </div>
                    </div>

                    <div class="screens-chat-send_host__send_message">
                        <div class="screens-chat-send_host__first_info">
                            <h3 tabindex="-1"
                                class="screens-chat-send_host__first_info_title"
                                elementtiming="LCP-target">
                                <div>찾아가기</div>
                            </h3>
                            <ul class="screens-chat-send_host__first_info_content">
                                <li>• 이 숙소의 체크인 시간은 오후 3:00부터입니다이며, 체크아웃은 오전 11:00입니다.</li>
                            </ul>
                        </div>

                        <div class="screens-chat-send_host__second_info">
                            <h3 tabindex="-1"
                                class="screens-chat-send_host__second_info_title"
                                elementtiming="LCP-target">
                                <div>숙소 세부 정보 및 이용 규칙</div>
                            </h3>
                            <ul class="screens-chat-send_host__second_info_content">
                                <li>• 흡연 금지. 파티나 이벤트 금지. 반려동물 동반 불가.</li>
                            </ul>
                        </div>

                        <div class="screens-chat-send_host__third_info">
                            <h3 tabindex="-1"
                                class="screens-chat-send_host__third_info_title">
                                <div>요금 설정 및 예약 가능 여부</div>
                            </h3>
                            <ul class="screens-chat-send_host__third_info_content">
                                <li>• 일주일 이상 숙박하시면 10% 할인이, 한 달 이상 숙박하시면 15% 할인이 적용됩니다.</li>
                                <li>• 체크인 24시간 전까지 예약을 취소하면 전액이 환불됩니다. 그 이후로는 체크인 전에 취소할 경우, 첫 1박
                                    요금과 서비스 수수료를 제외한 전액이 환불됩니다.
                                </li>
                            </ul>
                        </div>

                    </div>

                    <div data-plugin-in-point-id="MESSAGE_HOST_TITLE"
                         data-section-id="MESSAGE_HOST_TITLE"
                         style="padding-top: 32px; padding-bottom: 16px;">
                        <section>
                            <h2 tabindex="-1"
                                class="">질문이 더 있으신가요? 호스트에게 메시지를 보내
                                문의하세요.</h2>
                        </section>
                    </div>
                    <div>
                        <div data-pageslot="true"
                             style="">
                            <div style="--gp-section-max-width: 1120px;">
                                <div style="--maxWidth: 1120px;">
                                    <div data-plugin-in-point-id="TEXT_AREA"
                                         data-section-id="TEXT_AREA"
                                         style="padding-bottom: 16px;">
                                        <div id="textarea-error"><span
                                                class="send_text_box_essential"></span>
                                        </div>
                                        <div dir="ltr">
                                                <textarea
                                                        aria-describedby="textarea-error"
                                                        aria-required="true"
                                                        name="msg"
                                                        class="screens-chat-send_host__send_message form-control col-sm-8"
                                                        id="msgi"
                                                        style="height: 116px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div data-section-id="SEND_MESSAGE_BUTTON"
                             style="padding-bottom: 32px;">
                            <div class=" dir dir-ltr">
                                <button onclick="insertChat();" data-testid="send-message-button"
                                        type="button"
                                        class="send col-sm-4 btn btn-secondary screens-chat-send_host__send_message_button screens-chat-send_host__send_message_button_btn screens-chat-send_host__send_message_button-shrink">
                                    메시지 전송하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <%--                <div class="screens-chat-send_host__section-1__reservation">--%>
                <%--  TODO : 주중 주말 가격과 숙박 일정설정에 따른 총합계 구현  --%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-1">--%>
                <%--                        <div class="screens-room-roomDetail__reservation__price">--%>
                <%--                            <span class="screens-room-roomDetail__price__part-1">₩ ${room.room_weekday_price}</span>--%>
                <%--                            <span class="screens-room-roomDetail__price__part-2">/박 (주중)</span>--%>
                <%--                        </div>--%>
                <%--                        <div class="screens-room-roomDetail__reservation__info">--%>
                <%--                            <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__check-in-out">--%>
                <%--                                <div class="screens-room-roomDetail__check-in-out">--%>
                <%--                                    <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">--%>
                <%--                                        체크인--%>
                <%--                                    </div>--%>

                <%--                                    <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2"--%>
                <%--                                         id="check-in-button">--%>
                <%--                                        YYYY-MM-DD--%>
                <%--                                    </div>--%>
                <%--                                    <input type="hidden" name="booking_checkin_date">--%>
                <%--                                </div>--%>
                <%--                                <div class="screens-room-roomDetail__check-in-out">--%>
                <%--                                    <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc1">--%>
                <%--                                        체크아웃--%>
                <%--                                    </div>--%>

                <%--                                    <div class="screens-room-roomDetail__check-in-out__desc screens-room-roomDetail__check-in-out__desc2"--%>
                <%--                                         id="check-out-button">--%>
                <%--                                        YYYY-MM-DD--%>
                <%--                                    </div>--%>
                <%--                                    <input type="hidden" name="booking_checkout_date">--%>
                <%--                                </div>--%>
                <%--                            </button>--%>
                <%--                            <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__number-people">--%>
                <%--                                <div class="screens-room-roomDetail__number-people__desc">--%>
                <%--                                    <div class="screens-room-roomDetail__number-people__desc1">--%>
                <%--                                        인원--%>
                <%--                                    </div>--%>
                <%--                                    <span>게스트</span>--%>
                <%--                                    <span class="screens-room-roomDetail__number-people__desc2"--%>
                <%--                                          id="totalGuest-button">1--%>
                <%--                            </span>--%>
                <%--                                    <span>명</span>--%>
                <%--                                    <input type="hidden" name="booking_num_of_guest">--%>
                <%--                                    <input type="hidden" name="room_max_capa"--%>
                <%--                                           value="${room.room_max_capa}">--%>
                <%--                                    <input type="hidden" name="room_standard_capa"--%>
                <%--                                           value="${room.room_standard_capa}">--%>
                <%--                                </div>--%>
                <%--                                <div class="screens-room-roomDetail__number-people__arrow">--%>
                <%--                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"--%>
                <%--                                         aria-hidden="true" role="presentation"--%>
                <%--                                         focusable="false"--%>
                <%--                                         style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;">--%>
                <%--                                        <path fill="none"--%>
                <%--                                              d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path>--%>
                <%--                                    </svg>--%>
                <%--                                </div>--%>
                <%--                            </button>--%>
                <%--                            <div class="screens-room-roomDetail__number-people-toggle">--%>
                <%--                                <span class="screens-room-roomDetail__toggle-part-1">성인</span>--%>
                <%--                                <div class="screens-room-roomDetail__toggle-part-2">--%>
                <%--                                    <button type="button"--%>
                <%--                                            class="screens-room-roomDetail__toggle-btn-minus disable">--%>
                <%--                                        <svg viewBox="0 0 12 12"--%>
                <%--                                             xmlns="http://www.w3.org/2000/svg"--%>
                <%--                                             aria-hidden="true"--%>
                <%--                                             role="presentation" focusable="false"--%>
                <%--                                             style="display: block; height: 12px; width: 12px; fill: #717171;">--%>
                <%--                                            <path d="m.75 6.75h10.5v-1.5h-10.5z"></path>--%>
                <%--                                        </svg>--%>
                <%--                                    </button>--%>
                <%--                                    <input type="text"--%>
                <%--                                           class="screens-room-roomDetail__toggle-num"--%>
                <%--                                           name="toggle-people-num" value='1' readonly/>--%>
                <%--                                    <button type="button"--%>
                <%--                                            class="screens-room-roomDetail__toggle-btn-plus">--%>
                <%--                                        <svg viewBox="0 0 12 12"--%>
                <%--                                             xmlns="http://www.w3.org/2000/svg"--%>
                <%--                                             aria-hidden="true"--%>
                <%--                                             role="presentation" focusable="false"--%>
                <%--                                             style="display: block; height: 12px; width: 12px; fill: #717171;">--%>
                <%--                                            <path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path>--%>
                <%--                                        </svg>--%>
                <%--                                    </button>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div>--%>
                <%--                            <button class="screens-room-roomDetail__btn screens-room-roomDetail__reservation__btn screens-room-roomDetail__btn-shrink"--%>
                <%--                                    id="submit-button"--%>
                <%--                                    value="${room.room_id}">--%>
                <%--                                예약하기--%>
                <%--                            </button>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-2">--%>
                <%--                        예약 확정 전에는 요금이 청구되지 않습니다.--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-3">--%>
                <%--                        <span class="screens-room-roomDetail__reservation__part-3__mul">₩ <span>${room.room_weekday_price}</span> X <span>0</span>박 (주중)</span>--%>
                <%--                        <span>₩ 0</span>--%>
                <%--                        <input type="hidden" value="${room.room_weekday_price}">--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-4">--%>
                <%--                        <span class="screens-room-roomDetail__reservation__part-4__mul">₩ <span>${room.room_weekend_price}</span> X <span>0</span>박 (주말)</span>--%>
                <%--                        <span>₩ 0</span>--%>
                <%--                        <input type="hidden" value="${room.room_weekend_price}">--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-5">--%>
                <%--                        <span class="screens-room-roomDetail__reservation__part-5__mul">₩ <span>${room.room_extra_person_fee}</span> X <span>0</span>명 (추가인원) X <span>0</span>박 </span>--%>
                <%--                        <span>₩ 0</span>--%>
                <%--                        <input type="hidden" value="${room.room_extra_person_fee}">--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-room-roomDetail__reservation__part-6">--%>
                <%--                        <span class="screens-room-roomDetail__reservation__part-6__mul">합계</span>--%>
                <%--                        <span>₩ 0 </span>--%>
                <%--                        <input type="hidden" name="booking_price_sum">--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="screens-room-roomDetail__bookingDates">--%>
                <%--                    <c:forEach var="bookingDto" items="${bookingDtos}">--%>
                <%--                        <div class="screens-room-roomDetail__bookingDate">--%>
                <%--                            <input type="hidden" value="${bookingDto.booking_checkin_date}">--%>
                <%--                            <input type="hidden" value="${bookingDto.booking_checkout_date}">--%>
                <%--                        </div>--%>
                <%--                    </c:forEach>--%>
                <%--                </div>--%>
                <%--                </div>--%>

            </div>
        </div>
    </div>
</div>
</div>
<%--<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>

<script src="/resources/js/room/roomDetail.js"></script>

<script>
  var client;
  var user_id = "<%= request.getAttribute("user_id") %>";
  var chat_room_id = "<%= request.getAttribute("chat_room_id") %>";

  //채팅 저장
  function insertChat() {

    var user_id = "${user_id}";
    var chat_room_id = "${chat_room_id}";
    var chat_ctt = $("#msgi").val();

    // 서버로 전송할 데이터를 객체화
    var insertChatDto = {
      user_id: user_id,
      chatting_room_id: chat_room_id,
      chat_ctt: chat_ctt
    };

    $.ajax({
      url: "/chat/insertChat.do",
      type: "post",
      data: JSON.stringify(insertChatDto),
      contentType: "application/json",
      success: function (result) {

        if (result == 1) {
          alert("메시지가 전송되었습니다. 메시지함을 확인하세요");
          var msgInput = document.getElementById('msgi');

          msgInput.value = '';
        }
      },
      error: function (xhr, status, err) {
        console.log("처리실패!");
        console.log(xhr);
        console.log(status);
        console.log(err);
      }
    });
  }

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


</body>

</html>
