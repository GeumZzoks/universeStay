<%--
  Created by IntelliJ IDEA.
  User: janghojin
  Date: 2023/12/18
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>이벤트</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>

<div class="screens-user-eventDetail-container">
    <h2 onclick="location.href='/event'"><span style="color: #F48475;"><</span> 이벤트</h2>
    <div class="screens-user-eventDetail-wrapper">
        <h3>${eventDto.event_title}</h3>
        <div class="screens-user-eventDetail-img">
            <img src="${eventDto.img}">
            <c:choose>
                <c:when test="${couponDto.coupon_name eq null}">
                </c:when>
                <c:otherwise>
                    <div class="screens-user-eventDetail-Coupon__issue">
                        <div class="screens-user-eventDetail-Coupon__wrapper">
                            <h3>${couponDto.coupon_name}</h3>
                            <div class="screens-user-eventDetail-Coupon__wrapper__use" onclick="location.href='/'">
                                <img id="screens-user-eventDetail-Coupon__wrapper__use__img"
                                     src="/resources/img/admin/body/home72.png">
                            </div>
                            <h4 class="screens-user-eventDetail-Coupon_list__wrapper__date">
                                유효기간 ${couponDto.coupon_usable_day}일<br>
                                <c:choose>
                                <c:when test="${couponDto.coupon_type eq '정액할인'}">
                                <h4 class="screens-user-eventDetail-Coupon_list__wrapper__discount">
                                    <fmt:formatNumber type="number" maxFractionDigits="3"
                                                      value="${couponDto.coupon_discount_amount}"/>원</h4>
                                <h4 class="screens-user-eventDetail-Coupon_list__wrapper__discount__limit">최소 결제
                                    금액 <br> ₩${couponDto.coupon_discount_limit}</h4>
                                </c:when>
                                <c:otherwise>
                                <h4 class="screens-user-eventDetail-Coupon_list__wrapper__discount">
                                        ${couponDto.coupon_discount_rate}%</h4>
                                <h4 class="screens-user-eventDetail-Coupon_list__wrapper__discount__limit">최대 할인
                                    금액 <br> ₩${couponDto.coupon_discount_limit}</h4>
                                </c:otherwise>
                                </c:choose>
                        </div>
                        <button id="getCoupon" class="screens-user-eventDetail-btn" value="${eventDto.event_id}">
                            <img src="/resources/img/user/issue.png">
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="screens-user-eventDetail-content">
            <h4 style="font-size: 16px; font-weight: 500;">∇ 유의사항</h4><br>
            <h4 style="margin-bottom: 20px;">이벤트 기간 :
                <fmt:parseDate value="${eventDto.event_start_date}" var="dateFmt"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
                ~
                <fmt:parseDate value="${eventDto.event_expire_date}" var="dateFmt"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/></h4>
            <h4 style="white-space: pre;">${eventDto.event_ctt}</h4>
        </div>
        <div style="height: 150px"></div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#getCoupon').on('click', function getCoupon() {
            var event_id = $(this).val()

            $.ajax({
                url: "/user/myPage/coupon/issue",
                type: "POST",
                dataType: "text",
                data: {event_id: event_id},
                success: function (response) {
                    if (response === 'ISSUE_OK')
                        alert("쿠폰이 발급되었습니다.")
                    else if (response === "ISSUED") {
                        alert("이미 발급된 쿠폰입니다.")
                    } else {
                        alert("로그인이 필요합니다.")
                        location.href = '/user/loginForm';
                    }
                },
                error: function () {
                    alert("쿠폰 발급이 실패하였습니다.")
                }
            })
        })
    })
</script>
</body>
</html>
