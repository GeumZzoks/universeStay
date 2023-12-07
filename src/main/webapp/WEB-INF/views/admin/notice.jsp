<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/11/26
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<script>
  let msg = "${msg}";
  if (msg == "MOD_ERR") alert("공지사항 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">공지사항</h3>
        <h5 style="font-size: 20px; font-weight: 800; margin: 20px 0 0 20px;">${noticeDto.notice_title}</h5>
        <h5 style="white-space:pre; margin: 20px 0 0 20px">${noticeDto.notice_ctt}</h5>
        <button class="screens-admin-event__content-top__btn"
                onclick="location.href='/admin/notice/list'" style="margin-right: 72px">목록
        </button>
        <button class="screens-admin-event__content-top__btn"
                onclick="location.href='/admin/notice/modify/${noticeDto.notice_id}'">수정
        </button>
        <form id="removeForm" action="/admin/notice/remove" method="post">
            <input type="hidden" name="notice_id" value="${noticeDto.notice_id}">
            <button type="button" id="removeBtn" class="screens-admin-event__content-top__btn"
                    style="right: 20px">
                삭제
            </button>
        </form>
    </div>
</div>
<script>
  let removeBtn = document.getElementById("removeBtn");
  let removeForm = document.getElementById("removeForm");
  removeBtn.addEventListener("click", click);

  function click() {
    if (confirm("정말로 삭제하시겠습니까?") == false) {
      return;
    }
    removeForm.submit();
  }
</script>
</body>
</html>