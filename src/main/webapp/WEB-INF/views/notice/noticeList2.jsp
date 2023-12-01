<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/11/29
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>noticeList2 Page</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<div class="notice_wrap">
    <div class="notice_title">
        <strong>공지사항</strong>
        <div class="bt_wrap" style="margin-left: 900px;">
            <a href="write.html" class="on">등록</a>
        </div>
    </div>
    <div class="notice_list_wrap">
        <div class="notice_list">
            <div class="top">
                <div class="num">번호</div>
                <div class="title">제목</div>
                <div class="writer">작성자</div>
                <div class="date">작성일</div>
                <div class="count">공개여부</div>
            </div>
            <c:forEach var="notice" items="${list}">
                <div>
                    <div class="num">${notice.notice_id}</div>
                    <div class="title"><a href="view.html">${notice.notice_title}</a></div>
                    <div class="writer">${notice.admin_id}</div>
                    <div class="date">${notice.created_at}</div>
                    <div class="count">${notice.notice_is_open}</div>
                </div>
            </c:forEach>
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
    </div>
</div>
</body>
</html>
