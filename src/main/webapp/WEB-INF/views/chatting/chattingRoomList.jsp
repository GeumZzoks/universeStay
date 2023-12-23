<%--
  Created by IntelliJ IDEA.
  User: beautiflow
  Date: 12/19/23
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
    <title>채팅창</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>

      /*.ico_btn_search::before {*/
      /*  간다ㅏ라마바사;*/

      /*}*/

      .screens-chat-chattingRoomPage * {
        margin: 0;
        padding: 0;
      }

      .screens-chat-chattingRoomPage > section * {
        box-sizing: border-box;
        margin: 0px;
      }

      .screens-chat-chattingRoomPage__section::after {
        width: 100vw;
        height: calc(100vh - 100px);
        position: absolute;
        top: 100px;
        left: 0;
      }

      .screens-chat-chattingRoomPage__container {
        position: relative;
        left: 0;
        top: 0;
        width: 100%;
        height: calc(100vh - 100px);
        display: flex;
        flex-direction: row;
      }

      .screens-chat-chattingRoomPage__container > div {
        border-right: 1px solid #EBEBEB;
        display: flex;
        flex-direction: column;
      }

      .screens-chat-chattingRoomPage__container__div1 {
        flex-basis: 25%;

      }

      .screens-chat-chattingRoomPage__container__div2 {
        flex-basis: 70%;
      }

      .screens-chat-chattingRoomPage__container__div3 {
        flex-basis: 25%;
      }

      .screens-chat-chattingRoomPage__container__divx-1 {
        flex-basis: 10%;
        border-bottom: 1px solid #EBEBEB;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        font-family: 'NotoSansKR-Bold';
        font-size: 1.15rem;
        height: 70.9px;
        width: 373px;
      }

      .screens-chat-chattingRoomPage__container__divx-2 {
        flex-basis: 100%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        overflow: auto;
      }

      .screens-chat-chattingRoomPage__container__divx-1 > div:first-child {
        width: 90%;
        display: flex;
        flex-direction: row;
      }

      .screens-chat-chattingRoomPage__container__div1 > div:nth-child(2) > div:first-child,
      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:first-child {
        width: 90%;
        display: flex;
        flex-direction: column;
      }

      .screens-chat-chattingRoomPage__container__div2 > div:nth-child(2) > div:first-child {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: end;
      }

      .screens-chat-chattingRoomPage__container__div2 > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) {
        width: 97%;
      }

      .screens-chat-chattingRoomPage__container__divx-1 > div:first-child > div:first-child {
        flex-basis: 90%;
      }

      .screens-chat-chattingRoomPage__container__divx-1 > div:first-child > div:last-child {
        flex-basis: 10%;
      }

      .screens-chat-chattingRoomPage__container__divx-1 img {
        width: 1.2rem;
      }

      .screens-chat-chattingRoomPage__container__div2 > div:nth-child(2) > div:first-child > div:first-child {
        flex-basis: 95%;
        overflow: auto;
        padding-top: 1rem;
        padding-bottom: 1rem;
      }

      .screens-chat-chattingRoomPage__container__div2 > div:nth-child(2) > div:first-child > div:last-child {
        flex-basis: 5%;
        width: 100%;
        height: 100%;
      }

      .screens-chat-chattingRoomPage__container__form {
        align-items: stretch;
        width: 100%;
        height: 98%;
        margin-bottom: 100px;
      }

      .screens-chat-chattingRoomPage__container__form > input:first-child {
        height: 97%;
        width: 93%;
        border: 1px solid #EBEBEB;
      }

      .screens-chat-chattingRoomPage__container__form > input:last-child {
        height: 97%;
        width: 6%;
        align-items: end;
        border: 1px solid #EBEBEB;
      }

      .screens-chat-chattingRoomPage__container__div1 > div:nth-child(2) > div:nth-child(1) > div {
        /*background-color: #EBEBEB;*/
        border-radius: 12px;
        padding: 1rem;
        margin-top: 1rem;
        display: flex;
        flex-direction: row;
      }

      .screens-chat-chattingRoomPage__container__div1 > div:nth-child(2) > div:nth-child(1) > div > div:first-child {
        /*flex: 1;*/
      }

      .screens-chat-chattingRoomPage__container__div1 > div:nth-child(2) > div:nth-child(1) > div > div:last-child {
        /*flex: 3;*/
        padding-left: 1rem;
        word-break: break-all;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      .screens-chat-chattingRoomPage__container__div1 > div:nth-child(2) > div:nth-child(1) > div > div:first-child > img {
        border-radius: 50px;
        background-color: white;
        width: 4rem;
        height: 4rem;
      }

      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div {
        /*background-color: #EBEBEB;*/
        /*border-radius: 12px;*/
        padding: 1rem;
        margin-top: 1rem;
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #EBEBEB;

      }

      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div > div:first-child {
        /*flex: 1;*/
      }


      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div > div:last-child {
        /*flex: 3;*/
        padding-left: 1rem;
        word-break: break-all;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div > div:first-child > img {
        border-radius: 50px;
        background-color: white;
        width: 2rem;
        height: 2rem;
      }

      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div > div:last-child > div:first-child {
        font-family: 'NotoSansKR-Bold';
      }

      .screens-chat-chattingRoomPage__container__div3 > div:nth-child(2) > div:nth-child(1) > div > div:last-child > div:last-child {
        margin-top: 0.8rem;
        font-size: 0.9rem;
      }

      .screens-chat-chattingRoomPage__chat_list:hover {
        background-color: #DDDDDD;
        /* 다른 스타일을 추가하거나 변경할 수 있습니다. */
      }

      .screens-chat-chattingRoomPage__chat_list {
        border-radius: 12px;
        padding: 1rem;
        margin-top: 1rem;
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
      }

      .screens-chat-chattingRoomPage__chatRoomList {
        height: calc(100vh - 172px);
        overflow-y: scroll;
      }

      .screens-chat-chattingRoomPage__chatWrap {
        color: #222222;
      }

      .chat_message_item {
        margin-top: 10px;
        margin-left: 30px;
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        margin-right: 30px;

      }

      .chat_message_item:hover {
        background-color: #DDDDDD;
        border-radius: 15px;
        margin-right: 30px;

      }


    </style>
</head>
<body class="screens-chat-chattingRoomPage">
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="screens-chat-chattingRoomPage__section">
    <div class="screens-chat-chattingRoomPage__container">
        <div class="screens-chat-chattingRoomPage__container__div1">
            <div class="screens-chat-chattingRoomPage__container__divx-1">
                <div>
                    <div>메시지</div>
                    <div>
                        <img class="screens-chat-chattingRoomPage__container__div1-filtermark"
                             src="/resources/img/symbol/filter_km.svg">
                    </div>
                </div>
            </div>
            <div class="screens-chat-chattingRoomPage__container__divx-2">
                <div>
                    <c:forEach var="chatRoom" items="${chatRoomList}">
                        <input style="display: none" name="chat_room_id"
                               value="${chatRoom.chatting_room_id}">

                        <c:set var="user_name" value="${chatRoom.user_name}"/>
                        <c:set var="chat_ctt" value="${chatRoom.chat_ctt}"/>
                        <c:set value="${chatRoom.chat_date}"
                               var="chat_date"/>
                        <c:set var="profile_img" value="${chatRoom.profile_img_url}"/>
                        <c:set var="chat_room_id" value="${chatRoom.chatting_room_id}"/>
                        <form id="chatForm" action="/enter/chattingRoomList/${chat_room_id}"
                              method="get">
                            <div class="screens-chat-chattingRoomPage__chat_list"
                                 id="chatListItem"
                                 data-chat-room-id="${chatRoom.chatting_room_id}"
                                 data-room-id="${chatRoom.room_id}"
                                 style="text-align: center; margin-top: 20px; margin-left: 10px; border-radius: 10px;">
                                <div>
                                    <div><img src="${profile_img}"
                                              style="width: 50px; height: 50px; border-radius: 50%;">
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <div style="margin-top: 5px;">
                                            <p>${user_name}</p>
                                        </div>
                                        <div style="margin-top: 5px;">
                                            <p>${chat_ctt}</p>
                                        </div>
                                        <div style="margin-top: 5px;">
                                            <p>${chat_date}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="screens-chat-chattingRoomPage__container__div2">

            <div class="screens-chat-chattingRoomPage__container__divx-2">

            </div>
        </div>
    </div>
    </div>
</section>
</body>

<script src="/resources/js/chat/chat.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/sockjs.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- moment()함수 -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>

  var client;
  var user_id2 = "<%= request.getAttribute("user_id") %>";
  var chat_room_id2 = "<%= request.getAttribute("chat_room_id") %>";

  $(document).ready(function () {
    $('.screens-chat-chattingRoomPage__chat_list').click(function () {
      var chatting_room_id = $(this).data('chat-room-id');
      var room_id = $(this).data('room-id');
      location.href = '/enter/chattingRoomList/' + chatting_room_id + '?room_id='
          + room_id;
    });
  });

</script>

</html>

