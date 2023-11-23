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
        <h5 style="font-size: 20px; font-weight: 800;">이벤트 제목입니다</h5>
        <button class="content-top__btn">수정</button>
        <form><button class="content-top__btn" style="margin-left: 1080px;">삭제</button></form>
    </div>
</body>
</html>
