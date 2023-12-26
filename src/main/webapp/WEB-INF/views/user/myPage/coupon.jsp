<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/18
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

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
    <title>나의 쿠폰</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="screens-user-myCoupon-container">
    <h2>나의 쿠폰</h2>
    <div class="screens-user-myCoupon_list__wrapper">
        <div class="screens-user-myCoupon_list__wrapper__total">보유쿠폰 ${total_cnt}개</div>
        <c:forEach var="userCouponDtos" items="${list}">
            <div class="screens-user-myCoupon__wrapper">
                <h3>${userCouponDtos.coupon_name}</h3>
                <div class="screens-user-myCoupon__wrapper__use" onclick="location.href='/'">
                    <img id="screens-user-myCoupon__wrapper__use__img"
                         src="/resources/img/admin/body/home72.png">
                </div>
                <h4 class="screens-user-myCoupon_list__wrapper__date">
                    유효기간 ${userCouponDtos.coupon_usable_day}일<br>
                    발급일 <fmt:parseDate
                        value="${userCouponDtos.user_coupon_issue_date}"
                        var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/></h4>
                <c:choose>
                    <c:when test="${userCouponDtos.coupon_type eq '정액할인'}">
                        <h4 class="screens-user-myCoupon_list__wrapper__discount">
                            <fmt:formatNumber type="number" maxFractionDigits="3"
                                              value="${userCouponDtos.coupon_discount_amount}"/>원</h4>
                        <h4 class="screens-user-myCoupon_list__wrapper__discount__limit">최소 결제
                            금액 <br> ₩${userCouponDtos.coupon_discount_limit}</h4>
                    </c:when>
                    <c:otherwise>
                        <h4 class="screens-user-myCoupon_list__wrapper__discount">
                                ${userCouponDtos.coupon_discount_rate}%</h4>
                        <h4 class="screens-user-myCoupon_list__wrapper__discount__limit">최대 할인
                            금액 <br> ₩${userCouponDtos.coupon_discount_limit}</h4>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
</body>
</html>
