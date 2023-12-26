<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/22
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>공지사항 - UNIVERSESTAY</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/img/favi.ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/img/favi.ico//apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/img/favi.ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/favi.ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="/resources/img/favi.ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="/resources/img/favi.ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144"
          href="/resources/img/favi.ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="/resources/img/favi.ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180"
          href="/resources/img/favi.ico/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"
          href="/resources/img/favi.ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32"
          href="/resources/img/favi.ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96"
          href="/resources/img/favi.ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16"
          href="/resources/img/favi.ico/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
      .paging {
        color: black;
        width: 100%;
        align-items: center;
      }

      .page {
        color: black;
        padding: 6px;
        margin-right: 10px;
      }

      .page:active {
        background-color: indianred;
      }

      .paging:active {
        color: indianred;
      }

      .paging-container {
        height: 10px;
        display: flex;
        position: absolute;
        left: 50%;
        bottom: 30px;
        transform: translate(-50%, 0);
        z-index: 5;
      }
    </style>
</head>
<body>
<script>
    let msg = "${msg}";
    if (msg == "DEL_OK") alert("게시물이 삭제되었습니다.");
    if (msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
    if (msg == "MOD_NOT") alert("삭제되었거나 없는 게시물입니다.")
</script>
<div class="screens-admin-event__container">
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>

    <div class="screens-admin-event__content">
        <h3 style="color: indianred; margin-top: 20px">공지사항</h3>
        <form action="<c:url value='/admin/notice/list'/>"
              class="screens-admin-event__content-search" method="get"
              style="width:150px; height: 24px;">
            <select class="screens-admin-event__content-search-option" name="option">
                <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목</option>
                <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
            </select>
            <input type="text" name="keyword" class="screens-admin-event__content-search-input"
                   type="text"
                   value=""
                   placeholder="검색어를 입력해주세요">
            <input type="submit" class="screens-admin-event__content-search__btn" value="검색">

        </form>

        <div class="screens-admin-event__content-table-div">
            <table class="screens-admin-event__content-table" style="table-layout: fixed">
                <tr>
                    <th class="screens-admin-event__content-table__no" style="font-size: 14px;">번호
                    </th>
                    <th class="screens-admin-event__content-table__title"
                        style="text-align: center">공지사항
                    </th>
                    <th class="screens-admin-event__content-table__writer" style="font-size: 14px;">
                        작성자
                    </th>
                    <th class="screens-admin-event__content-table__status" style="font-size: 14px;">
                        공개여부
                    </th>
                    <th class="screens-admin-event__content-table__regdate"
                        style="font-size: 14px;">등록일
                    </th>
                </tr>
                <c:forEach var="notice" items="${list}">
                    <tr>
                        <td class="screens-admin-event__content-table__no">${notice.notice_id}</td>
                        <td class="screens-admin-event__content-table__title"><a
                                href="<c:url value="/admin/notice/${notice.notice_id}"/>"
                                class="screens-admin-event__content-table__title__a">${notice.notice_title}</a>
                        </td>
                        <td class="screens-admin-event__content-table__writer">${notice.admin_nickname}</td>
                        <c:choose>
                            <c:when test="${notice.notice_is_open eq 'Y'}">
                                <td class="screens-admin-event__content-table__status"
                                    style="color: indianred">공개
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td class="screens-admin-event__content-table__status">비공개</td>
                            </c:otherwise>
                        </c:choose>
                        <td class="screens-admin-event__content-table__regdate">
                            <fmt:formatDate
                                    value="${notice.created_at}"
                                    pattern="yyyy-MM-dd" type="date"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br>

        <div class="screens-admin-event__content-bottom">
            <button class="screens-admin-event__content-bottom__btn"
                    onclick="location.href='/admin/notice/write'">등록
            </button>
        </div>
        <div class="paging-container">
            <div class="paging">
                <a href="<c:url value='/admin/notice/list?page=1&pageSize=${nph.pageSize}'/>"
                   class="page"><<</a>
                <c:if test="${nph.showPrev}">
                    <a href="<c:url value='/admin/notice/list?page=${nph.beginPage-1}&pageSize=${nph.pageSize}'/>"
                       class="page"><</a>
                </c:if>
                <c:forEach var="i" begin="${nph.beginPage}" end="${nph.endPage}">
                    <a href="<c:url value='/admin/notice/list?page=${i}&pageSize=${nph.pageSize}'/>"
                       class="page">${i}</a>
                </c:forEach>
                <c:if test="${nph.showNext}">
                    <a href="<c:url value='/admin/notice/list?page=${nph.endPage+1}&pageSize=${nph.pageSize}'/>"
                       class="page">></a>
                </c:if>
                <a href="<c:url value='/admin/notice/list?page=${nph.totalPage}&pageSize=${nph.pageSize}'/>"
                   class="page">>></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
