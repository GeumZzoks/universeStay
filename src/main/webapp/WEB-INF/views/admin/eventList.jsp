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
</head>
<body>
<div class="screens-admin-event__container">
    
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color: indianred; margin-top: 20px">이벤트</h3>
        <form class="screens-admin-event__content-search" action="/event/list/${search}">
            <input name="search" type="text" placeholder="검색" style="width:150px; height: 24px;">
            <button type="submit" class="screens-admin-event__content-search__btn">검색</button>
        </form>

        <div class="screens-admin-event__content-table-div">
            <table class="screens-admin-event__content-table">
                <tr>
                    <th class="screens-admin-event__content-table__no">번호</th>
                    <th class="screens-admin-event__content-table__title" style="text-align: center">이벤트</th>
                    <th class="screens-admin-event__content-table__writer">게시자</th>
                    <th class="screens-admin-event__content-table__regdate">등록일</th>
                    <th class="screens-admin-event__content-table__viewcnt">조회수</th>
                </tr>
                <c:forEach var="eventDto" items="${eventList}">
                    <tr>
                        <td class="screens-admin-event__content-table__no"
                            style="font-size: 12px">${eventDto.event_id}</td>
                        <td class="screens-admin-event__content-table__title"><a
                                href="<c:url value="/admin/event/${eventDto.event_id}"/>"
                                class="screens-admin-event__content-table__title__a">${eventDto.event_title}</a>
                        </td>
                        <td class="screens-admin-event__content-table__writer">${eventDto.admin_id}</td>
                        <c:choose>
                            <c:when test="${eventDto.created_at.time >= startOfToday}">
                                <td class="screens-admin-event__content-table__regdate" style="font-size: 14px">
                                    <fmt:formatDate
                                            value="${eventDto.created_at}" pattern="HH:mm"
                                            type="time"/></td>
                            </c:when>
                            <c:otherwise>
                                <td class="screens-admin-event__content-table__regdate" style="font-size: 14px">
                                    <fmt:formatDate
                                            value="${eventDto.created_at}"
                                            pattern="yyyy-MM-dd" type="date"/></td>
                            </c:otherwise>
                        </c:choose>
                        <td class="screens-admin-event__content-table__viewcnt"
                            style="font-size: 14px">${eventDto.event_hit}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>
    </div>
    <div class="screens-admin-event__content-bottom">
        <button class="screens-admin-event__content-bottom__btn" onclick="location.href='/admin/event/write'">이벤트 작성
        </button>
    </div>
</div>
</body>
</html>
