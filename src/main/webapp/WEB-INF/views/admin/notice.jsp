<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/11/26
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
</head>
<body>
<script>
  <%--let msg = "${msg}";--%>
  <%--if (msg == "WRT_OK") alert("공지사항 등록이 완료되었습니다.");--%>
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
        <form action="/admin/notice/${notce.event_id}" method="post">
            <button type="submit" class="screens-admin-event__content-top__btn" style="right: 20px">
                삭제
            </button>
        </form>
    </div>
</div>
</body>
</html>