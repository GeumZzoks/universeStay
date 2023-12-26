<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA..
  User: JKM
  Date: 2023-12-08
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking</title>
    <link rel="stylesheet" href="/resources/css2/style.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body class="screens-room-myBookings__body">
<jsp:include page="/WEB-INF/views/common/user/header.jsp"/>
<div class="screens-room-myBookings__modalContainer">
    <div class="screens-room-myBookings__modalContent">
        <form action="<c:url value='/user/myPage/mybookings/writereview'/>" method="post"
              class="screens-room-myBookings__modalContent__form">
            <div class="screens-room-myBookings__modalContent__title">별점을 선택하고 리뷰를 작성해주세요.</div>
            <div class="screens-room-myBookings__modalContent__starBox">
                <ul style="margin-left: 50px; margin-right: 50px;">
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="1"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="2"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="3"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="4"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="5"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="6"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="7"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="8"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__leftStar"
                        data-index="9"></li>
                    <li class="screens-room-myBookings__modalContent__star screens-room-myBookings__modalContent__rightStar"
                        data-index="10"></li>
                </ul>
            </div>
            <input type="hidden" name="review_stars">
            <input type="hidden" name="room_id">
            <input type="hidden" name="booking_id">
            <textarea type="text" name="review_ctt"
                      placeholder="유니버스스테이에서의 숙박 경험을 공유해주세요:)"></textarea>
            <div class="screens-room-myBookings__modalContent__button-box">
                <button type="submit"
                        class="screens-room-myBookings__button screens-room-myBookings__write-review-button">
                    등록
                </button>
                <button type="button" class="screens-room-myBookings__button"
                        onclick="cancelInsertReview()">취소
                </button>
            </div>
        </form>
    </div>
</div>


<section class="screens-room-myBookings">

    <div class="screens-room-myBookings__title">여행</div>
    <div class="screens-room-myBookings__total-wrapper">
        <div class="screens-room-myBookings__wrapper">

            <div class="screens-room-myBookings__comming-reservation">
                <div class="screens-room-myBookings__comming-reservation__title">예정된 예약</div>
                <div class="screens-room-myBookings__comming-reservation__wrapper">
                    <c:forEach var="dto" items="${list1}" varStatus="status">
                        <div class="screens-room-myBookings__comming-reservation__div">
                            <div class="screens-room-myBookings__comming-reservation__div__info">
                                <div class="screens-room-myBookings__comming-reservation__div__status_id">
                                    <c:choose>
                                        <c:when test="${dto.booking_status_id == 'B01'}">
                                            승인 대기
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B02' && (dto.payment_id == null || dto.payment_is_approved == null || dto.payment_is_approved == 'N')}">
                                            결제 대기
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B02' && dto.payment_id != null && dto.payment_is_approved != null && dto.payment_is_approved == 'Y'}">
                                            결제 완료
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B03'}">
                                            예약 취소
                                        </c:when>
                                        <c:when test="${dto.booking_status_id == 'B04'}">
                                            예약 반려
                                        </c:when>
                                        <c:otherwise>
                                            오류
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div>
                                    <div class="screens-room-myBookings__hiddenValue" hidden
                                         data-value="${dto.booking_id}"></div>
                                    <div class="screens-room-myBookings__comming-reservation__name">${dto.user_nickname}님이
                                        호스팅하는 집 전체
                                    </div>
                                </div>


                                <div>
                                    <span class="screens-room-myBookings__comming-gray-font">여행 날짜: ${dto.booking_checkin_date} ~ </span><span
                                        class="screens-room-myBookings__comming-gray-font">${dto.booking_checkout_date}</span>
                                </div>

                                <div>
                                    <span class="screens-room-myBookings__comming-gray-font">장소: ${dto.room_address}</span>
                                    <span class="screens-room-myBookings__comming-gray-font">${dto.room_address_detail}</span>
                                </div>
                                <div>
                                    <span class="screens-room-myBookings__comming-reservation__pay-amount screens-room-myBookings__comming-gray-font">총 금액: ${dto.booking_total_pay_amount}</span><span
                                        class="screens-room-myBookings__comming-gray-font">원</span>
                                </div>
                                <div class="screens-room-myBookings__comming-gray-font">예약한
                                    날짜: ${dto.created_at}</div>

                                <div class="screens-room-myBookings__payment-button-card-div">
                                    <button class="screens-room-myBookings__payment-button-card screens-room-myBookings__button">
                                        카드결제
                                    </button>
                                    <button class="screens-room-myBookings__payment-button-kakao screens-room-myBookings__button">
                                        카카오페이
                                    </button>
                                    <button class="screens-room-myBookings__cancel-button screens-room-myBookings__button">
                                        예약 취소
                                    </button>
                                    <button class="screens-room-myBookings__refund-button screens-room-myBookings__button">
                                        예약 취소/환불
                                    </button>
                                </div>
                            </div>

                            <div class="screens-room-myBookings__comming-reservation__main-photo__wrapper">
                                <img class="screens-room-myBookings__comming-reservation__main-photo"
                                     src="${dto.room_main_photo}">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="screens-room-myBookings__divide-line"></div>

            <div class="screens-room-myBookings__completed-reservation">
                <div class="screens-room-myBookings__completed-reservation__title">이전여행지</div>

                <div class="screens-room-myBookings__completed-reservation__wrapper">
                    <c:forEach var="dto" items="${list2}" varStatus="status">
                        <div class="screens-room-myBookings__completed-reservation__div">
                            <div class="screens-room-myBookings__completed-reservation-hiddenValue"
                                 hidden
                                 data-value="${dto.booking_id}"></div>
                            <div class="screens-room-myBookings__completed-reservation__main-photo__wrapper">
                                <img class="screens-room-myBookings__completed-reservation__main-photo"
                                     src="${dto.room_main_photo}">
                            </div>
                            <div class="screens-room-myBookings__completed-reservation__div__info">
                                <div class="screens-room-myBookings__comming-gray-font">
                                    지역: ${dto.room_address}</div>
                                <div class="screens-room-myBookings__comming-gray-font">
                                    호스트: ${dto.user_nickname}</div>
                                <div class="screens-room-myBookings__comming-gray-font">여행
                                    날짜: ${dto.booking_checkin_date}
                                    ~ ${dto.booking_checkout_date}</div>
                                <c:choose>
                                    <c:when test="${dto.is_user_review eq 'Y'}">
                                        <button class="screens-room-myBookings__button screens-room-myBookings__reviewWriteBtn screens-room-myBookings__reviewWriteBtn-${dto.booking_id}"
                                                disabled
                                                style="background-color: #DDDDDD;">리뷰 완료
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="screens-room-myBookings__button screens-room-myBookings__reviewWriteBtn screens-room-myBookings__reviewWriteBtn-${dto.booking_id}"
                                                data-room-id="${dto.room_id}"
                                                data-booking-id="${dto.booking_id}">리뷰쓰기
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>


        </div>
    </div>


</section>
<%--<jsp:include page="/WEB-INF/views/common/user/footer.jsp"/>--%>
<script>
    let room_id2 = null;
    let booking_id2 = null;
    let review_stars2 = 0;
    let rating = 'null';

    const reviewWriteBtn = document.querySelectorAll(".screens-room-myBookings__reviewWriteBtn");
    const modalContainer = document.querySelector(".screens-room-myBookings__modalContainer");
    const starBox = document.querySelector(".screens-room-myBookings__modalContent__starBox");
    const stars = document.querySelectorAll(".screens-room-myBookings__modalContent__star");

    const ing_checkin = document.querySelectorAll('.screens-room-myBookings-ing-checkin');
    const ing_checkout = document.querySelectorAll('.screens-room-myBookings-ing-checkout');
    const ing_year = document.querySelectorAll('.screens-room-myBookings-ing-year');

    const reservationStatusIds = document.querySelectorAll(
            ".screens-room-myBookings__comming-reservation__div__status_id");

    stars.forEach(function (star) {
        star.addEventListener("click", function (e) {
            rating = e.target.getAttribute('data-index') / 2;
            console.log(rating);
        })
    })
    stars.forEach(function (star) {
        $(star).on('mouseover', function (e) {
            stars.forEach(function (star2) {
                star2.style.backgroundImage = "url('/resources/img/user/star-white.svg')";
            });
            for (let i = 0; i < star.getAttribute('data-index'); i++) {
                stars[i].style.backgroundImage = "url('/resources/img/user/star-pink.svg')";
            }
        });
    });
    starBox.addEventListener("mouseleave", function () {
        // document.querySelectorAll(".screens-room-booking__modalContent__star").forEach(function (star) {
        stars.forEach(function (star) {
            star.style.backgroundImage = "url('/resources/img/user/star-white.svg')";
        });
        for (let i = 0; i < rating * 2; i++) {
            stars[i].style.backgroundImage = "url('/resources/img/user/star-pink.svg')";
        }
    });

    reviewWriteBtn.forEach(function (btn) {
        btn.addEventListener('click', function () {
            room_id2 = $(this).data('roomId');
            booking_id2 = $(this).data('bookingId')
            modalContainer.style.display = 'flex';
        });
    });

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            modalContainer.style.display = 'none';
            room_id2 = null;
            booking_id2 = null;
            review_stars2 = null;
            rating = 'null';
            $(`textarea[name="review_ctt"]`).val(null);
        }
    });

    function cancelInsertReview() {
        modalContainer.style.display = 'none';
        room_id2 = null;
        booking_id2 = null;
        review_stars2 = null;
        rating = 'null';
        $(`textarea[name="review_ctt"]`).val(null);
    }

    $(".screens-room-myBookings__modalContent__form").submit(function (event) {
        event.preventDefault();
        $(`input[name="review_stars"]`).val(rating);
        $(`input[name="room_id"]`).val(room_id2);
        $(`input[name="booking_id"]`).val(booking_id2);
        console.log("room_id : " + room_id2);
        console.log("booking_id : " + booking_id2);

        if ((!rating) || rating == "null") {
            alert("별점을 선택해주세요.")
        } else {
            this.submit();
            alert("리뷰 작성이 완료되었습니다.")
        }
    });

    //결제 상태에 따라 결제버튼 활성화 및 취소 기능 / css 변경
    document.addEventListener('DOMContentLoaded', function () {
        var reservations = document.querySelectorAll(
                '.screens-room-myBookings__comming-reservation__div');

        reservations.forEach(function (reservation) {
            const statusIdElement = reservation.querySelector(
                    '.screens-room-myBookings__comming-reservation__div__status_id');

            const statusId = reservation.querySelector(
                    '.screens-room-myBookings__comming-reservation__div__status_id').textContent.trim();
            const buttonDiv = reservation.querySelector(
                    '.screens-room-myBookings__payment-button-card-div');

            // 버튼 삭제하기
            if (statusId === '예약 신청' || statusId === '승인 대기') {
                removeButton(buttonDiv, 'screens-room-myBookings__payment-button-card');
                removeButton(buttonDiv, 'screens-room-myBookings__payment-button-kakao');
                removeButton(buttonDiv, 'screens-room-myBookings__refund-button');
            } else if (statusId === '결제 대기') {
                removeButton(buttonDiv, 'screens-room-myBookings__refund-button');
            } else if (statusId === '결제 완료') {
                removeButton(buttonDiv, 'screens-room-myBookings__cancel-button');
                removeButton(buttonDiv, 'screens-room-myBookings__payment-button-card');
                removeButton(buttonDiv, 'screens-room-myBookings__payment-button-kakao');
            } else if (statusId === '예약 반려' || statusId === '예약 취소') {
                const image = reservation.querySelector(
                        '.screens-room-myBookings__comming-reservation__main-photo');
                if (image) {
                    image.style.filter = 'grayscale(100%)';
                }

                if (statusIdElement) {
                    statusIdElement.style.color = 'gray';
                }
                removeAllButtons(buttonDiv);
            }
        });

        function removeButton(parentElement, className) {
            const buttonToRemove = parentElement.querySelector('.' + className);
            if (buttonToRemove) {
                buttonToRemove.parentNode.removeChild(buttonToRemove);
            }
        }

        function removeAllButtons(parentElement) {
            const buttons = parentElement.querySelectorAll('.screens-room-myBookings__button');
            buttons.forEach(function (button) {
                button.parentNode.removeChild(button);
            });
        }
    });

    //가격 원화 단위로 콤마 붙여주는 함수
    const priceToString = function (price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
    const payAmounts = Array.from(document.querySelectorAll(
            ".screens-room-myBookings__comming-reservation__pay-amount")
    )
    payAmounts.forEach((payAmount) => {
                payAmount.innerText = priceToString(payAmount.innerText);
            }
    )

</script>
<script src="/resources/js/payment/payment.js"></script>
</body>
</html>