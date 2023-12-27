<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-18
  Time: 오후 4:12
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
    <title>User 문의사항</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- SockJS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
    <!-- STOMP -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <style>
      .screens-inquiry-flex-row {
        display: flex;
        flex-direction: row;
      }

      .screens-inquiry-flex-column {
        display: flex;
        flex-direction: column;
      }

      .screens-inquiry-userInquiry {
        width: 100vw;
        height: 100vh;
      }

      .screens-inquiry-userInquiry * {
        margin: 0;
        padding: 0;
      }

      .screens-inquiry-userInquiry > section,
      .screens-inquiry-userInquiry > section * {
        box-sizing: border-box;
        margin: 0px;
      }

      .screens-inquiry-userInquiry__section {
        position: absolute;
        top: 100px;
        width: 100%;
        height: calc(100% - 100px);
        border-top: 1px solid #EBEBEB;
      }

      .screens-inquiry-userInquiry__section > div {
        border-right: 1px solid #EBEBEB;
      }

      .screens-inquiry-userInquiry__inquiryList {
        width: 25%;
      }

      .screens-inquiry-userInquiry__inquiryMessage {
        width: 50%;
      }

      .screens-inquiry-userInquiry__inquiryEtc {
        width: 25%;
      }

      .screens-inquiry-userInquiry-headDiv {
        height: 7%;
        border-bottom: 1px solid #EBEBEB;
      }

      .screens-inquiry-userInquiry-bodyDiv {
        height: 93%;
      }


      .screens-inquiry-userInquiry__inquiryList__head__content > div > img {
        height: 1.3rem;
        width: 1.3rem;
      }

      .screens-inquiry-userInquiry__inquiryList-imgDiv > img {
        width: 5rem;
        height: 5rem;
      }

      .screens-inquiry-userInquiry__inquiryMessage-imgDiv > img {
        width: 5rem;
        height: 5rem;
      }

      .screens-inquiry-userInquiry__inquiryEtc-imgDiv > img {
        width: 5rem;
        height: 5rem;
      }

      .screens-inquiry-userInquiry__inquiryMessage__body__content__messageList {
        overflow: auto;
      }

      .screens-inquiry-userInquiry__inquiryMessage__body__content {
        /*width: 50%;*/
      }


      /*overflow: auto;*/
      /*align-items: end;*/
      /*word-break: break-all;*/
      /*border-radius: 50px;*/
      /*font-family: 'NotoSansKR-Bold';*/
    </style>
</head>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<body class="screens-inquiry-userInquiry">
<section class="screens-inquiry-userInquiry__section screens-inquiry-flex-row">
    <div class="screens-inquiry-userInquiry__inquiryList screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryList__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryList__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-text"><p>문의사항
                    목록</p></div>
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-plustmark"><img
                        src="/resources/img/symbol/plus-svgrepo-com.svg"></div>
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-filtermark"><img
                        src="/resources/img/symbol/filter_km.svg"></div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryList__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-column">
            <div class="screens-inquiry-userInquiry__inquiryList__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom screens-inquiry-flex-row">
                    <div class="screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryList-imgDiv"><img
                                src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    </div>
                    <div class="screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원 팀</p></div>
                        <div><p>이 채팅방의 마지막 메시지</p></div>
                        <div><p>메시지 보낸 시간 </p></div>
                    </div>
                </div>
                <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom screens-inquiry-flex-row">
                    <div class="screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryList-imgDiv"><img
                                src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    </div>
                    <div class="screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원 팀</p></div>
                        <div><p>이 채팅방의 마지막 메시지</p></div>
                        <div><p>메시지 보낸 시간 </p></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="screens-inquiry-userInquiry__inquiryMessage screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryMessage__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryMessage__head__content-text"><p>
                    UNIVERSESTAY 고객지원 팀</p>
                </div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryMessage__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__messageList screens-inquiry-flex-column">
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-left screens-inquiry-flex-row">
                            <div class="screens-inquiry-userInquiry__inquiryMessage-imgDiv"><img
                                    src="" alt="프로필사진">
                            </div>
                        </div>
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-right screens-inquiry-flex-column">
                            <div><p>작성자</p></div>
                            <div><p>메시지내용</p></div>
                            <div><p>시간</p></div>
                        </div>
                    </div>
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-left screens-inquiry-flex-row">
                            <div class="screens-inquiry-userInquiry__inquiryMessage-imgDiv"><img
                                    src="" alt="프로필사진">
                            </div>
                        </div>
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-right screens-inquiry-flex-column">
                            <div><p>작성자</p></div>
                            <div><p>메시지내용</p></div>
                            <div><p>시간</p></div>
                        </div>
                    </div>
                </div>
                <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__inputcontainer screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__inputbody screens-inquiry-flex-row">
                        <div><input type="text" name="message"
                                    class="screens-inquiry-userInquiry-sendText"></div>
                        <div><input type="submit" value="전송"
                                    class="screens-inquiry-userInquiry-sendBtn"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="screens-inquiry-userInquiry__inquiryEtc screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryEtc__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryEtc__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-flex-row">
                    <div><p>세부 내용</p></div>
                </div>
                <div class="screens-inquiry-flex-row">
                    <div><img class="screens-inquiry-userInquiry__inquiryEtc__head__xmark"
                              src="/resources/img/symbol/x_mark_km.svg"></div>
                </div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryEtc__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryEtc__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryEtc-imgDiv screens-inquiry-flex-row">
                        <img
                                src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    <div class="screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원팀</p></div>
                        <div><p>글씨123123123</p></div>
                    </div>
                </div>
                <div class="screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryEtc-imgDiv screens-inquiry-flex-row">
                        <img
                                src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    <div class="screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원팀</p></div>
                        <div><p>글씨123123123</p></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    const ChattingRoomList = document.querySelector(
            '.screens-inquiry-userInquiry__inquiryList__body__content');
    const ChattingRoom = document.querySelector(
            '.screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom');
    const copiedChattingRoom = ChattingRoom.cloneNode(true);

    const ChattingMessageList = document.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__messageList');
    const ChattingMessage = document.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__message');
    const copiedChattingMessage = ChattingMessage.cloneNode(true);

    const inputText = document.querySelector('.screens-inquiry-userInquiry-sendText');
    const inputBtn = document.querySelector('.screens-inquiry-userInquiry-sendBtn');

    let socket;
    let stompClient;
    let chatting_room_id;

    socket = new SockJS("/endpoint");
    // webSocket을 다루는데 stomp로 다루겠다!
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log("Connected: " + frame);
        stompClient.subscribe('subscribe/inquiry/' + chatting_room_id, function (receivedData) {
            console.log('receivedData - out');
            console.log(receivedData);
            // var Dto = JSON.parse(chatting)
        })
    })

    $(function () {
        function connect() {
            // 브라우저와 서버 간의 핸드쉐이크, 이 때부터 socket 통신도 가능
            socket = new SockJS("/endpoint");
            // webSocket을 다루는데 stomp로 다루겠다!
            stompClient = Stomp.over(socket);

            stompClient.connect({}, function (frame) {
                console.log("Connected: " + frame);
                stompClient.subscribe('subscribe/inquiry/' + chatting_room_id,
                        function (receivedData) {
                            console.log('receivedData - in');
                            console.log(receivedData);
                            // var Dto = JSON.parse(chatting)
                        })
            })
        }
    })

    window.onload = function () {
        firstPageAjax();
    };

    function emptyChattingRoomList() {
        if (ChattingRoomList) {
            while (ChattingRoomList.firstChild) {
                ChattingRoomList.removeChild(ChattingRoomList.firstChild);
            }
        }
    }

    function emptyChattingMessageList() {
        if (ChattingMessageList) {
            while (ChattingMessageList.firstChild) {
                ChattingMessageList.removeChild(ChattingMessageList.firstChild);
            }
        }
    }

    function fillChattingRoomList(list) {
        list.forEach(function (component) {
            const cloneElement = copiedChattingRoom.cloneNode(true);
            cloneElement.querySelector(
                    '.screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom > div:nth-of-type(2) > div:nth-of-type(2) > p').textContent = component.m_chatting_ctt;
            cloneElement.querySelector(
                    '.screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom > div:nth-of-type(2) > div:nth-of-type(3) > p').textContent = component.m_created_at;
            cloneElement.addEventListener("click", function () {
                clickChattingRoomAjax(component.r_chatting_room_id);
            })
            cloneElement.addEventListener("mouseover", function () {
                cloneElement.style.backgroundColor = "black";
            })
            cloneElement.addEventListener("mouseout", function () {
                cloneElement.style.backgroundColor = ""; // 빈 문자열로 설정하여 원래 색상으로 복원
            });
            ChattingRoomList.appendChild(cloneElement);
        })
    }

    function fillChattingMessageList(list) {
        list.forEach(function (component) {
            const cloneElement = copiedChattingMessage.cloneNode(true);
            console.log(cloneElement);
            cloneElement.querySelector(
                    '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p').textContent = component.writer_id;
            cloneElement.querySelector(
                    '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(2) > p').textContent = component.chatting_ctt;
            cloneElement.querySelector(
                    '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(3) > p').textContent = component.created_at;
            ChattingMessageList.appendChild(cloneElement);
        })
    }

    function clickChattingRoomAjax(r_chatting_room_id) {
        $.ajax({
            type: 'get',
            url: "/user/myPage/inquiry/" + r_chatting_room_id,
            data: {},
            success: function (result) {
                emptyChattingMessageList();
                fillChattingMessageList(result);
                chatting_room_id = r_chatting_room_id
                console.log("clickChattingRoomAjax() 성공");
            },
            error: function () {
                console.log("clickChattingRoomAjax() 실패");
            }
        })

    }

    function firstPageAjax() {
        $.ajax({
            type: 'post',
            url: "/user/myPage/inquiry",
            data: {},
            success: function (result) {
                emptyChattingRoomList();
                emptyChattingMessageList();
                fillChattingRoomList(result);
                console.log("firstPageAjax() 성공");
            },
            error: function () {
                console.log("firstPageAjax() 실패");
            }
        })
    }

    inputBtn.addEventListener('click', function () {
        // send 함수
        // 첫번째 인자는 어디로 보낼지를 적는다.
        // 두번째 인자는 서버로 보낼 때 추가하고 싶은 stomp헤더이다. 여러개 쓸 수 있는듯?
        // 세번째 인자는 보내고 싶은 body
        console.log("123111");
        stompClient.send('/app/inquiry/' + chatting_room_id, {}, JSON.stringify(inputText.value));
        console.log("ddd");
    })

    function stompDisconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
            console.log("stompClient.disconnect() 성공")
        }
    }

    // function pressEnter(event) {
    //     if (event.key === 'Enter') {
    //         sendmsg();
    //     }
    // }
</script>
</html>
