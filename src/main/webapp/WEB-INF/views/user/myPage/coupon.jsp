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
                    <img id="screens-user-myCoupon__wrapper__use__img" src="/resources/img/admin/body/home72.png">
                </div>
                <h4 class="screens-user-myCoupon_list__wrapper__date">유효기간 ${userCouponDtos.coupon_usable_day}일<br>
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
