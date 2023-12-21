<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/26
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <title>이벤트 수정</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">이벤트 수정</h3>
        <form action='/admin/event/update/${eventDto.event_id}' method='post' enctype="multipart/form-data">
            <input type='hidden' value='${eventDto.event_id}'>
            <h5 class="screens-admin-event__content-input__type">이벤트 제목</h5>
            <input name="event_title" type="text" style="width: 50%;" value="${eventDto.event_title}">
            <h5 class="screens-admin-event__content-input__type">이벤트 내용</h5>
            <textarea name="event_ctt"
                      class="screens-admin-event__content-input__text">${eventDto.event_ctt}</textarea>
            <div class="screens-admin-event__content-img-div">
                <h5 class="screens-admin-event__content-input__type" style="margin-top: 12px; text-align: center">
                    미리보기</h5>
                <img id="preview" class="screens-admin-event__content-input__img"
                     src="${eventDto.img}"/>
            </div>
            <div class="screens-admin-event__content-input-div">
                <h5 class="screens-admin-event__content-input__type">이벤트 상태</h5>
                <select name="status_id">
                    <c:choose>
                        <c:when test="${eventDto.status_id eq 'E01'}">
                            <option value="E01" selected>준비중</option>
                            <option value="E02">진행중</option>
                            <option value="E03">종료</option>
                        </c:when>
                        <c:when test="${eventDto.status_id eq 'E02'}">
                            <option value="E01">준비중</option>
                            <option value="E02" selected>진행중</option>
                            <option value="E03">종료</option>
                        </c:when>
                        <c:otherwise>
                            <option value="E01">준비중</option>
                            <option value="E02">진행중</option>
                            <option value="E03" selected>종료</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <h5 class="screens-admin-event__content-input__type">공개여부</h5>
                <c:choose>
                    <c:when test="${eventDto.event_is_open eq 'Y'}">
                        <input name="event_is_open" type="radio" class="screens-admin-event__content-input-div__radio"
                               value="N">비공개
                        <input name="event_is_open" type="radio" class="screens-admin-event__content-input-div__radio"
                               value="Y" checked>공개
                    </c:when>
                    <c:otherwise>
                        <input name="event_is_open" type="radio" class="screens-admin-event__content-input-div__radio"
                               value="N" checked>비공개
                        <input name="event_is_open" type="radio"
                               class="screens-admin-event__content-input-div__radio" value="Y">공개
                    </c:otherwise>
                </c:choose>
                <h5 class="screens-admin-event__content-input__type">이벤트 시작일</h5>
                <input name="event_start_date" type="date" class="screens-admin-event__content-input__date"
                       value="${start}">
                <h5 class="screens-admin-event__content-input__type">이벤트 종료일</h5>
                <input name="event_expire_date" type="date" class="screens-admin-event__content-input__date"
                       value="${expire}">
                <h5 class="screens-admin-event__content-input__type">첨부파일(이미지)</h5>
                <div class="screens-admin-event__content-input__filebox">
                    <input class="upload-name" placeholder="첨부파일" value="/resources/img/admin/${eventDto.img}.png">
                    <label for="file">탐색</label>
                    <input type="file" id="file" name="eventFile" accept="image/*" onchange="readURL(this)">
                </div>
            </div>
            <button class='screens-admin-event__content-bottom__btn__submit' type='submit'>수정</button>
        </form>
    </div>
</div>
<script>

    let msg = "${msg}";
    if (msg == "UDT_ERR2") alert("게시물 수정에 실패하였습니다. 다시 시도해주세요.");

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    $("#file").on('change', function () {
        var fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });

</script>
</body>
</html>
