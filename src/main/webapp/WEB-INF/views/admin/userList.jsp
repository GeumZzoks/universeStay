<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>유저 리스트</title>
    <style>

        .screen-admin-userList__container {
            box-sizing: border-box;
            position: fixed;
            overflow: auto;
            left: 250px;
            top: 70px;
            width: calc(100% - 290px);
            height: calc(100% - 90px);
        }

        .screen-admin-userList__container__1 {
            position: absolute;
            top: 30px;
            left: 50px;
        }

        .screen-admin-userList__container__search-bar {
            text-align: right;
        }

        .screen-admin-userList__container__list {

        }

        .screen-admin-userList__container__table {
            margin-top: 10px;
            border: 2px solid lightgray;
            border-radius: 20px;
            background-color: white;
            display: block;
            width: 1400px;
            height: 600px;
            border-collapse: separate;
            border-spacing: 0 1rem;
        }

        .screen-admin-userList__container__table > thead > tr > td {
            text-align: center;
            border-bottom: 1px solid black;
        }

        .screen-admin-userList__container__table > tbody > tr > td > a {
            text-decoration: none;
            color: black;
        }

        .screen-admin-userList__container__table > tbody > tr > td > a:hover {
            font-weight: bold;
        }

        .screen-admin-userList__container__page a {
            text-decoration: none;
            color: black;
            padding: 15px;
        }

    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/common/admin/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/common/admin/footer.jsp" flush="false"/>

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
            <table class="screen-admin-userList__container__table">
                <caption style="margin: 30px; font-size: 2rem;">유저 목록</caption>
                <thead>
                <tr>
                    <td style="width: 350px">ID</td>
                    <td style="width: 150px">이름</td>
                    <td style="width: 150px">닉네임</td>
                    <td style="width: 100px">회원상태</td>
                    <td style="width: 230px">마지막로그인</td>
                    <td style="width: 230px">회원가입일</td>
                    <td style="width: 100px">호스트 여부</td>
                </tr>
                </thead>
                <tbody style="margin: 30px;">
                <c:forEach var="userDto" items="${list}" varStatus="status">
                    <tr>
                        <td class="" style="text-align: center;"><a
                                href="/admin/user/info${ph.getQueryString()}&user_id=${userDto.user_id}">${userDto.user_id}</a>
                        </td>
                        <td style="text-align: center;">${userDto.user_name}</td>
                        <td style="text-align: center;">${userDto.user_nickname}</td>
                        <td style="text-align: center;">${userDto.status_id}</td>
                        <td style="text-align: center;">${userDto.user_last_login}</td>
                        <td style="text-align: center;">${userDto.created_at}</td>
                        <td style="text-align: center;">${userDto.user_is_host}</td>
                            <%-- TODO 이거 왜 넣어야함????? --%>
                        <td hidden="hidden">${userDto}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="screen-admin-userList__container__page" style="text-align: center; margin-top: 20px;">
            <%--  todo <,> 버튼 min, max 넘겼을 때 처리하기  --%>
            <a href="<c:url value='/admin/user/list${ph.getQueryString(1)}'/>">처음</a>
            <a id="prevbtn" href="<c:url value='/admin/user/list${ph.getQueryString(ph.sc.page-1)}'/>"><</a>
            <c:forEach var="page" begin="${ph.beginPage}" end="${ph.endPage}" varStatus="">
                <a id="pagenum${page}" href="<c:url value="/admin/user/list${ph.getQueryString(page)}"/>">${page}</a>
            </c:forEach>
            <a id="nextbtn" href="<c:url value='/admin/user/list${ph.getQueryString(ph.sc.page+1)}'/>">></a>
            <a href="<c:url value='/admin/user/list${ph.getQueryString(ph.totalPage)}'/>">마지막</a>
        </div>
    </section>
</article>
<script>
    var colorPage = document.getElementById("pagenum${ph.sc.page}");
    colorPage.style.backgroundColor = "gray";

    if ('${ph.sc.page}' == 1) document.getElementById("prevbtn").href = "";
    if (${ph.sc.page} == ${ph.totalPage}) document.getElementById("nextbtn").href = "";

</script>
</body>
</html>