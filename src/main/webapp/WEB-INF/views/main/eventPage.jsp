<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/12
  Time: 7:54 PM
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
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="screens-user-eventPage-container">
    <h2>이벤트</h2>
    <br>
    <div class="screens-user-eventPage_list__wrapper">
        <c:forEach var="eventMainDto" items="${eventMainDto}">
            <div class="screens-user-eventPage__wrapper" onclick="location.href='/event/${eventMainDto.event_id}'">
                <div class="screens-user-eventPage__img__wrapper">
                    <img src="${eventMainDto.img}">
                    <div class="event">
                    </div>
                </div>
                <div class="screens-user-eventPage__info__wrapper">
                    <ul>
                        <li>${eventMainDto.event_title}</li>
                        <li style="font-size: 12px; color: #717171; margin: 10px 0 4px 0">이벤트 기간</li>
                        <li style="font-size: 14px;">
                            <fmt:parseDate value="${eventMainDto.event_start_date}" var="dateFmt"
                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
                            ~
                            <fmt:parseDate value="${eventMainDto.event_expire_date}" var="dateFmt"
                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
                        </li>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>


</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

</body>
</html>
