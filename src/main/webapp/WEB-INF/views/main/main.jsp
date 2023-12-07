<%@ page import="org.springframework.ui.Model" %><%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/user/nav.jsp"/>

<section class="screens-user-main__main">
    <div class="screens-user-main__main__wrapper">

        <c:forEach var="room" items="${roomList}">
            <div class="screens-user-main__room__wrapper" value="${room.room_id}" data-key="test">
                <img class="screens-user-main__room-img"
                     src="/resources/img/mock/room-mock-img2.png">
                <span class="screens-user-main__room-location">${room.room_address}</span>
                <span class="screens-user-main__room-title">${room.room_name}</span>

                <div class="screens-user-main__room-price__wrapper">
                    <span>₩</span> <span
                        class="screens-user-main__room-price">${room.room_weekend_price}</span><span> /박</span>
                </div>
                <span class="screens-user-main__room-stars">✭${room.room_stars_avg}</span>
            </div>
        </c:forEach>

    </div>
</section>


<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script src="/resources/js/main/main.js"></script>
<script>
    const statusId = "${statusId}";
    if (statusId == "U02") {
        alert("현재 휴면 상태입니다. 해제 하시겠습니까?");
    }
    if (statusId == "U03") {
        alert("정지된 아이디입니다. 관리자에게 문의 하세요");
    }
    if (statusId == "U04") {
        alert("회원탈퇴한 아이디입니다. 관리자에게 문의 하세요");
    }
</script>
</body>
</html>
