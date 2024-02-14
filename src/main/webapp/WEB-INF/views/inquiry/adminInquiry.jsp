<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-22
  Time: 오전 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin 문의사항</title>
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

        .screens-inquiry-adminInquiry {
            width: 100vw;
            height: 95vh;
            background-color: gainsboro;
        }

        .screens-inquiry-justify-start {
            justify-content: start;
        }

        .screens-inquiry-justify-center {
            justify-content: center;
        }

        .screens-inquiry-justify-end {
            justify-content: end;
        }

        .screens-inquiry-align-start {
            align-items: start;
        }

        .screens-inquiry-align-center {
            align-items: center;
        }

        .screens-inquiry-align-end {
            align-items: end;
        }

        .screens-inquiry-adminInquiry * {
            margin: 0;
            padding: 0;
        }


        .screens-inquiry-adminInquiry > section * {
            box-sizing: border-box;
        }

        .screens-inquiry-adminInquiry__section {
            position: relative;
            top: 70px;
            left: 230px;
            width: calc(100% - 300px);
            height: calc(100% - 50px);
            border-top: 1px solid #EBEBEB;
            background-color: white;
        }

        .screens-inquiry-adminInquiry__section > div {
            border-right: 1px solid #EBEBEB;
        }


        .screens-inquiry-adminInquiry__section > div > div:nth-child(1) {
            height: 7%;
            /*flex: 7;*/
            border-bottom: 1px solid #EBEBEB;
        }

        .screens-inquiry-adminInquiry__section > div > div:nth-child(2) {
            height: 93%;
            /*flex: 93;*/
        }

        .screens-inquiry-adminInquiry__inquiryList {
            width: 25%;
            /*flex: 1;*/
        }

        .screens-inquiry-adminInquiry__inquiryMessage {
            width: 50%;
            /*flex: 2;*/
        }

        .screens-inquiry-adminInquiry__inquiryEtc {
            width: 25%;
            /*flex: 1;*/
        }


        .screens-inquiry-adminInquiry__inquiryMessage__body > div:nth-child(1) {
            /*flex: 10;*/
            height: 95%;
            overflow: auto;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body > div:nth-child(2) {
            /*flex: 1;*/
            /*height: 2rem;*/
            height: 5%;
        }

        .screens-inquiry-adminInquiry__inquiryList__body,
        .screens-inquiry-adminInquiry__inquiryMessage__body__messages,
        .screens-inquiry-adminInquiry__inquiryEtc__body {
            overflow: auto;
        }

        .screens-inquiry-adminInquiry__inquiryList__head {
            height: 100%;
            flex: 1;
            text-align: center;
            display: flex;
            flex-direction: row;
        }

        .screens-inquiry-adminInquiry__inquiryList__head__content-text {
            flex: 1;
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-adminInquiry__inquiryMessage__head {
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-adminInquiry__inquiryEtc__head {
            align-items: center;
            padding-left: 1em;
            font-family: 'NotoSansKR-Medium';
        }

        .screens-inquiry-adminInquiry__inquiry {
            padding-left: 0.5em;
            margin-top: 0.5em;
        }

        .screens-inquiry-adminInquiry__inquiry__right {

        }

        .screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(1) {
            font-family: 'NotoSansKR-Medium';
            margin-bottom: 0.5em;
        }

        .screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(2) {
            font-size: 0.9em;
        }

        .screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(3) {
            font-size: 0.7em;

        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__message {
            margin-top: 1em;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(1) > p {
            font-family: 'NotoSansKR-Bold';
            font-size: 0.7em;
            margin-bottom: 0.5em;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(2) > p {
            font-size: 1.2em;
            margin-bottom: 0.1em;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(3) > p {
            font-size: 0.7em;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__form > input:nth-of-type(1) {
            width: 90%;
        }

        .screens-inquiry-adminInquiry__inquiryMessage__body__form > input:nth-of-type(2) {
            width: 10%;
        }
    </style>
</head>
<body class="screens-inquiry-adminInquiry">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
<section class="screens-inquiry-adminInquiry__section screens-inquiry-flex-row">
    <div class="screens-inquiry-adminInquiry__inquiryList screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryList__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div class="screens-inquiry-adminInquiry__inquiryList__head__content-text screens-inquiry-flex-row"><p>문의사항</p></div>
            <div class="screens-inquiry-adminInquiry__inquiryList__head__content-filtermark"></div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryList__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div class="screens-inquiry-adminInquiry__inquiry screens-inquiry-flex-row">
                <div class="screens-inquiry-adminInquiry__inquiry__left  screens-inquiry-flex-column">
                    <%--                    <div><img src="" alt="사진 없음"></div>--%>
                </div>
                <div class="screens-inquiry-adminInquiry__inquiry__right screens-inquiry-flex-column">
                    <div><p></p></div>
                    <div><p></p></div>
                    <div><p></p></div>
                </div>
            </div>
        </div>
    </div>
    <div class="screens-inquiry-adminInquiry__inquiryMessage screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryMessage__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div><p>메세지</p></div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryMessage__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div class="screens-inquiry-adminInquiry__inquiryMessage__body__messages screens-inquiry-flex-column">
                <div class="screens-inquiry-adminInquiry__inquiryMessage__body__message screens-inquiry-flex-column">
                    <div><p></p></div>
                    <div><p></p></div>
                    <div><p></p></div>
                </div>
            </div>
            <div class="screens-inquiry-adminInquiry__inquiryMessage__body__form screens-inquiry-chatting-form screens-inquiry-flex-row">
                <input type="text" class="screens-inquiry-adminInquiry-sendText">
                <input type="button" value="전송" class="screens-inquiry-adminInquiry-sendBtn">
            </div>
        </div>
    </div>
    <div class="screens-inquiry-adminInquiry__inquiryEtc screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryEtc__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div><p>세부 내용</p></div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryEtc__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div></div>
        </div>
    </div>
</section>
</body>
<script>
    let socket;
    let stompClient;
    let chatting_room_id;


    const ChattingRoomList = document.querySelector('.screens-inquiry-adminInquiry__inquiryList__body');
    const ChattingRoom = document.querySelector('.screens-inquiry-adminInquiry__inquiry');
    const copiedChattingRoom = ChattingRoom.cloneNode(true);

    const ChattingMessageList = document.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__messages');
    const ChattingMessage = document.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__message');
    const copiedChattingMessage = ChattingMessage.cloneNode(true);

    const inputText = document.querySelector('.screens-inquiry-adminInquiry-sendText');
    const inputBtn = document.querySelector('.screens-inquiry-adminInquiry-sendBtn');
    const messageListElement = document.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__messages');

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

    function clickChattingRoomAjax(r_chatting_room_id, r_user_id, u_user_nickname) {
        $.ajax({
            type: 'get',
            url: "/admin/inquiry/" + r_chatting_room_id,
            data: {},
            success: function (result) {
                emptyChattingMessageList();
                fillChattingMessageList(result);
                chatting_room_id = r_chatting_room_id;
                connectStomp();
                document.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__head > div > p').textContent = u_user_nickname + '(' + r_user_id + ')님과 채팅';
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
            stompClient.subscribe('/subscribe/inquiry/' + chatting_room_id, function (receivedData) {
                appendChattingMessage2(receivedData);
            })
        })
    }

    inputBtn.addEventListener('click', function () {
        sendMessage();
    })

    function sendMessage() {
        if (inputText.value === '') return;
        const message = {
            sender: 'admin',
            content: inputText.value
        };
        stompClient.send('/app/inquiry/' + chatting_room_id, {}, JSON.stringify(message));
        saveMessage(chatting_room_id, inputText.value);
        inputText.value = '';
    }

    function saveMessage(chatting_room_id, message) {
        $.ajax({
            type: 'post',
            url: "/admin/inquiry/savemessage",
            data: {
                "chatting_room_id": chatting_room_id,
                "message": message,
            },
            success: function () {
                console.log("admin saveMessageAjax 성공");
            },
            error: function () {
                console.log("admin saveMessageAjax 실패");
            }
        })
    }

    function appendChattingMessage2(message) {
        const cloneElement = copiedChattingMessage.cloneNode(true);
        const parsedMessage = JSON.parse(message.body);
        const sender = parsedMessage.sender;
        const content = parsedMessage.content;

        if (sender === 'user') {
            cloneElement.style.textAlign = 'left';
            cloneElement.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(1) > p').textContent = '';
        } else {
            cloneElement.style.textAlign = 'right';
            cloneElement.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(1) > p').textContent = '';
        }

        cloneElement.querySelector(
            '.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(2) > p').textContent = content;
        cloneElement.querySelector(
            '.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(3) > p').textContent = convertTimestampmmddhhmm(new Date().getTime());
        ChattingMessageList.appendChild(cloneElement);
        scrollDown();
    }

    function appendChattingMessage(component) {
        const cloneElement = copiedChattingMessage.cloneNode(true);
        if (component.m_writer_id === component.u_user_id) {
            cloneElement.style.textAlign = 'left';
            cloneElement.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(1) > p').textContent = '';
        } else {
            cloneElement.style.textAlign = 'right';
            cloneElement.querySelector('.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(1) > p').textContent = '';
        }
        cloneElement.querySelector(
            '.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(2) > p').textContent = component.m_chatting_ctt;
        cloneElement.querySelector(
            '.screens-inquiry-adminInquiry__inquiryMessage__body__message > div:nth-of-type(3) > p').textContent = convertTimestampmmddhhmm(component.m_created_at);
        ChattingMessageList.appendChild(cloneElement);
    }

    function fillChattingMessageList(list) {
        list.forEach(function (component) {
            appendChattingMessage(component);
        })
        scrollDown();
    }

    document.addEventListener("keydown", function (event) {
        if (event.key === 'Enter') {
            // querySelector를 사용하여 입력란 요소를 가져옵니다.
            const inputElement = document.querySelector('.screens-inquiry-adminInquiry-sendText');

            // 입력란에 포커스가 있는지 확인합니다.
            if (document.activeElement === inputElement) {
                // querySelector를 사용하여 메시지 리스트 요소를 가져옵니다.
                sendMessage();
            }
        }
    });

    function scrollDown() {
        // 스크롤을 제일 아래로 이동시킨다.
        messageListElement.scrollTop = messageListElement.scrollHeight;
    }

    function fillChattingRoomList(list) {
        list.forEach(function (component) {
            const cloneElement = copiedChattingRoom.cloneNode(true);
            cloneElement.querySelector(
                '.screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(1) > p').textContent = component.u_user_nickname;
            cloneElement.querySelector(
                '.screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(2) > p').textContent = component.m_chatting_ctt;
            cloneElement.querySelector(
                '.screens-inquiry-adminInquiry__inquiry__right > div:nth-of-type(3) > p').textContent = convertTimestampmmddhhmm(component.m_created_at);

            cloneElement.addEventListener("click", function () {
                clickChattingRoomAjax(component.r_chatting_room_id, component.r_user_id, component.u_user_nickname);
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

    window.onload = function () {
        firstPageAjax();
    };

    function firstPageAjax() {
        $.ajax({
            type: 'post',
            url: "/admin/inquiry",
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