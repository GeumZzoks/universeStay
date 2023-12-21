<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>이벤트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div class="screens-admin-event__container">

    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>


    <div class="screens-admin-event__content">
        <h3 style="font-size: 20px; color: indianred; margin-top: 20px; font-weight: 600;">이벤트</h3>
        <h5 style="font-size: 20px; font-weight: 800; margin: 20px 0 0 20px;">${eventDto.event_title}</h5>
        <c:choose>
            <c:when test="${eventDto.img ne ''}">
                <img class="screens-admin-event__content__img" src="${eventDto.img}">
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>
        <h5 style="white-space:pre; margin: 20px 0 100px 20px">${eventDto.event_ctt}</h5>
        <div class="screens-admin-event__content-div__status">
            <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">이벤트 상태</h3>
            <c:choose>
                <c:when test="${eventDto.status_id eq 'E01'}">
                    <h4>준비중</h4>
                </c:when>
                <c:when test="${eventDto.status_id eq 'E02'}">
                    <h4>진행중</h4>
                </c:when>
                <c:otherwise>
                    <h4>종료</h4>
                </c:otherwise>
            </c:choose>

            <h2 style="color: indianred; margin-top: 20px; font-weight: 600;">공개여부</h2>
            <c:choose>
                <c:when test="${eventDto.event_is_open eq 'Y'}">
                    <h4>공개</h4>
                </c:when>
                <c:otherwise>
                    <h4>비공개</h4>
                </c:otherwise>
            </c:choose>
            <h2 style="color: indianred; margin-top: 20px; font-weight: 600;">이벤트 시작일</h2>
            <h5><fmt:parseDate value="${eventDto.event_start_date}" var="dateFmt1"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate
                        value="${dateFmt1}" pattern="yyyy-MM-dd"
                        type="date"/></h5>
            <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">이벤트 종료일</h3>
            <h5><fmt:parseDate value="${eventDto.event_expire_date}" var="dateFmt2"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate
                        value="${dateFmt2}" pattern="yyyy-MM-dd"
                        type="date"/></h5>
        </div>

        <button class="screens-admin-event__content-top__btn"
                onclick="location.href='/admin/event/update/${eventDto.event_id}'">수정
        </button>
        <form action="/admin/event/${eventDto.event_id}" method="post">
            <button type="submit" class="screens-admin-event__content-top__btn" style="right: 50px">삭제</button>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
</div>
<script>
    let msg = "${msg}";
    if (msg == "DEL_ERR") alert("게시물 삭제에 실패하였습니다. 삭제 권한이 없습니다.");
    if (msg == "UDT_OK") alert("게시물이 수정되었습니다.");
    if (msg == "UDT_ERR") alert("게시물 수정에 실패하였습니다. 수정 권한이 없습니다.");
</script>
</body>
</html>
