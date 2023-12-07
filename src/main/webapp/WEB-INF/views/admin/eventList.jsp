<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 5:21 PM
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
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">이벤트</h3>
        <form action="<c:url value='/admin/event/list'/>" class="screens-admin-event__content-search" method="get"
              style="width:150px; height: 24px;">
            <select class="screens-admin-event__content-search-option" name="option">
                <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목</option>
                <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
            </select>
            <input type="text" name="keyword" class="screens-admin-event__content-search-input"
                   value="${ph.sc.keyword}"
                   placeholder="검색어를 입력해주세요">
            <input type="submit" class="screens-admin-event__content-search__btn" value="검색">

        </form>

        <div class="screens-admin-event__content-table-div">
            <table class="screens-admin-event__content-table" style="table-layout: fixed">
                <tr>
                    <th class="screens-admin-event__content-table__no" style="font-size: 14px;">번호</th>
                    <th class="screens-admin-event__content-table__title" style="text-align: center">이벤트</th>
                    <th class="screens-admin-event__content-table__writer" style="font-size: 14px;">작성자</th>
                    <th class="screens-admin-event__content-table__status" style="font-size: 14px;">진행상태</th>
                    <th class="screens-admin-event__content-table__is_open" style="font-size: 14px;">공개여부</th>
                    <th class="screens-admin-event__content-table__regdate" style="font-size: 14px;">등록일</th>
                    <th class="screens-admin-event__content-table__viewcnt" style="font-size: 14px;">조회수</th>
                </tr>
                <c:forEach var="eventDto" items="${list}">
                    <tr>
                        <td class="screens-admin-event__content-table__no">${eventDto.event_id}</td>
                        <td class="screens-admin-event__content-table__title"><a
                                href="<c:url value="/admin/event/${eventDto.event_id}"/>"
                                class="screens-admin-event__content-table__title__a">${eventDto.event_title}</a>
                        </td>
                        <td class="screens-admin-event__content-table__writer">${eventDto.admin_nickname}</td>
                        <c:choose>
                            <c:when test="${eventDto.status_id eq 'E01'}">
                                <td class="screens-admin-event__content-table__status">준비중</td>
                            </c:when>
                            <c:when test="${eventDto.status_id eq 'E02'}">
                                <td class="screens-admin-event__content-table__status" style="color: indianred">진행중</td>
                            </c:when>
                            <c:otherwise>
                                <td class="screens-admin-event__content-table__status" style="color: darkgray">종료</td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${eventDto.event_is_open eq 'Y'}">
                                <td class="screens-admin-event__content-table__is_open" style="color: indianred">공개</td>
                            </c:when>
                            <c:otherwise>
                                <td class="screens-admin-event__content-table__is_open">비공개</td>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${eventDto.created_at.time >= startOfToday}">
                                <td class="screens-admin-event__content-table__regdate">
                                    <fmt:formatDate
                                            value="${eventDto.created_at}" pattern="HH:mm"
                                            type="time"/></td>
                            </c:when>
                            <c:otherwise>
                                <td class="screens-admin-event__content-table__regdate">
                                    <fmt:formatDate
                                            value="${eventDto.created_at}"
                                            pattern="yyyy-MM-dd" type="date"/></td>
                            </c:otherwise>
                        </c:choose>
                        <td class="screens-admin-event__content-table__viewcnt">${eventDto.event_hit}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>

        <div class="screens-admin-event__content-bottom">
            <button class="screens-admin-event__content-bottom__btn" onclick="location.href='/admin/event/write'">이벤트 작성
            </button>
        </div>
        <div class="screens-admin-event__paging-container">
            <div class="screens-admin-event__paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div style="position: absolute; top: -250px; left: -80px; width: 120px;"> 게시물이 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="screens-admin-event__page"
                           href="<c:url value="/admin/event/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="screens-admin-event__page ${i==ph.sc.page? "paging-active" : ""}"
                           href="<c:url value="/admin/event/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="screens-admin-event__page"
                           href="<c:url value="/admin/event/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script>
    let msg = "${msg}";
    if (msg == "DEL_OK") alert("게시물이 삭제되었습니다.");

</script>
</body>
</html>
