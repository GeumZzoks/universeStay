<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/11/26
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%--임시로 사용한 네비게이션 바 jsp입니다 추후 회의 후 언제든 변경할 수 있으니 일단 파일 생성겸 등록해두었습니다.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Navigation</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<aside class="components-admin-navigation">
    <ul class="components-admin-navigation__ul">
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/dashboard.png">대시보드</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/user.png">유저관리</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href="/admin/hostingManagement"><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/host.png">호스팅관리</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/notice.png">공지사항</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a"
                href="/admin/event/list"><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/event.png">이벤트</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/inquiry.png">문의사항</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/coupon.png">쿠폰</a>
        </li>
        <li class="components-admin-navigation__ul-li"><a
                class="components-admin-navigation__ul-li__a" href=""><img
                class="components-admin-navigation__ul-li__img"
                src="/resources/img/admin/navigation/admin2.png">관리자계정</a>
        </li>
    </ul>
</aside>
</body>
</html>
