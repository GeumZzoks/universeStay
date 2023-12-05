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
    <title>공지사항 - UNIVERSESTAY</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

<div class="notice_wrap">
    <div class="notice_title">
        <strong>공지사항</strong>
        <div class="bt_wrap" style="margin-left: 900px;">
            <a href="<c:url value='/admin/notice/write'/>" class="on">등록</a>
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
                    <div class="title"><a
                            href="/admin/notice/${notice.notice_id}">${notice.notice_title}</a>
                    </div>
                    <div class="writer">${notice.admin_id}</div>
                    <div class="date">${notice.created_at}</div>
                    <div class="count">${notice.notice_is_open}</div>
                </div>
            </c:forEach>
        </div>
        <div class="notice_page">
            <a href="<c:url value='/admin/notice/list?page=1&pageSize=${nph.pageSize}'/>"
               class="bt first"><<</a>
            <c:if test="${nph.showPrev}">
                <a href="<c:url value='/admin/notice/list?page=${nph.beginPage-1}&pageSize=${nph.pageSize}'/>"
                   class="bt prev"><</a>
            </c:if>
            <c:forEach var="i" begin="${nph.beginPage}" end="${nph.endPage}">
                <a href="<c:url value='/admin/notice/list?page=${i}&pageSize=${nph.pageSize}'/>"
                   class="num">${i}</a>
            </c:forEach>
            <c:if test="${nph.showNext}">
                <a href="<c:url value='/admin/notice/list?page=${nph.endPage+1}&pageSize=${nph.pageSize}'/>"
                   class="bt prev">></a>
            </c:if>
            <a href="<c:url value='/admin/notice/list?page=${nph.totalPage}&pageSize=${nph.pageSize}'/>"
               class="bt last">>></a>
            <%--            <a href="#" class="num on">1</a>--%>
        </div>
    </div>
</div>

</body>
</html>
