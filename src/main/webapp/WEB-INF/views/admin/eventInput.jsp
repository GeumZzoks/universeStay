<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>이벤트 등록</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color:indianred; margin-top: 20px; font-weight: 600;">이벤트 등록</h3>
        <form action='/admin/event/write' method='post'><input type='hidden' value='${eventDto.event_id}'>
            <h5 class="screens-admin-event__content-input__type">이벤트 제목</h5>
            <input name="event_title" type="text" style="width: 50%;">
            <h5 class="screens-admin-event__content-input__type">이벤트 내용</h5>
            <textarea name="event_ctt" class="screens-admin-event__content-input__text"></textarea>
            <div class="screens-admin-event__content-img-div">
                <h5 class="screens-admin-event__content-input__type" style="margin-top: 12px; text-align: center">
                    미리보기</h5>
                <img id="preview" class="screens-admin-event__content-input__img"/>
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
                <input name="event_start_date" type="date" class="screens-admin-event__content-input__date">
                <h5 class="screens-admin-event__content-input__type">이벤트 종료일</h5>
                <input name="event_expire_date" type="date" class="screens-admin-event__content-input__date">
                <h5 class="screens-admin-event__content-input__type">첨부파일(이미지)</h5>
                <div class="screens-admin-event__content-input__filebox">
                    <input class="upload-name" placeholder="첨부파일">
                    <label for="file">탐색</label>
                    <input type="file" name="event_img_url" id="file" accept="image/*" onchange="readURL(this)">
                </div>
            </div>
            <button class='screens-admin-event__content-bottom__btn__submit' type='submit'>등록</button>
        </form>
    </div>
</div>
<script>

    let msg = "${msg}";
    if (msg == "WRT_ERR") alert("게시물 작성에 실패하였습니다. 날짜를 입력해주세요.");

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
