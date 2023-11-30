<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/26
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>이벤트 수정</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">이벤트 수정</h3>
        <form action='/admin/event/update/${eventDto.event_id}' method='post'>
            <input type='hidden' value='${eventDto.event_id}'>
            <div style="margin-left: 20px">
                <h5 class="screens-admin-event__content-input__type">이벤트 제목</h5>
                <input name="event_title" type="text" style="width: 50%;" value="${eventDto.event_title}">
                <h5 class="screens-admin-event__content-input__type">이벤트 내용</h5>
                <textarea name="event_ctt"
                          style="white-space:pre; width:70%; height: 340px; overflow: scroll;">${eventDto.event_ctt}</textarea>
            </div>
            <div class="screens-admin-event__content-input-div">
                <h5 class="screens-admin-event__content-input__type">이벤트 상태</h5>
                <select name="status_id">
                    <option value="E01">준비중</option>
                    <option value="E02">진행중</option>
                    <option value="E03">종료</option>
                </select>
                <h5 class="screens-admin-event__content-input__type">공개여부</h5>
                <input name="event_is_open" type="radio" class="screens-admin-event__content-input-div__radio" value="N"
                       checked>비공개
                <input name="event_is_open" type="radio" class="screens-admin-event__content-input-div__radio"
                       value="Y">공개
                <h5 class="screens-admin-event__content-input__type">이벤트 시작일</h5>
                <input name="event_start_date" type="date" class="screens-admin-event__content-input__date"
                       min="${startOfToday}">
                <h5 class="screens-admin-event__content-input__type">이벤트 종료일</h5>
                <input name="event_expire_date" type="date" class="screens-admin-event__content-input__date">
                <h5 class="screens-admin-event__content-input__type">첨부파일(이미지)</h5>
                <input type="file"
                       style="position: absolute; background-color: transparent">
            </div>
            <button class='screens-admin-event__content-bottom__btn__submit' type='submit'>수정</button>
        </form>
    </div>
</div>
</body>
</html>
