<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/24
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
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
    <style>
      .screens-admin-event__content {
        width: 80%;
        min-width: 1150px;
        height: auto;
        min-height: 550px;
        position: absolute;
        float: left;
        margin: 0 100px 0 230px;
        top: 78px;
        bottom: 25px;
        padding: 0 20px 0 20px;
        background-color: white;
        overflow: auto;
      }

      .screens-admin-event__content-input__type {
        margin: 20px 0 10px 0;
      }
    </style>
</head>
<body>
<script>
    let msg = "${msg}";
    if (msg == "WRT_ERR") alert("공지사항 등록에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="screens-admin-event__container">
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
    <div class="screens-admin-event__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">공지사항 등록</h3>
        <form action='/admin/notice/write' method='post'>
            <h5 class="screens-admin-event__content-input__type">공지사항 제목</h5>
            <input name="notice_title" type="text" style="width: 50%;"
                   value="${noticeDto.notice_title}" placeholder="제목 입력">
            <h5 class="screens-admin-event__content-input__type">공개 여부</h5>
            <div>
                <input name="notice_is_open" type="radio" value="N"
                       checked>비공개
                <input name="notice_is_open" type="radio" value="Y"
                       <c:if test="${noticeDto.notice_is_open eq 'Y'}">checked</c:if>>공개
            </div>
            <h5 class="screens-admin-event__content-input__type">공지사항 내용</h5>
            <div class="screens-admin-event__content-input__type">
                    <textarea name="notice_ctt" class="screens-admin-event__content-input__text"
                              placeholder="내용 입력"
                              style="white-space: pre">${noticeDto.notice_ctt}</textarea>
            </div>
            <button class='screens-admin-event__content-bottom__btn__submit' onclick="checkBlank()"
                    type='submit'>등록
            </button>
        </form>
    </div>
</div>
</body>
</html>
