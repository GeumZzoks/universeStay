<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/05
  Time: 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">공지사항 수정</h3>
        <form action='/admin/event/update/${noticeDto.notice_id}' method='post'>
            <input type='hidden' value='${noticeDto.notice_id}'>
            <div style="margin-left: 20px">
                <h5 class="screens-admin-event__content-input__type">공지사항 제목</h5>
                <input name="notice_title" type="text" style="width: 50%;"
                       value="${noticeDto.notice_title}">
                <h5 class="screens-admin-event__content-input__type">공지사항 내용</h5>
                <textarea name="notice_ctt"
                          style="white-space:pre; width:70%; height: 340px; overflow: scroll;">${noticeDto.notice_ctt}</textarea>
            </div>
            <div class="screens-admin-event__content-input-div">

                <h5 class="screens-admin-event__content-input__type">공개여부</h5>
                <input name="notice_is_open" type="radio"
                       class="screens-admin-event__content-input-div__radio" value="N"
                       checked>비공개
                <input name="notice_is_open" type="radio"
                       class="screens-admin-event__content-input-div__radio"
                       value="Y">공개
            </div>
            <button class='screens-admin-event__content-bottom__btn__submit' type='submit'>수정
            </button>
        </form>
    </div>
</div>
</body>
</html>
