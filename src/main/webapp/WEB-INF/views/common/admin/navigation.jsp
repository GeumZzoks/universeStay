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
    <style>
        .navigation {
            position: fixed;
            width: 200px;
            top: 70px;
            bottom: 20px;
            left: 10px;
            border-radius: 10px;
            background-color: dimgrey;
            z-index: 1;
        }

        .navigation-ul {
            margin-top: 70px;
        }

        .navigation-ul-li {
            list-style-type: none;
            margin-top: 40px;
            width: 210px;
            text-align: left;
        }

        .navigation-ul-li__a {
            text-decoration: none;
            color: white;
            cursor: pointer;
            font-weight: 500;
        }

        .navigation-ul-li__a:hover {
            transition-duration: 200ms;
            color: black;
        }

        .navigation-ul-li__img {
            width: 20px;
            height: 20px;
            vertical-align: bottom;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<aside class="navigation">
    <ul class="navigation-ul">
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/dashboard.png">대시보드</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/user.png">유저관리</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/host.png">호스팅관리</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/notice.png">공지사항</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/event.png">이벤트</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/inquiry.png">문의사항</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/coupon.png">쿠폰</a>
        </li>
        <li class="navigation-ul-li"><a class="navigation-ul-li__a" href=""><img class="navigation-ul-li__img"
                                                                                 src="/resources/img/admin/navigation/admin2.png">관리자계정</a>
        </li>
    </ul>
</aside>
</body>
</html>
