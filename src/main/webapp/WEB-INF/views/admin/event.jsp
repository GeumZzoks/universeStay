<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 6:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <h5 style="font-size: 20px; font-weight: 800; margin-left: 20px">${eventDto.event_title}</h5>
    <h5 style="white-space:pre; margin-left: 20px">${eventDto.event_ctt}</h5>
    <button class="content-top__btn" onclick="location.href='/admin/event/update/${eventDto.event_id}'">수정</button>
    <form action="/admin/event/${eventDto.event_id}" method="post">
        <button type="submit" class="content-top__btn" style="right: 20px">삭제</button>
    </form>
</div>
</body>
</html>
