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
        width: 92%;
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
        margin-left: 70px;
        height: 97%;
        width: 80%;
        border: 1px solid #F48475;
        border-radius: 5px;

      }

      .screens-chat-chattingRoomPage__container__form > input:last-child {
        height: 97%;
        width: 6%;
        align-items: end;
        background-color: #F48475;
        border: 1px solid #F48475;
        border-radius: 5px;

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
        background-color: #f9B1A7;
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
        width: 85%;

      }

      .chat_message_item:hover {
        background-color: #f9B1A7;
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
                        <c:set var="chat_date" value="${chatRoom.chat_date}"/>
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
            <div class="screens-chat-chattingRoomPage__container__divx-1">
                <div>
                    <c:set var="loggedInUserId" value="${requestScope.user_id}"/>
                    <c:forEach var="whoChat" items="${twoUsername}">
                        <c:choose>
                            <c:when test="${loggedInUserId eq whoChat.user_id_1}">
                                <span>${whoChat.user_name_2}님과의 대화</span>
                            </c:when>
                            <c:otherwise>
                                <span>${whoChat.user_name_1}님과의 대화</span>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
            <div class="screens-chat-chattingRoomPage__container__divx-2">
                <div>
                    <div>
                        <div class="screens-chat-chattingRoomPage__chatWrap" id="messageContainer"
                             style="height: 700px; overflow-y: scroll;">

                            <div class="content chatcontent " data-room-no="${chat_room_id}"
                                 data-member="${user_name}">

                                <div id="list-guestbook" class="">
                                    <c:forEach items="${firstList}" var="chatMessage">
                                        <div class="chat_message_item" style="margin-bottom: 20px;">
                                            <div style="display: flex; align-items: center;">
                                                <div>
                                                    <img src="${chatMessage.profile_img_url}"
                                                         style="width: 30px; height: 30px; border-radius: 50%;">
                                                </div>
                                                <div style="margin-left: 10px;">
                                                    <strong>${chatMessage.user_name}님</strong>
                                                    <div class="me">
                                                        <p class="myChat text-left p-2">${chatMessage.chat_ctt}</p>

                                                        <p style="display: inline;">${chatMessage.chat_date}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-fixK" style="margin-bottom: 30px;">
                        <div id="alertK" onclick="moveDown();" class="alert alert-success"
                             role="alert">
                            <div class="screens-chat-chattingRoomPage__container__form">
                                <input type="text" name="msg" id="msgi"
                                       onkeydown="checkEnter(event);">
                                <input type="button" id="send"
                                       class="send col-sm-4 btn btn-secondary"
                                       onclick="sendmsg(); moveDown()"
                                       value="전송">
                            </div>
                        </div>
                    </div>
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

  //채팅 저장
  function insertChat() {

    var user_id = "${user_id}";
    var chat_room_id = chat_room_id2;
    var chat_ctt = $("#msgi").val();

    if (!chat_ctt) {
      alert("메시지 입력 후 전송하세요");
      return;
    }

    // 서버로 전송할 데이터를 객체화
    var insertChatDto = {
      user_id: user_id,
      chatting_room_id: chat_room_id2,
      chat_ctt: chat_ctt
    };

    $.ajax({
      url: "/chat/insertChat.do",
      type: "post",
      data: JSON.stringify(insertChatDto),
      contentType: "application/json",
      success: function (result) {

        if (result == 1) {
          console.log("채팅 전송 성공");
          var messageInput = $('textarea[name="msg"]');
          client.send('/app/hello/' + chat_room_id,
              function (error) {
                console.error("error message = " + error);
              }
          );
          messageInput.val('');
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

  // function moveDown() {
  //   $(".chat_ctt").scrollTop($(".chat_ctt")[0].scrollHeight);
  //   // $('#alertK').css('display', 'none');
  //
  // }
  function moveDown() {
    var chatWrap = $(".screens-chat-chattingRoomPage__chatWrap");
    chatWrap.scrollTop(chatWrap[0].scrollHeight);
  }

  // 실시간 채팅 내용 렌더링
  var renderList = function (contentDto) {
    // 리스트 html을 정의
    //var date = moment(contentDto.chat_date).format('YY/MM/DD HH:mm');
    var originalDate = moment(contentDto.chat_date);
    var newDate = originalDate.add(9, 'hours');
    var formattedDate = newDate.format('YY/MM/DD HH:mm');

    console.log(formattedDate);

    var html = "";

    content = "<p class='otherChat bg-light p-2'>" + contentDto.chat_ctt
        + "</p>";

    var html = "<div class='chat_message_item' style='margin-bottom: 20px;'>" +
        "<div style='display: flex; align-items: center;'>" +
        "<div>" +
        "<img src='" + contentDto.profile_img_url
        + "' style='width: 30px; height: 30px; border-radius: 50%;'>" +
        "</div>" +
        "<div style='margin-left: 10px;'>" +
        "<strong>" + contentDto.user_name + "님</strong>" +
        "<div class='me'>" +
        content +
        "<p style='display: inline;'>" + formattedDate + "</p>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>";

    return html;

  }
  let messageInput = '';
  $(function () {
    messageInput = $('textarea[name="msg"]');
    var sock = new SockJS(
        "/endpoint");
    client = Stomp.over(sock);

    client.connect({}, function () {
      var chat_room_id = chat_room_id2;

      // 메세지 들어오는곳
      client.subscribe('/subscribe/chat/' + chat_room_id,
          function (chatMessage) {
            //받은 데이터
            var contentDto = JSON.parse(chatMessage.body);

            var html = renderList(contentDto);
            $("#list-guestbook").append(html);
            moveDown();
          });
    });

    //	         대화시
    $('.send').click(function () {
      sendmsg();
      var msgInput = document.getElementById('msgi');

      msgInput.value = '';
    });

    // $('.send').onkeydown(function () {
    //   sendmsg();
    //   var msgInput = document.getElementById('msgi');
    //
    //   msgInput.value = '';
    // });

    //채팅창 떠날시에
    function disconnect() {
      if (client != null) {
        client.disconnect();
      }
    }

    window.onbeforeunload = function (e) {
      disconnect();
    }

    // function closeConnection() {
    //   sock.close();
    // }

  });

  $(document).ready(function () {
    $('.screens-chat-chattingRoomPage__chat_list').click(function () {
      var chatting_room_id = $(this).data('chat-room-id');
      var room_id = $(this).data('room-id');
      location.href = '/enter/chattingRoomList/' + chatting_room_id + '?room_id='
          + room_id;
    });
  });

  function addNewMessage(message) {
    var messageContainer = document.getElementById('messageContainer');

    // Add your new message to the container
    var newMessageElement = document.createElement('div');
    newMessageElement.textContent = message;
    messageContainer.appendChild(newMessageElement);

    // Scroll to the bottom by focusing on the newly added element
    newMessageElement.scrollIntoView({behavior: 'smooth', block: 'end'});
  }

  function checkEnter(event) {
    console.log(event);
    if (event.key === 'Enter') {
      sendmsg();
      const msgInput = document.getElementById('msgi');
      msgInput.value = '';
    }
  }

  function sendmsg() {
    var message = messageInput.val();
    if (message == "") {
      return false;
    }
    insertChat();
  }
</script>

</html>

