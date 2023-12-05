<%--
  Created by IntelliJ IDEA.
  User: sunghoonlee
  Date: 2023/12/01
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
<script>
  let msg = "${msg}";
  if (msg == "WRT_ERR") alert("공지사항 등록에 실패하였습니다. 다시 시도해 주세요.");
</script>
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
                        <dd><input type="text" name="notice_title" placeholder="제목 입력"
                                   value="${noticeDto.notice_title}">
                        </dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>공개여부</dt>
                        <dd>
                            <input name="notice_is_open" type="radio" value="N"
                                   <c:if test="${noticeDto.notice_is_open eq 'N'}">checked</c:if>>비공개
                            <input name="notice_is_open" type="radio" value="Y"
                                   <c:if test="${noticeDto.notice_is_open eq 'Y'}">checked</c:if>>공개
                        </dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="notice_ctt"
                              placeholder="내용 입력">${noticeDto.notice_ctt}</textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" class="on" value="등록">
                <a href="list.html">취소</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
