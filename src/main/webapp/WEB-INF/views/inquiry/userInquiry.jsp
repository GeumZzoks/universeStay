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

        .screens-inquiry-userInquiry__inquiryList__head__content {
            flex: 1;
        }

        .screens-inquiry-userInquiry__inquiryList__head__content > div:nth-of-type(1) {
            flex: 10;
            display: flex;
            flex-direction: row;
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-userInquiry__inquiryList__head__content > div:nth-of-type(2) {
            flex: 1;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .screens-inquiry-userInquiry__inquiryList__head__content > div:nth-of-type(3) {
            flex: 1;
            display: flex;
            flex-direction: row;
            align-items: center;
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
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content {
            /*width: 50%;*/
        }

        .screens-inquiry-userInquiry__inquiryList__body__content {
            overflow: auto;
        }

        .screens-inquiry-userInquiry__inquiryMessage__head__content-text {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-userInquiry__inquiryEtc__head__content {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom-right > div:nth-of-type(1) {
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            font-size: 0.9em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom-right > div:nth-of-type(2) {
            font-size: 0.9em;
        }

        .screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom-right > div:nth-of-type(3) {
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            font-size: 0.8em;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__message {
            padding-left: 1em;
            padding-bottom: 1em;
            width: 99%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__message-right {
            width: 99%;
            text-align: left;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__messageList {
            flex: 1;
            overflow: auto;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content {
            width: 99%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputContainer {
            height: 2em;
            width: 100%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody {
            width: 100%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody > div:nth-of-type(1) {
            width: 95%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody > div:nth-of-type(2) {
            width: 5%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody > div:nth-of-type(1) > input {
            height: 100%;
            width: 100%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody > div:nth-of-type(2) > input {
            height: 100%;
            width: 100%;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p {
            font-family: 'NotoSansKR-Medium';
            font-size: 0.8em;
        }

        .screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(3) > p {
            font-size: 0.5em;
        }

    </style>
</head>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<body class="screens-inquiry-userInquiry">
<section class="screens-inquiry-userInquiry__section screens-inquiry-flex-row">
    <div class="screens-inquiry-userInquiry__inquiryList screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryList__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryList__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-text"><p>문의사항</p></div>
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-plusmark"><img
                        src="/resources/img/symbol/plus-svgrepo-com.svg"></div>
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-filtermark"><img
                        src="/resources/img/symbol/filter_km.svg"></div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryList__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-column">
            <div class="screens-inquiry-userInquiry__inquiryList__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom-left screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryList-imgDiv"><img
                                src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    </div>
                    <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom-right screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원 팀</p></div>
                        <div><p>이 채팅방의 마지막 메시지</p></div>
                        <div><p>메시지 보낸 시간 </p></div>
                    </div>
                </div>
                <%--                <div class="screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom screens-inquiry-flex-row">--%>
                <%--                    <div class="screens-inquiry-flex-row">--%>
                <%--                        <div class="screens-inquiry-userInquiry__inquiryList-imgDiv"><img--%>
                <%--                                src="/resources/img/logo/big_logo_no_bgd.png"></div>--%>
                <%--                    </div>--%>
                <%--                    <div class="screens-inquiry-flex-column">--%>
                <%--                        <div><p>UNIVERSESTAY 고객지원 팀</p></div>--%>
                <%--                        <div><p>이 채팅방의 마지막 메시지</p></div>--%>
                <%--                        <div><p>메시지 보낸 시간 </p></div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>
    <div class="screens-inquiry-userInquiry__inquiryMessage screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryMessage__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryMessage__head__content-text"><p>메세지</p>
                </div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryMessage__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__messageList screens-inquiry-flex-column">
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-left screens-inquiry-flex-row">
                            <div class="screens-inquiry-userInquiry__inquiryMessage-imgDiv">
                                <%--                                <img src="" alt="프로필사진">--%>
                            </div>
                        </div>
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-right screens-inquiry-flex-column">
                            <div><p>작성자</p></div>
                            <div><p>메시지내용</p></div>
                            <div><p>시간</p></div>
                        </div>
                    </div>
                </div>
                <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__inputContainer screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__inputBody screens-inquiry-flex-row">
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
                        <%--                        <img src="/resources/img/logo/big_logo_no_bgd.png">--%>
                    </div>
                    <div class="screens-inquiry-flex-column">
                        <%--                        <div><p>UNIVERSESTAY 고객지원팀</p></div>--%>
                        <%--                        <div><p>글씨123123123</p></div>--%>
                    </div>
                </div>
                <div class="screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryEtc-imgDiv screens-inquiry-flex-row">
                        <%--                        <img src="/resources/img/logo/big_logo_no_bgd.png">--%>
                    </div>
                    <div class="screens-inquiry-flex-column">
                        <%--                        <div><p>UNIVERSESTAY 고객지원팀</p></div>--%>
                        <%--                        <div><p>글씨123123123</p></div>--%>
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

    const createChattingRoomBtn = document.querySelector('.screens-inquiry-userInquiry__inquiryList__head__content-plusmark');
    const inputText = document.querySelector('.screens-inquiry-userInquiry-sendText');
    const inputBtn = document.querySelector('.screens-inquiry-userInquiry-sendBtn');
    const messageListElement = document.querySelector('.screens-inquiry-userInquiry__inquiryMessage__body__content__messageList');

    let socket;
    let stompClient;
    let chatting_room_id;
    let message1;

    window.onload = function () {
        firstPageAjax();
    };

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
                '.screens-inquiry-userInquiry__inquiryList__body__content__chattingRoom > div:nth-of-type(2) > div:nth-of-type(3) > p').textContent = convertTimestampmmdd(component.m_created_at);
            cloneElement.addEventListener("click", function () {
                clickChattingRoomAjax(component.r_chatting_room_id);
            })
            cloneElement.addEventListener("mouseover", function () {
                cloneElement.style.backgroundColor = "gray";
            })
            cloneElement.addEventListener("mouseout", function () {
                cloneElement.style.backgroundColor = ""; // 빈 문자열로 설정하여 원래 색상으로 복원
            });
            ChattingRoomList.appendChild(cloneElement);
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
                chatting_room_id = r_chatting_room_id;
                connectStomp();
                console.log("clickChattingRoomAjax() 성공");
            },
            error: function () {
                console.log("clickChattingRoomAjax() 실패");
            }
        })
    }

    function connectStomp() {
        if (stompClient != null) {
            stompClient.disconnect();
            console.log("기존의 stomp가 종료되었습니다.")
        }
        socket = new SockJS("/endpoint");
        // webSocket을 다루는데 stomp로 다루겠다!
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log("Connected123: " + frame);
            stompClient.subscribe('/subscribe/inquiry/' + chatting_room_id, function (receivedData) {
                console.log('receivedData123' + receivedData);
                appendChattingMessage2(receivedData);
            })
        })
    }

    function fillChattingMessageList(list) {
        list.forEach(function (component) {
            appendChattingMessage(component);
        })
        scrollDown();
    }

    function appendChattingMessage2(message) {
        const cloneElement = copiedChattingMessage.cloneNode(true);
        const parsedMessage = JSON.parse(message.body);
        const sender = parsedMessage.sender;
        const content = parsedMessage.content;

        if (sender === 'user') {
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right').style.textAlign = 'right';
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p').textContent = '';
        } else {
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right').style.textAlign = 'left';
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p').textContent = '';
        }

        cloneElement.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(2) > p').textContent = content;
        cloneElement.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(3) > p').textContent = convertTimestampmmddhhmm(new Date().getTime());
        ChattingMessageList.appendChild(cloneElement);
        scrollDown();
    }

    function appendChattingMessage(component) {
        const cloneElement = copiedChattingMessage.cloneNode(true);
        const nickname = function () {
            if (component.u_user_id != null) return '나';
            else return '고객센터';
        }
        if (nickname() === '나') {
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right').style.textAlign = 'right';
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p').textContent = '';
        } else {
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right').style.textAlign = 'left';
            cloneElement.querySelector(
                '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(1) > p').textContent = '';
        }

        cloneElement.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(2) > p').textContent = component.m_chatting_ctt;
        cloneElement.querySelector(
            '.screens-inquiry-userInquiry__inquiryMessage__body__content__message-right > div:nth-of-type(3) > p').textContent = convertTimestampmmddhhmm(component.m_created_at);
        ChattingMessageList.appendChild(cloneElement);
    }

    function saveMessage(chatting_room_id, message) {
        $.ajax({
            type: 'post',
            url: "/user/myPage/inquiry/savemessage",
            data: {
                "chatting_room_id": chatting_room_id,
                "message": message,
            },
            success: function () {
                console.log("user saveMessageAjax 성공");
            },
            error: function () {
                console.log("user saveMessageAjax 실패");
            }
        })
    }

    createChattingRoomBtn.addEventListener('click', function () {
        $.ajax({
            type: 'post',
            url: "/user/myPage/inquiry/insert",
            data: {},
            success: function () {
                firstPageAjax();
                console.log("createChattingRoomAjax 성공");
            },
            error: function () {
                console.log("createChattingRoomAjax 실패");
            }
        })
    })

    inputBtn.addEventListener('click', function () {
        sendMessage();
    })

    function sendMessage() {
        if(inputText.value === '') return;
        const message = {
            sender: 'user',
            content: inputText.value
        };

        stompClient.send('/app/inquiry/' + chatting_room_id, {}, JSON.stringify(message));
        saveMessage(chatting_room_id, inputText.value);
        inputText.value = '';
    }

    document.addEventListener("keydown", function(event) {
        if (event.key === 'Enter') {
            // querySelector를 사용하여 입력란 요소를 가져옵니다.
            const inputElement = document.querySelector('.screens-inquiry-userInquiry-sendText');

            // 입력란에 포커스가 있는지 확인합니다.
            if (document.activeElement === inputElement) {
                // querySelector를 사용하여 메시지 리스트 요소를 가져옵니다.
                // scrollDown();
                sendMessage();
            }
        }
    });

    function scrollDown() {
        // 스크롤을 제일 아래로 이동시킨다.
        messageListElement.scrollTop = messageListElement.scrollHeight;
    }

    function convertTimestampmmdd(timestamp) {
        // MySQL timestamp는 밀리초 단위이므로 초 단위로 변환
        const seconds = timestamp / 1000;

        // JavaScript Date 객체 생성
        const date = new Date(seconds * 1000);

        // 한국 시간대로 조정 (KST: UTC+9)
        date.setHours(date.getHours() + 9);

        // 년, 월, 일, 시, 분, 초 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hour = String(date.getHours()).padStart(2, '0');
        const minute = String(date.getMinutes()).padStart(2, '0');
        const second = String(date.getSeconds()).padStart(2, '0');

        // 결과 문자열 반환
        return month + '월 ' + day + '일';
    }

    function convertTimestampmmddhhmm(timestamp) {
        // MySQL timestamp는 밀리초 단위이므로 초 단위로 변환
        const seconds = timestamp / 1000;

        // JavaScript Date 객체 생성
        const date = new Date(seconds * 1000);

        // 한국 시간대로 조정 (KST: UTC+9)
        date.setHours(date.getHours() + 9);

        // 년, 월, 일, 시, 분, 초 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hour = String(date.getHours()).padStart(2, '0');
        const minute = String(date.getMinutes()).padStart(2, '0');
        const second = String(date.getSeconds()).padStart(2, '0');

        // 결과 문자열 반환
        return month + '월 ' + day + '일 ' + hour + ':' + minute;
    }
</script>
</html>
