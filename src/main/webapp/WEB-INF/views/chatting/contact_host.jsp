<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>contact_host</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
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

      .first_info {
        padding-bottom: 32px;
      }

      .first_info_title {
        padding-bottom: 16px;

      }

      .first_info_content {
        margin-left: 20px;
      }

      .second_info {
        padding-bottom: 32px;
      }

      .second_info_title {
        padding-bottom: 16px;
      }

      .second_info_content {
        margin-left: 20px;
      }

      .third_info {
        padding-bottom: 32px;
      }

      .third_info_title {
        padding-bottom: 16px;
      }

      .third_info_content {
        margin-left: 20px;
      }

      /*--------------------------------------*/


      .send_message {
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

      .send_message_button {
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

      .send_message_button_btn {
        width: 100%;
        background: #FFFFFF;
        color: #222222;
        padding: 15px;
        border-radius: 8px;
        border: 1px solid #222222;
      }

      .send_message_button-shrink {
        transition: 0.1s;
      }

      .send_message_button-shrink:active {
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
                        <div class="_1a6d9c4">
                            <div class="plmw1e5 atm_e2_1osqo2v atm_gz_1wugsn5 atm_h0_1wugsn5 atm_vy_1osqo2v mq5rv0q atm_j3_1v7vjkn dir dir-ltr"
                                 style="--maxWidth: 1120px;">
                                <div data-plugin-in-point-id="CONTACT_HOST_OVERVIEW"
                                     data-section-id="CONTACT_HOST_OVERVIEW"
                                     style="padding-top: 16px; padding-bottom: 32px;">

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="send_message">
                        <div class="first_info">
                            <h3 tabindex="-1"
                                class="first_info_title"
                                elementtiming="LCP-target">
                                <div>찾아가기</div>
                            </h3>
                            <ul class="first_info_content">
                                <li>• 이 숙소의 체크인 시간은 오후 3:00부터입니다이며, 체크아웃은 오전 11:00입니다.</li>
                            </ul>
                        </div>

                        <div class="second_info">
                            <h3 tabindex="-1"
                                class="second_info_title"
                                elementtiming="LCP-target">
                                <div>숙소 세부 정보 및 이용 규칙</div>
                            </h3>
                            <ul class="second_info_content">
                                <li>• 흡연 금지. 파티나 이벤트 금지. 반려동물 동반 불가.</li>
                            </ul>
                        </div>

                        <div class="third_info">
                            <h3 tabindex="-1"
                                class="third_info_title">
                                <div>요금 설정 및 예약 가능 여부</div>
                            </h3>
                            <ul class="third_info_content">
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
                            <div class="tu9uqg8 atm_cs_qo5vgd sgst31r atm_c8_8nb4eg atm_g3_1dpnnv7 atm_fr_11dsdeo atm_c8_8nb4eg__oggzyc atm_g3_1dpnnv7__oggzyc atm_fr_11dsdeo__oggzyc dir dir-ltr">
                                <h2 tabindex="-1"
                                    class="">질문이 더 있으신가요? 호스트에게 메시지를 보내
                                    문의하세요.</h2></div>
                        </section>
                    </div>
                    <div>
                        <%--                    <form action=""--%>
                        <div data-pageslot="true"
                             class="c1yo0219 atm_9s_1txwivl_vmtskl atm_92_1yyfdc7_vmtskl atm_9s_1txwivl_9in345 atm_92_1yyfdc7_9in345 dir dir-ltr"
                             style="">
                            <div style="--gp-section-max-width: 1120px;">
                                <div class="_1a6d9c4">
                                    <div class="plmw1e5 atm_e2_1osqo2v atm_gz_1wugsn5 atm_h0_1wugsn5 atm_vy_1osqo2v mq5rv0q atm_j3_1v7vjkn dir dir-ltr"
                                         style="--maxWidth: 1120px;">
                                        <div data-plugin-in-point-id="TEXT_AREA"
                                             data-section-id="TEXT_AREA"
                                             style="padding-bottom: 16px;">
                                            <div id="textarea-error"><span
                                                    class="send_text_box_essential"></span>
                                            </div>
                                            <div class="_pf06jz">
                                                <div dir="ltr"><textarea
                                                        aria-describedby="textarea-error"
                                                        aria-required="true"
                                                        name="msg"
                                                        class="send_message form-control col-sm-8"
                                                        id="msgi"
                                                        style="height: 116px;"></textarea>
                                                </div>
                                            </div>
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
                                        class="send col-sm-4 btn btn-secondary send_message_button send_message_button_btn send_message_button-shrink">
                                    메시지 전송하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="screens-chat-send_host__section-1__reservation">

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
                                    <div class="screens-room-roomDetail__number-people__desc1">인원
                                    </div>
                                    <div class="screens-room-roomDetail__number-people__desc2">게스트
                                        1명
                                    </div>
                                </div>
                                <div class="screens-room-roomDetail__number-people__arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                         aria-hidden="true" role="presentation" focusable="false"
                                         style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;">
                                        <path fill="none"
                                              d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path>
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
                        <span class="screens-room-roomDetail__reservation__part-3__mul">₩${room.room_weekday_price} X 7박</span>
                        <span>₩1,167,740</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

</body>

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


</html>
