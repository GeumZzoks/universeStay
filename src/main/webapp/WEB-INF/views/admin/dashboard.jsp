<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.ClientInfoStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 11/27/23
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    DecimalFormat df = new DecimalFormat("###,###");

%>

<html>
<head>
    <title>대시보드</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/navigation.jsp"/>
<jsp:include page="/WEB-INF/views/common/admin/footer.jsp"/>
<%--<div class="screens-admin-dashboard__side-menu">--%>
<%--    <div class="screens-admin-dashboard__brand-logo">--%>
<%--        <img class="screens-admin-dashboard__logo-universe"--%>
<%--             src="/resources/img/admin/navigation/unLogo.png">--%>
<%--    </div>--%>
<%--    <ul>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/user.png"--%>
<%--                 alt=""><a href="/admin/user/list">유저 관리</a></li>--%>
<%--        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/host.png"--%>
<%--                 alt=""><a href="/admin/hostingManagement">호스팅 관리</a>--%>
<%--        </li>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/notice.png" alt=""><a--%>
<%--                href="/admin/notice/list">공지사항</a>--%>
<%--        </li>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/event.png" alt=""><a href="#">이벤트</a></li>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/inquiry.png" alt=""><a href="#">문의사항</a>--%>
<%--        </li>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/coupon.png" alt=""><a href="#">쿠폰</a></li>--%>
<%--        <li><img class="screens-admin-dashboard__img"--%>
<%--                 src="/resources/img/admin/navigation/admin2.png" alt=""><a href="#">관리자 계정</a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>

<div class="screens-admin-dashboard__container">
    <%--    <div class="screens-admin-dashboard__header">--%>
    <%--        <div class="screens-admin-dashboard__nav">--%>
    <%--            <div class="screens-admin-dashboard__search">--%>
    <%--                <input type="text" placeholder="Search">--%>
    <%--                <button type="submit"><img src="/resources/img/admin/header/search.png" alt="검색아이콘">--%>
    <%--                </button>--%>
    <%--            </div>--%>
    <%--            <div class="screens-admin-dashboard__user">--%>
    <%--                <a href="#" class="screens-admin-dashboard__btn">Add New</a>--%>
    <%--                <img src="/resources/img/admin/header/notifications.png" alt="알림아이콘">--%>
    <%--                <div class="screens-admin-dashboard__img-case">--%>
    <%--                    <img src="/resources/img/admin/header/user.png" alt="유저아이콘">--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <div class="screens-admin-dashboard__content">
        <div class="screens-admin-dashboard__cards">
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>${summaryDashBoardMap.totalUser}</h1>
                    <h3>총 가입자</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body"
                         src="/resources/img/admin/navigation/user.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>${summaryDashBoardMap.totalHost}</h1>
                    <h3>총 호스트</h3>
                </div>
                <div class="icon-case">
                    <img class="screens-admin-dashboard__img-body"
                         src="/resources/img/admin/navigation/host.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>${summaryDashBoardMap.totalAccommodation}</h1>
                    <h3>신규 숙소 신청</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body"
                         src="/resources/img/admin/body/home72.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>${summaryDashBoardMap.totalinquiry}</h1>
                    <h3>문의사항</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body"
                         src="/resources/img/admin/navigation/inquiry.png" alt="">
                </div>
            </div>
        </div>

        <div class="screens-admin-dashboard__content-2">
            <div class="screens-admin-dashboard__list-host-management">
                <div class="screens-admin-dashboard__title">
                    <h2>호스팅 관리</h2>
                    <a href="/admin/hostingManagement" class="screens-admin-dashboard__btn">
                        <span>전체 보기</span>
                    </a>
                </div>
                <table class="screens-admin-dashboard__table">
                    <tr>
                        <th class="screens-admin-dashboard__table__common">호스트 ID</th>
                        <th class="screens-admin-dashboard__table__common">숙소 이름</th>
                        <th class="screens-admin-dashboard__table__common__price">주중 1박 요금</th>
                        <th class="screens-admin-dashboard__table__common__price">주말 1박 요금</th>
                        <th class="screens-admin-dashboard__table__common__choose">확인</th>
                    </tr>

                    <c:forEach var="item" items="${listRoom}">
                        <tr>
                            <td class="screens-admin-dashboard__table__common"
                                style="width: 15%;">${item.user_nickname}</td>
                            <td class="screens-admin-dashboard__table__common"
                                style="width: 30%;">${item.room_name}</td>
                            <td class="screens-admin-dashboard__table__common__price">${item.room_weekday_price}</td>
                            <td class="screens-admin-dashboard__table__common__price">${item.room_weekend_price}</td>
                            <td class="screens-admin-dashboard__table__common__price"
                                style="width: 20%">
                                <span
                                        class="screens-admin-dashboard__btn screens-admin-dashboard__btn-span-confirm"
                                        data-value="${item.room_id}">승인</span>
                                <span
                                        class="screens-admin-dashboard__btn screens-admin-dashboard__btn-span-reject"
                                        data-value="${item.room_id}">반려</span>

                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="screens-admin-dashboard__list-inquiry">
                <div class="screens-admin-dashboard__title">
                    <h2>문의사항</h2>
                    <a href="#" class="screens-admin-dashboard__btn" style="right: 2%;">
                        <span>전체 보기</span>
                    </a>
                </div>
                <table>
                    <tr>
                        <th class="screens-admin-dashboard__table__common">문의 제목</th>
                        <th class="screens-admin-dashboard__table__common">사용자 ID</th>
                        <th class="screens-admin-dashboard__table__common">상세보기</th>
                    </tr>

                    <c:forEach var="item" items="${listInquiry}">
                        <tr>
                            <td class="screens-admin-dashboard__table__common">${item.inquiry_title}</td>
                            <td class="screens-admin-dashboard__table__common">${item.user_nickname}</td>
                            <td class="screens-admin-dashboard__table__common">
                                <span class="screens-admin-dashboard__btn screens-admin-dashboard__btn-span-content"
                                      data-value="${item.inquiry_id}">보러가기</span>

                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/js/admin/dashBoard.js"></script>

</body>
</html>
