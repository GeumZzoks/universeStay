<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유저 리스트</title>
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
    <style>
      .screen-admin-userList__container {
        background-color: gainsboro;
        width: 100vw;
        height: 100%;
        position: absolute;
      }

      .screen-admin-userList__container__1 {
        width: 80%;
        height: auto;
        min-height: 550px;
        position: absolute;
        float: left;
        margin: 0 100px 0 230px;
        top: 78px;
        bottom: 25px;
        padding: 0 20px 0 20px;
        background-color: white;
        overflow: auto;
      }

      .screen-admin-userList__container__search-bar {
        box-sizing: border-box;
        position: absolute;
        text-align: right;
        top: 20px;
        right: 20px;
      }

      .screen-admin-userList__container__search-bar button {
        background-color: indianred;
        color: white;
        border: 0;
        border-radius: 2px;
        height: 24px;
      }

      .screen-admin-userList__container__search-bar button:hover {
        cursor: pointer;
        transform: scale(1.02, 1.02);
        transition-duration: 100ms;
      }

      .screen-admin-userList__container__list {
        box-sizing: border-box;
      }

      .screen-admin-userList__container__table {
        box-sizing: border-box;
        background-color: white;
        display: block;
        width: 100%;
        height: 100%;
        table-layout: fixed; /* 테이블의 레이아웃을 고정합니다. */
        word-break: break-all;
        text-overflow: fade;
        white-space: nowrap;
        overflow: hidden;
        border-collapse: separate;
        border-spacing: 20px 20px;
        margin-top: 30px;
      }

      .screen-admin-userList__container__table > thead > tr > th {
        box-sizing: border-box;
        text-align: center;
        border-bottom: 1px solid black;
        font-size: 16px;
        font-weight: 500;
      }

      .screen-admin-userList__container__table > tbody > tr > td {
        font-size: 16px;
        box-sizing: border-box;
        text-decoration: none;
        color: black;
        width: 50px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(1) {
        width: 15%;
        max-width: 150px;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(2) {
        width: 10%;
        max-width: 100px;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(3) {
        width: 25%;
        max-width: 250px;
        text-align: center;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(4) {
        width: 10%;
        max-width: 100px;
        text-align: center;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(5) {
        width: 20%;
        max-width: 200px;
        text-align: center;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(6) {
        width: 15%;
        max-width: 100px;
        text-align: center;
      }

      .screen-admin-userList__container__table > tbody > tr > td:nth-of-type(7) {
        width: 5%;
        max-width: 50px;
        text-align: center;
      }


      .screen-admin-userList__container__table > tbody > tr > td > a {
        box-sizing: border-box;
        text-decoration: none;
        color: black;
      }

      .screen-admin-userList__container__table > tbody > tr > td > a:hover {
        box-sizing: border-box;
        color: indianred;
      }

      .screen-admin-userList__container__page {
        position: absolute;
        display: flex;
        left: 50%;
        transform: translate(-50%, 0);
        bottom: 15px;
      }

      .screen-admin-userList__container__page a {
        box-sizing: border-box;
        font-size: 1rem;
        text-decoration: none;
        color: black;
        padding: 10px;
      }

      .screen-admin-userList__container__page a:hover {
        box-sizing: border-box;
        color: indianred;
        font-weight: bold;
      }

    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/admin/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp" flush="false"/>

<article class="screen-admin-userList__container">
    <section class="screen-admin-userList__container__1">
        <div class="screen-admin-userList__container__search-bar">
            <%--            ?page=10&pageSize=10&option=A&keyword=title  --%>
            <form action="<c:url value="/admin/user/list"/>" method="get">
                <select name="option">
                    <option value="status_id">상태코드</option>
                    <option value="user_nickname">닉네임</option>
                    <option value="user_birth">생일</option>
                </select>
                <input
                        type="text"
                        name="keyword"
                        placeholder="검색어를 입력해주세요."
                />
                <%--                todo 아래 두줄 안 넣어 주면 searchcondition으로 못받음--%>
                <input hidden="hidden" type="text" name="page" value="1"/>
                <input hidden="hidden" type="text" name="pageSize" value="10"/>
                <button type="submit">검색</button>
            </form>
        </div>
        <div class="screen-admin-userList__container__list">
            <h3 style="color: indianred; margin-top: 20px; font-weight: 600;">유저 목록</h3>
            <table class="screen-admin-userList__container__table">

                <thead>
                <tr>
                    <th class="screen-admin-userList__container__table-col1"
                        style="min-width: 150px;">닉네임
                    </th>
                    <th class="screen-admin-userList__container__table-col2"
                        style="min-width: 100px;">이름
                    </th>
                    <th class="screen-admin-userList__container__table-col3"
                        style="min-width: 250px;">이메일
                    </th>
                    <th class="screen-admin-userList__container__table-col4"
                        style="min-width: 100px;">회원상태
                    </th>
                    <th class="screen-admin-userList__container__table-col5"
                        style="min-width: 200px;">마지막로그인
                    </th>
                    <th class="screen-admin-userList__container__table-col6"
                        style="min-width: 100px;">회원가입일
                    </th>
                    <th class="screen-admin-userList__container__table-col7"
                        style="min-width: 50px;">호스트 여부
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="userDto" items="${list}" varStatus="status">
                    <tr>
                        <td class="screen-admin-userList__container__table-col1">
                            <a href="/admin/user/info${ph.getQueryString()}&user_id=${userDto.user_id}">${userDto.user_nickname}</a>
                        </td>
                        <td class="screen-admin-userList__container__table-col2">
                            <a href="/admin/user/info${ph.getQueryString()}&user_id=${userDto.user_id}">${userDto.user_name}</a>
                        </td>
                        <td class="screen-admin-userList__container__table-col3">
                            <a href="/admin/user/info${ph.getQueryString()}&user_id=${userDto.user_id}">${userDto.user_email}</a>
                        </td>
                        </td>
                        <c:choose>
                        <c:when test="${userDto.status_id eq 'U01'}">
                        <td class="screen-admin-userList__container__table-col4"
                            style="color: mediumseagreen">
                            활성</c:when>
                            <c:when test="${userDto.status_id eq 'U02'}">
                        <td class="screen-admin-userList__container__table-col4"
                            style="color: black">휴면</c:when>
                            <c:when test="${userDto.status_id eq 'U03'}">
                        <td class="screen-admin-userList__container__table-col4"
                            style="color: #E61E4D">정지</c:when>
                            <c:otherwise>
                        <td class="screen-admin-userList__container__table-col4"
                            style="color: darkgray">
                            탈퇴</c:otherwise>
                            </c:choose>
                        </td>
                        <td class="screen-admin-userList__container__table-col5">${userDto.user_last_login}</td>
                        <td class="screen-admin-userList__container__table-col6">
                            <fmt:formatDate value="${userDto.created_at}" pattern="yyyy-MM-dd"
                                            type="date"/>
                        </td>
                        <td class="screen-admin-userList__container__table-col7">${userDto.user_is_host}</td>
                            <%-- TODO 이거 왜 넣어야함????? --%>
                        <td hidden="hidden">${userDto}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="screen-admin-userList__container__page">
                <%--  todo <,> 버튼 min, max 넘겼을 때 처리하기  --%>
                <a href="<c:url value='/admin/user/list${ph.getQueryString(1)}'/>">처음</a>
                <a id="prevbtn"
                   href="<c:url value='/admin/user/list${ph.getQueryString(ph.sc.page-1)}'/>"><</a>
                <c:forEach var="page" begin="${ph.beginPage}" end="${ph.endPage}" varStatus="">
                    <a id="pagenum${page}"
                       href="<c:url value="/admin/user/list${ph.getQueryString(page)}"/>">${page}</a>
                </c:forEach>
                <a id="nextbtn"
                   href="<c:url value='/admin/user/list${ph.getQueryString(ph.sc.page+1)}'/>">></a>
                <a href="<c:url value='/admin/user/list${ph.getQueryString(ph.totalPage)}'/>">마지막</a>
            </div>
        </div>
    </section>
</article>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp" flush="false"/>
<script>
    const colorPage = document.getElementById("pagenum${ph.sc.page}");
    colorPage.style.color = "indianred";

    if ('${ph.sc.page}' == 1) document.getElementById("prevbtn").href = "";
    if (${ph.sc.page} == ${ph.totalPage}) document.getElementById("nextbtn").href = "";

</script>
</body>
</html>