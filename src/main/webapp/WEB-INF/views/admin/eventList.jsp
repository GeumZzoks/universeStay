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
    <link rel="stylesheet" href="../../../resources/css/common/admin/event.css">
</head>
<body>
    <div class="bar-top">
        <button class="bar-top__btn">로그아웃</button>
        <button class="bar-top__btn">관리자 1</button>
    </div>

    <aside class="bar-side">
        <button class="bar-side__homebtn"><a href="/event/list">
            UniverseStay</a></button>
        <button class="bar-side__btn">유저관리</button><br>
        <button class="bar-side__btn">호스트관리</button><br>
        <button class="bar-side__btn">공지사항</button><br>
        <button class="bar-side__btn">이벤트</button><br>
        <button class="bar-side__btn">1:1문의</button>
    </aside>

    <div class="content">
        <h3 style="color: indianred;">이벤트</h3>
        <form class="content-search">
            <input type="text" placeholder="검색" style="width:150px;">
            <button type="submit" class="content-search__btn">검색</button>
        </form>
        <table class="content-table">
            <tr>
                <th class="content-table__no" style="width:60px; border-bottom: 1px solid #444444;">번호</th>
                <th class="content-table__title" style="text-align:center; width:500px; border-bottom: 1px solid #444444;">이벤트</th>
                <th class="content-table__writer" style="border-bottom: 1px solid #444444;">게시자</th>
                <th class="content-table__regdate" style="border-bottom: 1px solid #444444;">등록일</th>
                <th class="content-table__viewcnt" style="border-bottom: 1px solid #444444;">조회수</th>
            </tr>
            <c:forEach var="eventDto" items="${list}">
            <tr>
                <td class="content-table__no" style="text-align:center; border-bottom: 1px solid #444444;">1</td>
                <!-- <td class="no" style="text-align:center; border-bottom: 1px solid #444444;">${eventDto.bno}</td> -->

                <td class="content-table__title" style="text-align:left; border-bottom: 1px solid #444444;">
                    <a href="event.html" style="margin-left: 20px; text-decoration: none; color:indianred">이벤트 제목 예시입니다</a></td>
                <!-- <td class="title" style="text-align:left; border-bottom: 1px solid #444444;"><a href="<c:url value="/board/read/${eventDto.bno}"/>">${eventDto.title}</a></td> -->

                <td class="content-table__writer" style="border-bottom: 1px solid #444444; text-align: center;">관리자</td>
                <!-- <td class="writer" style="border-bottom: 1px solid #444444;">${eventDto.writer}</td> -->

                <td class="content-table__regdate" style="text-align: center; border-bottom: 1px solid #444444;"><fmt:formatDate value="${eventDto.reg_date}" pattern="HH:mm" type="time"/>2023-11-19</td>
    <%--            <!-- <c:when test="${eventDto.reg_date.time >= startOfToday}">--%>
    <%--                        <td class="regdate"><fmt:formatDate value="${eventDto.reg_date}" pattern="HH:mm" type="time"/></td>--%>
    <%--                    </c:when>--%>
    <%--                    <c:otherwise>--%>
    <%--                        <td class="regdate"><fmt:formatDate value="${eventDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>--%>
    <%--                    </c:otherwise>--%>
    <%--                </c:choose> -->--%>

                <td class="content-table__viewcnt" style="text-align: center; border-bottom: 1px solid #444444;">0</td>
                <!-- <td class="viewcnt" style="border-bottom: 1px solid #444444;">${eventDto.view_cnt}</td> -->

            </tr>
            </c:forEach>
        </table>
        <br>
    </div>
    <div class="content-bottom"><a href="eventInput.html"><button class="content-bottom__btn">이벤트 게시글 작성</button></a></div>

</body>
</html>
