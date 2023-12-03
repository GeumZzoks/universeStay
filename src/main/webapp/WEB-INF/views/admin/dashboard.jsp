<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sungwoo
  Date: 11/27/23
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>대시보드</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/resources/css2/screens/admin/dashboard.css">
</head>
<body>
<div class="screens-admin-dashboard__side-menu">
    <div class="screens-admin-dashboard__brand-logo">
        <img class="screens-admin-dashboard__logo-universe" src="/resources/img/admin/navigation/unLogo.png">
    </div>
    <ul>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/dashboard.png" alt="">&nbsp; <span>대시보드</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/user.png" alt="">&nbsp;<span>유저 관리</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/host.png" alt="">&nbsp;<span>호스팅 관리</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/notice.png" alt="">&nbsp;<span>공지사항</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/event.png" alt="">&nbsp;<span>이벤트</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/inquiry.png" alt="">&nbsp; <span>문의사항</span></li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/coupon.png" alt="">&nbsp;<span>쿠폰</span> </li>
        <li><img class="screens-admin-dashboard__img" src="/resources/img/admin/navigation/admin2.png" alt="">&nbsp;<span>관리자 계정</span> </li>
    </ul>
</div>
<div class="screens-admin-dashboard__container">
    <div class="screens-admin-dashboard__header">
        <div class="screens-admin-dashboard__nav">
            <div class="screens-admin-dashboard__search">
                <input type="text" placeholder="Search..">
                <button type="submit"><img src="/resources/img/test/search.png" alt=""></button>
            </div>
            <div class="screens-admin-dashboard__user">
                <a href="#" class="screens-admin-dashboard__btn">Add New</a>
                <img src="/resources/img/test/notifications.png" alt="">
                <div class="screens-admin-dashboard__img-case">
                    <img src="/resources/img/test/user.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <div class="screens-admin-dashboard__content">
        <div class="screens-admin-dashboard__cards">
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>2194</h1>
                    <h3>총 가입자 수</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body" src="/resources/img/admin/navigation/user.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>53</h1>
                    <h3>총 호스트 수</h3>
                </div>
                <div class="icon-case">
                    <img class="screens-admin-dashboard__img-body" src="/resources/img/admin/navigation/host.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>5</h1>
                    <h3>숙소 신청 수</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body" src="/resources/img/admin/body/home72.png" alt="">
                </div>
            </div>
            <div class="screens-admin-dashboard__card">
                <div class="screens-admin-dashboard__box">
                    <h1>350000</h1>
                    <h3>문의사항 수</h3>
                </div>
                <div class="screens-admin-dashboard__icon-case">
                    <img class="screens-admin-dashboard__img-body" src="/resources/img/admin/navigation/inquiry.png" alt="">
                </div>
            </div>
        </div>
        <div class="screens-admin-dashboard__content-2">
            <div class="screens-admin-dashboard__recent-payments">
                <div class="screens-admin-dashboard__title">
                    <h2>Recent Payments</h2>
                    <a href="#" class="screens-admin-dashboard__btn">View All</a>
                </div>
                <table class="screens-admin-dashboard__table">
                    <tr>
                        <th class="screens-admin-dashboard__table__common">Name</th>
                        <th class="screens-admin-dashboard__table__common">School</th>
                        <th class="screens-admin-dashboard__table__common">Amount</th>
                        <th class="screens-admin-dashboard__table__common">Option</th>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common">John Doe</td>
                        <td class="screens-admin-dashboard__table__common">St. James College</td>
                        <td class="screens-admin-dashboard__table__common">$120</td>
                        <td class="screens-admin-dashboard__table__common"><a href="#" class="screens-admin-dashboard__btn">View</a></td>
                    </tr>
                </table>
            </div>
            <div class="screens-admin-dashboard__new-students">
                <div class="screens-admin-dashboard__title">
                    <h2>New Students</h2>
                    <a href="#" class="screens-admin-dashboard__btn">View All</a>
                </div>
                <table>
                    <tr>
                        <th class="screens-admin-dashboard__table__common">Profile</th>
                        <th class="screens-admin-dashboard__table__common">Name</th>
                        <th class="screens-admin-dashboard__table__common">option</th>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/user.png" alt=""></td>
                        <td class="screens-admin-dashboard__table__common">John Steve Doe</td>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/info.png" alt=""></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/user.png" alt=""></td>
                        <td class="screens-admin-dashboard__table__common">John Steve Doe</td>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/info.png" alt=""></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/user.png" alt=""></td>
                        <td class="screens-admin-dashboard__table__common">John Steve Doe</td>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/info.png" alt=""></td>
                    </tr>
                    <tr>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/user.png" alt=""></td>
                        <td class="screens-admin-dashboard__table__common">John Steve Doe</td>
                        <td class="screens-admin-dashboard__table__common"><img src="/resources/img/test/info.png" alt=""></td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
