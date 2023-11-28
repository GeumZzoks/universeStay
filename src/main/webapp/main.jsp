<%--
  Created by IntelliJ IDEA.
  User: hannaryu
  Date: 11/28/23
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/common/global.css">
    <link rel="stylesheet" href="/resources/css/user/main.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/user/nav.jsp"/>

<section class="screens-user-main__main">
    <div class="screens-user-main__main__wrapper">
        <div class="screens-user-main__room__wrapper">
            <img class="screens-user-main__room-img" src="/resources/img/mock/room-mock-img2.png">
            <span class="screens-user-main__room-location">경기도 남양주시 별내동</span>
            <span class="screens-user-main__room-title">아늑한 별내동의 오로라 하우스입니다.</span>

            <div class="screens-user-main__room-price__wrapper">
                <span>₩</span> <span
                    class="screens-user-main__room-price">100000</span><span> /박</span>
            </div>
        </div>

    </div>
</section>


<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>

</body>
</html>
