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
    <link rel="stylesheet" href="../../../resources/css/admin/event.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
flush="false"/>

<div class="content">
    <h3 style="color: indianred;">이벤트</h3>
    <form class="content-search" action="/event/list/${search}">
        <input name="search" type="text" placeholder="검색" style="width:150px; height: 24px;">
        <button type="submit" class="content-search__btn">검색</button>
    </form>

    <div class="content-table-div">
        <table class="content-table">
            <tr>
                <th class="content-table__no">번호</th>
                <th class="content-table__title" style="text-align: center">이벤트</th>
                <th class="content-table__writer">게시자</th>
                <th class="content-table__regdate">등록일</th>
                <th class="content-table__viewcnt">조회수</th>
            </tr>
            <c:forEach var="eventDto" items="${eventList}">
                <tr>
                    <td class="content-table__no" style="font-size: 12px">${eventDto.event_id}</td>
                    <td class="content-table__title"><a
                            href="<c:url value="/admin/event/${eventDto.event_id}"/>"
                            class="content-table__title__a">${eventDto.event_title}</a>
                    </td>
                    <td class="content-table__writer">${eventDto.admin_id}</td>
                    <c:choose>
                        <c:when test="${eventDto.created_at.time >= startOfToday}">
                            <td class="content-table__regdate" style="font-size: 14px"><fmt:formatDate
                                    value="${eventDto.created_at}" pattern="HH:mm"
                                    type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="content-table__regdate" style="font-size: 14px"><fmt:formatDate
                                    value="${eventDto.created_at}"
                                    pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="content-table__viewcnt"
                        style="font-size: 14px">${eventDto.event_hit}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
</div>
<div class="content-bottom">
    <button class="content-bottom__btn"><a href="/admin/event/write" class="content-bottom__btn__a">이벤트 작성</a></button>
</div>

</body>
</html>
