<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/01
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 등록 페이지</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<div class="notice_wrap">
    <div class="notice_title">
        <strong>공지사항</strong>
    </div>
    <div class="notice_write_wrap">
        <form method="post" action="/admin/notice/write">
            <div class="notice_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>공개여부</dt>
                        <dd><input type="text" placeholder="Y / N"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" class="on" value="등록">
                <a href="view.html" class="on">등록</a>
                <a href="list.html">취소</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
