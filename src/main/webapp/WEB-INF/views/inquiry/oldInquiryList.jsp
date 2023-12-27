<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JKM
  Date: 2023-12-04
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>문의사항 리스트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <style>
      .screens-admin-inquiryList__body * {
        box-sizing: border-box;
      }

      .screens-admin-inquiryList__container {
        background: gainsboro;
        width: 100%;
        height: 100%;
      }

      .screens-admin-inquiryList__content {
        position: absolute;
        top: 100px;
        left: 300px;
      }

      .screens-admin-inquiryList__search-bar {
        text-align: right;
        margin-bottom: 20px;
      }

      .screens-admin-inquiryList__search-bar * {
        font-size: 15px;
      }

      .screens-admin-inquiryList__table {
        box-sizing: border-box;
        border: black 1px solid;
        border-radius: 20px;
        border-collapse: separate;
        border-spacing: 30px 30px;
      }

      .screens-admin-inquiryList__table > * > tr > * {
        text-align: center;
        font-size: 20px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }

      .screens-admin-inquiryList__table-col1 {
        width: 50px;
        max-width: 50px;
      }

      .screens-admin-inquiryList__table-col2 {
        width: 200px;
        max-width: 200px;
        text-align: left;
      }

      .screens-admin-inquiryList__table-col3 {
        width: 350px;
        max-width: 350px;
        text-align: left;
      }

      .screens-admin-inquiryList__table-col4 {
        width: 130px;
        max-width: 130px;
      }

      .screens-admin-inquiryList__table-col5 {
        width: 110px;
        max-width: 110px;
      }

      .screens-admin-inquiryList__table-col6 {
        width: 150px;
        max-width: 150px;
      }

      .screens-admin-inquiryList__table-col7 {
        width: 60px;
        max-width: 60px;
      }

      .screens-admin-inquiryList__table-col8 {
        width: 80px;
        max-width: 80px;
      }

      .screens-admin-inquiryList__table-col9 {
        width: 80px;
        max-width: 80px;
      }

      .screens-admin-inquiryList__page {
        text-align: center;
        margin-top: 20px;
        font-size: 17px;
      }

      .screens-admin-inquiryList__page * {
      }

    </style>
</head>
<body class="screens-admin-inquiryList__body">
<div class="screens-admin-inquiryList__container">
    <jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
    <div class="screens-admin-inquiryList__content">
        <div class="screens-admin-inquiryList__search-bar">
            <form action="<c:url value="/admin/inquiry/list"/>" method="get">
                <select name="option" size="1">
                    <option>선택</option>
                    <option value="inquiry_is_answered">답변여부</option>
                    <option value="user_id">유저 ID</option>
                    <option value="inquiry_title">문의사항 제목</option>
                </select>
                <input type="text" name="keyword" placeholder="..."/>
                <button type="submit">검색</button>
            </form>
        </div>
        <table class="screens-admin-inquiryList__table">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>유저 ID</th>
                <th>유저 닉네임</th>
                <th>등록일</th>
                <th>조회수</th>
                <th>공개여부</th>
                <th>답변여부</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dto" items="${list}">
                <tr>
                    <td class="screens-admin-inquiryList__table-col1">${dto.inquiry_id}</td>
                    <td class="screens-admin-inquiryList__table-col2"><a
                            href="/admin/inquiry/details${ph.getQueryString()}&inquiry_id=${dto.inquiry_id}">${dto.inquiry_title}</a>
                    </td>
                    <td class="screens-admin-inquiryList__table-col3">${dto.inquiry_ctt}</td>
                    <td class="screens-admin-inquiryList__table-col4">${dto.user_id}</td>
                    <td class="screens-admin-inquiryList__table-col5">유저닉네임</td>
                    <td class="screens-admin-inquiryList__table-col6">${dto.created_at}</td>
                    <td class="screens-admin-inquiryList__table-col7">${dto.inquiry_hit}</td>
                    <td class="screens-admin-inquiryList__table-col8">${dto.inquiry_is_open}</td>
                    <td class="screens-admin-inquiryList__table-col9">${dto.inquiry_is_answered}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            </tfoot>
        </table>
        <div class="screens-admin-inquiryList__page">
            <a href="<c:url value='/admin/inquiry/list${ph.getQueryString(1)}'/>">처음</a>
            <c:choose>
                <c:when test="${ph.sc.page ne 1}">
                    <a href="<c:url value='/admin/inquiry/list${ph.getQueryString(ph.sc.page-1)}'/>"><</a>
                </c:when>
                <c:when test="${ph.sc.page eq 1}">
                    <a href="#;"><</a>
                </c:when>
            </c:choose>
            <c:forEach var="page" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="screens-admin-inquiryList__page-${page}"
                   href="<c:url value='/admin/inquiry/list${ph.getQueryString(page)}'/>">${page}</a>
            </c:forEach>
            <c:choose>
                <c:when test="${ph.sc.page ne ph.totalPage }">
                    <a href="<c:url value="/admin/inquiry/list${ph.getQueryString(ph.sc.page+1)}"/>">></a>
                </c:when>
                <c:when test="${ph.sc.page eq ph.totalPage}">
                    <a href="#;">></a>
                </c:when>
            </c:choose>
            <a href="<c:url value='/admin/inquiry/list${ph.getQueryString(ph.totalPage)}'/>">마지막</a>
        </div>
    </div>
</div>
<script>
    var colorPage = document.querySelector(".screens-admin-inquiryList__page-${ph.sc.page}");
    colorPage.style.backgroundColor = "white";
</script>
</body>
</html>
