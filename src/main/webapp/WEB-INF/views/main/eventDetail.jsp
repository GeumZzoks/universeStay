<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/18
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>이벤트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">

    <style>
        .screens-user-eventDetail-container {
            width: 100%;
            height: 100%;
            display: block;
        }

        .screens-user-eventDetail-container h2 {
            margin: 30px 0 10px 6%;
            font-size: 24px;
            font-weight: 500;
        }

        .screens-user-eventDetail-container h2:hover {
            cursor: pointer;
        }

        .screens-user-eventDetail-wrapper {
            width: 800px;
            height: 100%;
            margin-top: 20px;
            margin-left: calc((100% - 800px) / 2);
        }

        .screens-user-eventDetail-container h3 {
            width: 100%;
            font-size: 24px;
            font-weight: 600;
            margin-left: 10px;
        }

        .screens-user-eventDetail-img {
            width: 100%;
            margin-top: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color: #F48475;
        }

        .screens-user-eventDetail-content {
            width: calc(100% - 40px);
            height: 200px;
            font-size: 12px;
            padding: 30px 0 0 40px;
            background-color: #4c4c4c;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            color: white;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>

<div class="screens-user-eventDetail-container">
    <h2 onclick="location.href='/event'">< 이벤트</h2>
    <div class="screens-user-eventDetail-wrapper">
        <h3>${eventDto.event_title}</h3>
        <img class="screens-user-eventDetail-img" src="/resources/img/admin/${eventDto.img}.png">
        <div class="screens-user-eventDetail-content">
            <h4 style="font-size: 16px; font-weight: 500;">∇ 유의사항</h4><br>
            <h4 style="margin-bottom: 20px;">이벤트 기간 :
                <fmt:parseDate value="${eventDto.event_start_date}" var="dateFmt"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
                ~
                <fmt:parseDate value="${eventDto.event_expire_date}" var="dateFmt"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/></h4>
            <h4>${eventDto.event_ctt}</h4>
        </div>
        <div style="height: 200px"></div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
</body>
</html>
