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
            position: relative;
            top: 50px;
            width: 100%;
            height: calc(100% - 50px);
            border-top: 1px solid #EBEBEB;
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
            height: 20%;
            /*flex-basis: 7%;*/
        }

        .screens-inquiry-userInquiry-bodyDiv {
            height: 80%;
            /*flex-basis: 93%;*/
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

        /*overflow: auto;*/
        /*align-items: end;*/
        /*word-break: break-all;*/
        /*border-radius: 50px;*/
        /*font-family: 'NotoSansKR-Bold';*/
    </style>
</head>
<body class="screens-inquiry-userInquiry">
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<section class="screens-inquiry-userInquiry__section screens-inquiry-flex-row">
    <div class="screens-inquiry-userInquiry__inquiryList screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryList__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryList__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-text"><p>메시지</p></div>
                <div class="screens-inquiry-userInquiry__inquiryList__head__content-plustmark"><p>+</p></div>
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
                    </div>
                    <div class="screens-inquiry-flex-row">
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
                    </div>
                    <div class="screens-inquiry-flex-row">
                        <div><p>메시지 보낸 시간 </p></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="screens-inquiry-userInquiry__inquiryMessage screens-inquiry-flex-column">
        <div class="screens-inquiry-userInquiry__inquiryMessage__head screens-inquiry-userInquiry-headDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__head__content screens-inquiry-flex-row">
                <div class="screens-inquiry-userInquiry__inquiryMessage__head__content-text"><p>UNIVERSESTAY 고객지원 팀</p>
                </div>
            </div>
        </div>
        <div class="screens-inquiry-userInquiry__inquiryMessage__body screens-inquiry-userInquiry-bodyDiv screens-inquiry-flex-row">
            <div class="screens-inquiry-userInquiry__inquiryMessage__body__content screens-inquiry-flex-column">
                <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__messageList screens-inquiry-flex-column">
                    <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message screens-inquiry-flex-row">
                        <div class="screens-inquiry-userInquiry__inquiryMessage__body__content__message-left screens-inquiry-flex-row">
                            <div class="screens-inquiry-userInquiry__inquiryMessage-imgDiv"><img src="" alt="프로필사진">
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
                            <div class="screens-inquiry-userInquiry__inquiryMessage-imgDiv"><img src="" alt="프로필사진">
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
                        <div><input type="text" name="message"></div>
                        <div><input type="submit" value="전송"></div>
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
                    <div class="screens-inquiry-userInquiry__inquiryEtc-imgDiv screens-inquiry-flex-row"><img
                            src="/resources/img/logo/big_logo_no_bgd.png"></div>
                    <div class="screens-inquiry-flex-column">
                        <div><p>UNIVERSESTAY 고객지원팀</p></div>
                        <div><p>글씨123123123</p></div>
                    </div>
                </div>
                <div class="screens-inquiry-flex-row">
                    <div class="screens-inquiry-userInquiry__inquiryEtc-imgDiv screens-inquiry-flex-row"><img
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
    var socket;
    var stompClient;

    function connect() {
        // 브라우저와 서버 간의 핸드쉐이크, 이 때부터 socket 통신도 가능
        socket = new SockJS("/endpoint");
        // webSocket을 다루는데 stomp로 다루겠다!
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log("Connected: " + frame);
            stompClient.subscribe('subscribe/inquiry/' + chatting_room_id, function (chatMessage) {
                var Dto = JSON.parse(chatting)
            })
        })

    }


    $(function () {
    })

</script>
</html>
