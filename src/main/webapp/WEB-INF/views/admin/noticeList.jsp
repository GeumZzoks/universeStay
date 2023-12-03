<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/11/26
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>noticeList Page</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
flush="false"/>


<div class="screens-admin-notice__wrap">
    <%--    <div class="notice_title">--%>
    <div class="screens-admin-notice__wrap__title">
        <strong>공지사항</strong>
    </div>
    <div class="notice_list_wrap">
        <%--    <div class="screens-admin-notice__wrap__container">--%>
        <div class="notice_list">
            <%--        <div class="screens-admin-notice__wrap__container__list">--%>
            <div class="top">
                <%--            <div class="screens-admin-notice__wrap__container__list__top">--%>
                <div class="screens-admin-notice__wrap__container__list__top__num">번호</div>
                <div class="screens-admin-notice__wrap__container__list__top__title">제목</div>
                <div class="screens-admin-notice__wrap__container__list__top__writer">작성자</div>
                <div class="screens-admin-notice__wrap__container__list__top__date">작성일</div>
                <div class="screens-admin-notice__wrap__container__list__top__count">조회수</div>
            </div>
            <div class="screens-admin-notice__wrap__container__list__top">
                <div class="screens-admin-notice__wrap__container__list__top__num">5</div>
                <div class="screens-admin-notice__wrap__container__list__top__title"><a
                        href="view.html">글 제목이 들어갑니다.</a></div>
                <div class="screens-admin-notice__wrap__container__list__top__writer">김이름</div>
                <div class="screens-admin-notice__wrap__container__list__top__date">2021.1.15</div>
                <div class="screens-admin-notice__wrap__container__list__top__count">33</div>
            </div>
        </div>
        <div class="notice_page">
            <a href="#" class="bt first"><<</a>
            <a href="#" class="bt prev"><</a>
            <a href="#" class="num on">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="num">4</a>
            <a href="#" class="num">5</a>
            <a href="#" class="bt next">></a>
            <a href="#" class="bt last">>></a>
        </div>
        <div class="bt_wrap">
            <a href="/admin/notice/write" class="on">등록</a>
            <!-- <a href="#">수정</a> -->
        </div>
    </div>
</div>
</body>
</html>
