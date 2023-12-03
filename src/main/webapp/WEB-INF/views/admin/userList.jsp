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
            left: 230px;
            top: 100px;
            width: calc(100% - 290px);
            height: calc(100% - 120px);
        }

        .screen-admin-userList__container__1 {
            box-sizing: border-box;
            position: absolute;
            top: 30px;
            left: 50px;
        }

        .screen-admin-userList__container__search-bar {
            box-sizing: border-box;
            text-align: right;
        }

        .screen-admin-userList__container__list {
            box-sizing: border-box;
        }

        .screen-admin-userList__container__table {
            box-sizing: border-box;
            margin-top: 10px;
            border: 2px solid lightgray;
            border-radius: 20px;
            background-color: white;
            display: block;
            width: 1400px;
            height: 500px;
            border-collapse: separate;
            border-spacing: 0 1rem;
            table-layout: fixed;
            word-break: break-all;
            text-overflow: fade;
            white-space: nowrap;
            overflow: hidden;
        }

        .screen-admin-userList__container__table > thead > tr > th {
            box-sizing: border-box;
            text-align: center;
            border-bottom: 1px solid black;
            width: 50px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space:nowrap;
        }

        .screen-admin-userList__container__table > tbody > tr > td {
            box-sizing: border-box;
            text-decoration: none;
            color: black;
            width: 50px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space:nowrap;
        }

        .screen-admin-userList__container__table {
            /*width: 350px;*/

        }

        .screen-admin-userList__container__table-col1 {  width: 100px; color: green;  background: green;   }
        .screen-admin-userList__container__table-col2 {  width: 100px;     }
        .screen-admin-userList__container__table-col3 {  width: 100px;     }
        .screen-admin-userList__container__table-col4 {  width: 100px;     }
        .screen-admin-userList__container__table-col5 {  width: 500px;     }
        .screen-admin-userList__container__table-col6 {  width: 100px;     }
        .screen-admin-userList__container__table-col7 {  width: 100px;     }

        .screen-admin-userList__container__table > tbody > tr > td > a {
            box-sizing: border-box;
            text-decoration: none;
            color: black;
        }

        .screen-admin-userList__container__table > tbody > tr > td > a:hover {
            box-sizing: border-box;
            font-weight: bold;
        }

        .screen-admin-userList__container__page a {
            box-sizing: border-box;
            font-size: 1.2rem;
            text-decoration: none;
            color: black;
            padding: 15px;
        }

        .screen-admin-userList__container__page a:hover {
            box-sizing: border-box;
            font-weight: bold;
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
                    <th class="screen-admin-userList__container__table-col1">ID</th>
                    <th class="screen-admin-userList__container__table-col2">이름</th>
                    <th class="screen-admin-userList__container__table-col3">닉네임</th>
                    <th class="screen-admin-userList__container__table-col4">회원상태</th>
                    <th class="screen-admin-userList__container__table-col5">마지막로그인</th>
                    <th class="screen-admin-userList__container__table-col6">회원가입일</th>
                    <th class="screen-admin-userList__container__table-col7">호스트 여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="userDto" items="${list}" varStatus="status">
                    <tr>
                        <td class="screen-admin-userList__container__table-col1"><a href="/admin/user/info${ph.getQueryString()}&user_id=${userDto.user_id}">${userDto.user_id}</a></td>
                        <td class="screen-admin-userList__container__table-col2">${userDto.user_name}</td>
                        <td class="screen-admin-userList__container__table-col3">${userDto.user_nickname}</td>
                        <td class="screen-admin-userList__container__table-col4">${userDto.status_id}</td>
                        <td class="screen-admin-userList__container__table-col5">${userDto.user_last_login}</td>
                        <td class="screen-admin-userList__container__table-col6">${userDto.created_at}</td>
                        <td class="screen-admin-userList__container__table-col7">${userDto.user_is_host}</td>
                            <%-- TODO 이거 왜 넣어야함????? --%>
                        <td hidden="hidden">${userDto}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="screen-admin-userList__container__page">
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