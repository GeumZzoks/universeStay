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
        height: 100vh;
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
        top: 50px;
        width: 100%;
        height: calc(100% - 51px);
        border-top: 1px solid #EBEBEB;
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


    </style>
</head>
<body class="screens-inquiry-adminInquiry">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<section class="screens-inquiry-adminInquiry__section screens-inquiry-flex-row">
    <div class="screens-inquiry-adminInquiry__inquiryList screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryList__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div>문의사항 목록</div>
            <div>필터</div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryList__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div>채팅방1</div>
            <div>채팅방2</div>
            <div>채팅방3</div>
            <div>채팅방4</div>
            <div>채팅방5</div>
        </div>
    </div>
    <div class="screens-inquiry-adminInquiry__inquiryMessage screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryMessage__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div>메세지</div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryMessage__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div class="screens-inquiry-adminInquiry__inquiryMessage__body__messages screens-inquiry-flex-column">
                <div>물어볼 게 있습니다!</div>
                <div>무엇을 도와드릴까요?</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>물어볼 게 있습니다!</div>
                <div>무엇을 도와드릴까요?</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>물어볼 게 있습니다!</div>
                <div>무엇을 도와드릴까요?</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>물어볼 게 있습니다!</div>
                <div>무엇을 도와드릴까요?</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>물어볼 게 있습니다!</div>
                <div>무엇을 도와드릴까요?</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
                <div>1111111111111111</div>
                <div>2222222222222222</div>
            </div>
            <div class="screens-inquiry-adminInquiry__inquiryMessage__body__form screens-inquiry-chatting-form screens-inquiry-flex-row">
                <input type="text">
                <input type="button" value="전송">
            </div>
        </div>
    </div>
    <div class="screens-inquiry-adminInquiry__inquiryEtc screens-inquiry-adminInquiry-div screens-inquiry-flex-column">
        <div class="screens-inquiry-adminInquiry__inquiryEtc__head screens-inquiry-adminInquiry-head screens-inquiry-flex-row">
            <div>세부 내용</div>
        </div>
        <div class="screens-inquiry-adminInquiry__inquiryEtc__body screens-inquiry-adminInquiry-body screens-inquiry-flex-column">
            <div>1</div>
            <div>2</div>
            <div>3</div>
            <div>4</div>
            <div>5</div>
            <div>6</div>
            <div>7</div>
            <div>8</div>
            <div>9</div>
            <div>10</div>
        </div>
    </div>
</section>
</body>
<script>
    // 브라우저와 서버 간의 핸드쉐이크, 이 때부터 socket 통신도 가능
    let socket = new SockJS("/endpoint");
    // stomp 사용
    let client = Stomp.over(socket);

    $(function () {
    })

</script>
</html>
