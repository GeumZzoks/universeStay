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
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/img/favi.ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/img/favi.ico//apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/img/favi.ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/favi.ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="/resources/img/favi.ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="/resources/img/favi.ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"
          href="/resources/img/favi.ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="/resources/img/favi.ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"
          href="/resources/img/favi.ico/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"
          href="/resources/img/favi.ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"
          href="/resources/img/favi.ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"
          href="/resources/img/favi.ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"
          href="/resources/img/favi.ico/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
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
            <div class="screens-user-eventPage__wrapper"
                 onclick="location.href='/event/${eventMainDto.event_id}'">
                <div class="screens-user-eventPage__img__wrapper">
                    <img src="${eventMainDto.img}">
                    <div class="event">
                    </div>
                </div>
                <div class="screens-user-eventPage__info__wrapper">
                    <ul>
                        <li>${eventMainDto.event_title}</li>
                        <li style="font-size: 12px; color: #717171; margin: 10px 0 4px 0">이벤트 기간
                        </li>
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
